defmodule Soulless.Game.Client do
  require Logger

  defmacro __using__(_opts) do
    quote do
      use GenServer
      require Logger

      def start_link(opts \\ []) do
        name = opts[:name] || __MODULE__
        uid = opts[:uid] || Application.fetch_env!(:soulless, :uid)
        access_token = opts[:access_token] || Application.fetch_env!(:soulless, :access_token)
        token_kind = opts[:token_kind] || Application.get_env(:soulless, :token_kind, :permanent)
        region = opts[:region] || Application.fetch_env!(:soulless, :region)

        state = %{
          name: name,
          uid: uid,
          access_token: access_token,
          token_kind: token_kind,
          region: region,
          status: :disconnected,
          reconnect_after: 5 * 60 * 1000
        }

        GenServer.start_link(__MODULE__, state, name: name)
      end

      @impl true
      def init(state) do
        send(self(), :spawn_child)
        {:ok, state}
      end

      @impl true
      def handle_info(:spawn_child, %{region: region, reconnect_after: reconnect_after} = state) do
        with {:ok, %{endpoint_url: endpoint_url, passport_url: passport_url, version: version}} <-
               Soulless.Game.Auth.endpoint(region),
             {:ok, child_pid} <-
               Soulless.Websocket.Client.start_link(
                 endpoint_url: endpoint_url,
                 parent_pid: self(),
                 protocol_module: Soulless.Game.Lq,
                 name: Module.concat([__MODULE__, Child])
               ) do
          Logger.info("#{__MODULE__} Spawned child #{inspect(child_pid)}")

          {:noreply,
           state
           |> Map.put(:status, :initialized)
           |> Map.put(:child_pid, child_pid)
           |> Map.put(:passport_url, passport_url)
           |> Map.put(:version, version)}
        else
          {:error, :maintenance} ->
            Logger.warn(
              "#{__MODULE__} Server is under maintenance. Retrying in #{reconnect_after / 1000}s"
            )

            Process.send_after(self(), :spawn_child, reconnect_after)
            {:noreply, state}

          {:error, reason} ->
            {:stop, reason, state}
        end
      end

      @impl true
      def handle_cast(
            :ready,
            %{
              uid: uid,
              access_token: access_token,
              token_kind: token_kind,
              passport_url: passport_url,
              version: version,
              child_pid: child_pid
            } = state
          ) do
        login_result =
          case token_kind do
            :permanent ->
              Soulless.Game.Client.full_login(uid, access_token, passport_url, version, child_pid)

            :transient ->
              Soulless.Game.Client.partial_login(uid, access_token, version, child_pid)
          end

        case login_result do
          {:ok, account} ->
            Logger.info("#{__MODULE__} Logged in as #{account.nickname}")
            GenServer.cast(self(), :logged_in)

            {:noreply,
             state
             |> Map.put(:status, :ready)
             |> Map.put(:account, account)}

          {:error, _reason} ->
            Logger.error("#{__MODULE__} login failed")
            {:stop, :login_failed, state}
        end
      end

      @impl true
      def handle_cast(:disconnected, state) do
        Logger.info("#{__MODULE__} disconnected")

        {:noreply, Map.put(state, :status, :disconnected)}
      end

      @impl true
      def handle_cast(:logged_in, state) do
        handle_ready(state)
      end

      @impl true
      def handle_cast({:response, message}, state) do
        handle_response(message, state)
      end

      @impl true
      def handle_cast({:notice, message}, state) do
        handle_notice(message, state)
      end

      @impl true
      def handle_cast(:ping, %{child_pid: child_pid} = state) do
        WebSockex.send_frame(child_pid, :ping)
        {:noreply, state}
      end

      @impl true
      def handle_cast({:send, _, _, _} = payload, %{child_pid: child_pid} = state) do
        GenServer.cast(child_pid, payload)
        {:noreply, state}
      end

      @impl true
      def handle_call({:send, _, _, _} = payload, from, %{child_pid: child_pid} = state) do
        send(child_pid, {:"$gen_call", from, payload})
        {:noreply, state}
      end

      # API
      def send(rpc) do
        # HACK this prevents users from spawning multiple processes using one module
        Soulless.RPC.send(rpc, Module.concat([__MODULE__, Child]))
      end

      def fetch(rpc) do
        # HACK this prevents users from spawning multiple processes using one module
        Soulless.RPC.fetch(rpc, Module.concat([__MODULE__, Child]))
      end

      # Our library callbacks with default implementations

      @callback handle_response(message :: term, state :: term) :: {:noreply, new_state :: term}
      def handle_response(message, state) do
        Logger.info("#{__MODULE__} Received response #{inspect(message)}")
        {:noreply, state}
      end

      @callback handle_notice(message :: term, state :: term) :: {:noreply, new_state :: term}
      def handle_notice(message, state) do
        Logger.info("#{__MODULE__} Received notice #{inspect(message)}")
        {:noreply, state}
      end

      @callback handle_ready(state :: term) :: {:noreply, new_state :: term}
      def handle_ready(state) do
        Logger.info("#{__MODULE__} Client ready")
        {:noreply, state}
      end

      defoverridable handle_response: 2,
                     handle_notice: 2,
                     handle_ready: 1
    end
  end

  def full_login(uid, access_token, passport_url, version, child_pid) do
    Logger.debug("#{__MODULE__} Logging in with UID #{uid}")

    with {:ok, passport} <- Soulless.Auth.get_passport(passport_url, uid, access_token),
         {:ok, login_response} <- ws_login(child_pid, uid, version, passport["accessToken"]) do
      {:ok, login_response.account}
    else
      error -> error
    end
  end

  def partial_login(uid, access_token, version, child_pid) do
    Logger.debug("#{__MODULE__} Logging in with UID #{uid}")

    with {:ok, login_response} <- ws_login(child_pid, uid, version, access_token) do
      {:ok, login_response.account}
    else
      error -> error
    end
  end

  defp ws_login(pid, uid, version, transient_token) do
    with {:ok, oauth2_token} <- fetch_ws_oauth2_token(pid, uid, version, transient_token) do
      ws_oauth2_login(pid, version, oauth2_token)
    end
  end

  defp fetch_ws_oauth2_token(pid, uid, version, transient_token) do
    response =
      %Soulless.Game.Lq.ReqOauth2Auth{
        type: 7,
        code: transient_token,
        uid: uid,
        client_version_string: "web-#{version}"
      }
      |> Soulless.Game.Service.Lobby.oauth2_auth()
      |> Soulless.RPC.fetch(pid)

    case is_nil(response.error) || response.error.code do
      true ->
        {:ok, response.access_token}

      error_code ->
        Logger.error("#{__MODULE__} Fetching Oauth2 token failed. Received: #{inspect(response)}")
        {:error, error_code}
    end
  end

  defp ws_oauth2_login(pid, version, ws_oauth2_token) do
    payload = %Soulless.Game.Lq.ReqOauth2Login{
      type: 7,
      access_token: ws_oauth2_token,
      device: %Soulless.Game.Lq.ClientDeviceInfo{
        platform: "pc",
        hardware: "pc",
        is_browser: true,
        os: "windows",
        os_version: "win10",
        sale_platform: "web",
        software: "Chrome",
        screen_width: 1280,
        screen_height: 720
      },
      random_key: UUID.uuid1(),
      currency_platforms: [2, 9],
      client_version: %Soulless.Game.Lq.ClientVersionInfo{
        resource: "#{version}.w"
      },
      client_version_string: "web-#{version}",
      gen_access_token: false,
      reconnect: false,
      version: 0
    }

    response =
      payload
      |> Soulless.Game.Service.Lobby.oauth2_login()
      |> Soulless.RPC.fetch(pid)

    if response.account do
      {:ok, response}
    else
      Logger.error("#{__MODULE__} Oauth2 login failed. Received: #{inspect(response)}")
      {:error, :login}
    end
  end
end
