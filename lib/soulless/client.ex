defmodule Soulless.Client do
  defmacro __using__(_opts) do
    quote do
      use WebSockex
      require Logger

      def start_link(args \\ %{}) do
        name = args[:name] || __MODULE__
        uid = args[:uid] || Application.fetch_env!(:soulless, :uid)
        access_token = args[:access_token] || Application.fetch_env!(:soulless, :access_token)
        region = args[:region] || Application.fetch_env!(:soulless, :region)

        {endpoint, passport_url, version} = Soulless.Client.Auth.endpoint(region)

        state = %{
          next_request_id: 1,
          pending_requests: %{},
          version: version,
          passport_url: passport_url,
          uid: uid,
          access_token: access_token
        }

        WebSockex.start_link(
          endpoint,
          __MODULE__,
          state,
          name: name
        )
      end

      # Websocket callbacks
      @impl true
      def handle_connect(_conn, state) do
        Logger.info("Connected!")
        send(self(), :login)
        {:ok, update_heartbeat(state)}
      end

      @impl true
      def handle_disconnect(disconnect_map, state) do
        super(disconnect_map, state)
      end

      # Message types
      @notice 1
      @request 2
      @response 3

      # Handle requests
      def handle_info({:"$gen_call", from, message}, state) do
        handle_call(message, from, state)
      end

      def handle_info(:heartbeat, state) do
        Soulless.Service.Lobby.heatbeat()
        |> Soulless.RPC.send(self())

        {:ok, state}
      end

      def handle_call({:send, _, _, _} = message, from, state) do
        handle_request(message, from, state)
      end

      @impl true
      def handle_cast({:send, _, _, _} = message, state) do
        handle_request(message, nil, state)
      end

      defp handle_request(
             {:send, message, namespace, decoder_mod},
             from,
             %{next_request_id: next_request_id} = state
           ) do
        wrapper =
          %Soulless.Lq.Wrapper{name: namespace, data: :binary.list_to_bin(message)}
          |> Soulless.Lq.Wrapper.encode!()
          |> :binary.list_to_bin()

        message = <<@request, next_request_id::little-size(16)>> <> wrapper

        {:reply, {:binary, message},
         state
         |> update_heartbeat()
         |> increment_request_id()
         |> put_request(next_request_id, namespace, decoder_mod, from)}
      end

      # Handle response
      @impl true
      def handle_frame({:binary, <<@response::size(8), message::binary>>}, state) do
        <<req_id::little-size(16), wrapper::binary>> = message
        state = update_heartbeat(state)

        with {updated_state, {namespace, decoder_mod, from}} <- pop_request(state, req_id),
             {:ok, unwrapped} <- Soulless.Lq.Wrapper.decode(wrapper),
             {:ok, message} <- decoder_mod.decode(unwrapped.data) do
          case {namespace, message, from} do
            # HACK maybe there's a nicer way to handle this
            {_, %Soulless.Lq.ResOauth2Auth{}, nil} ->
              handle_login_response(message, updated_state)

            {_, %Soulless.Lq.ResOauth2Check{}, nil} ->
              handle_login_response(message, updated_state)

            {_, %Soulless.Lq.ResLogin{}, nil} ->
              handle_login_response(message, updated_state)

            {".lq.Lobby.heatbeat", message, nil} ->
              {:ok, updated_state}

            {_, message, nil} ->
              handle_response(message, updated_state)

            {_, message, from} ->
              GenServer.reply(from, message)
              {:ok, updated_state}
          end
        else
          {:error, reason} ->
            Logger.warn("Could not decode a message for with ID #{req_id}: #{inspect(reason)}")
            {:ok, state}

          _ ->
            Logger.warn("Received an unknown message with ID #{req_id}")
            {:ok, state}
        end
      end

      # Handle notice
      @impl true
      def handle_frame({:binary, <<@notice::size(8), message::binary>>}, state) do
        state = update_heartbeat(state)

        with {:ok, wrapper} <- Soulless.Lq.Wrapper.decode(message),
             {:ok, notice_mod} <- Soulless.get_module_by_identifier(wrapper.name),
             {:ok, notice} <- notice_mod.decode(wrapper.data) do
          handle_notice(notice, state)
        else
          {:error, reason} ->
            Logger.error("Could not decode notice: #{inspect(reason)}")
            {:ok, state}
        end
      end

      @impl true
      def handle_frame(response, state) do
        Logger.warn("Unhandled message: #{inspect(response)}")
        {:ok, state}
      end

      # OTP callbacks

      @impl true
      def handle_info(:login, state) do
        Logger.debug("Logging in with UID #{state[:uid]}")

        passport =
          Soulless.Client.Auth.get_passport(
            state[:passport_url],
            state[:uid],
            state[:access_token]
          )

        Soulless.Service.Lobby.oauth2Auth(%Soulless.Lq.ReqOauth2Auth{
          type: 8,
          code: passport["accessToken"],
          uid: passport["uid"],
          client_version_string: "web-#{state[:version]}"
        })
        |> Soulless.RPC.send(self())

        {:ok, state}
      end

      @impl true
      def handle_info(:ready, state) do
        handle_ready(state)
      end

      # Auth flow

      defp handle_login_response(
             %Soulless.Lq.ResOauth2Auth{} = message,
             %{version: version} = state
           ) do
        Logger.debug("Obtained oauth2 token: #{inspect(message)}")

        payload = %Soulless.Lq.ReqOauth2Login{
          type: 8,
          access_token: message.access_token,
          device: %Soulless.Lq.ClientDeviceInfo{
            platform: "pc",
            hardware: "pc",
            is_browser: true,
            os: "windows",
            os_version: "win10",
            sale_platform: "web",
            software: "Chrome"
          },
          random_key: UUID.uuid1(),
          currency_platforms: [2, 9],
          client_version: %Soulless.Lq.ClientVersionInfo{
            resource: "#{version}.w"
          },
          client_version_string: "web-#{version}",
          gen_access_token: false,
          reconnect: false,
          version: 0
        }

        Soulless.Service.Lobby.oauth2Login(payload)
        |> Soulless.RPC.send(self())

        {:ok, state}
      end

      defp handle_login_response(%Soulless.Lq.ResOauth2Check{} = _message, state) do
        # TODO implement
        {:ok, state}
      end

      defp handle_login_response(%Soulless.Lq.ResLogin{} = message, state) do
        Logger.debug("Login attempt response: #{inspect(message)}")
        Logger.info("Logged in as #{message.account.nickname}")
        send(self(), :ready)
        {:ok, Map.put(state, :login, message)}
      end

      # Helpers

      defp update_heartbeat(state, time \\ 30_000) do
        :ok =
          case Map.get(state, :timer_ref) do
            nil -> :ok
            timer_ref -> cancel_timer(timer_ref)
          end

        timer_ref = Process.send_after(self(), :heartbeat, time)
        Map.put(state, :timer_ref, timer_ref)
      end

      defp cancel_timer(ref) do
        # Flush the mailbox if we failed to cancel the timer
        case Process.cancel_timer(ref) do
          i when is_integer(i) ->
            :ok

          false ->
            receive do
              :timeout -> :ok
            after
              0 -> :ok
            end
        end
      end

      defp increment_request_id(state) do
        Map.update(state, :next_request_id, 0, fn next_request_id ->
          next_request_id + 1
        end)
      end

      defp put_request(state, request_id, namespace, decoder_mod, from) do
        Map.update(
          state,
          :pending_requests,
          %{},
          fn pending_requests ->
            Map.put(pending_requests, request_id, {namespace, decoder_mod, from})
          end
        )
      end

      defp pop_request(%{pending_requests: pending_requests} = state, request_id) do
        {contents, updated_requests} = Map.pop(pending_requests, request_id)
        updated_state = Map.put(state, :pending_requests, updated_requests)
        {updated_state, contents}
      end

      # API
      def send(rpc) do
        Soulless.RPC.send(rpc, __MODULE__)
      end

      def fetch(rpc) do
        Soulless.RPC.fetch(rpc, __MODULE__)
      end

      # Our library callbacks with default implementations

      @callback handle_response(message :: term, state :: term) ::
                  {:ok, new_state}
                  | {:reply, WebSockex.frame(), new_state}
                  | {:close, new_state}
                  | {:close, WebSockex.close_frame(), new_state}
                when new_state: term
      def handle_response(message, state) do
        Logger.info("Received response #{inspect(message)}")
        {:ok, state}
      end

      @callback handle_notice(message :: term, state :: term) ::
                  {:ok, new_state}
                  | {:reply, WebSockex.frame(), new_state}
                  | {:close, new_state}
                  | {:close, WebSockex.close_frame(), new_state}
                when new_state: term

      def handle_notice(message, state) do
        Logger.info("Received notice #{inspect(message)}")
        {:ok, state}
      end

      @callback handle_ready(conn :: WebSockex.Conn.t(), state :: term) ::
                  {:ok, new_state :: term}
      def handle_ready(state) do
        Logger.info("Client ready")
        {:ok, state}
      end

      defoverridable handle_response: 2,
                     handle_notice: 2,
                     handle_ready: 1,
                     handle_disconnect: 2
    end
  end
end
