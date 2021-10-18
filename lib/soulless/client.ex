defmodule Soulless.Client do
  defmacro __using__(_opts) do
    quote do
      use WebSockex
      require Logger
      alias Soulless.Lq

      def start_link(args \\ %{}) do
        name = args[:name] || __MODULE__
        uid = args[:uid] || Application.fetch_env!(:soulless, :uid)
        access_token = args[:access_token] || Application.fetch_env!(:soulless, :access_token)
        region = args[:region] || Application.fetch_env!(:soulless, :region)

        {endpoint, passport_url, version} = endpoint(region)

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
        {:ok, state}
      end

      @impl true
      def handle_disconnect(%{reason: {:local, reason}}, state) do
        Logger.info("Local close with reason: #{inspect(reason)}")
        {:ok, state}
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
          %Lq.Wrapper{name: namespace, data: :binary.list_to_bin(message)}
          |> Lq.Wrapper.encode!()
          |> :binary.list_to_bin()

        message = <<@request, next_request_id::little-size(16)>> <> wrapper

        Logger.debug("Sending message: #{inspect(message)}")

        {:reply, {:binary, message},
         state
         |> increment_request_id()
         |> put_request(next_request_id, namespace, decoder_mod, from)}
      end

      # Handle response
      @impl true
      def handle_frame({:binary, <<@response::size(8), message::binary>>}, state) do
        <<req_id::little-size(16), wrapper::binary>> = message
        Logger.debug("Received raw message: #{inspect(message)}")

        with {updated_state, {_namespace, decoder_mod, from}} <- pop_request(state, req_id),
             {:ok, message} <- decoder_mod.decode(wrapper) do
          case {message, from} do
            # HACK maybe there's a nicer way to handle this
            {%Lq.ResOauth2Auth{}, nil} ->
              handle_login_response(message, updated_state)

            {%Lq.ResOauth2Check{}, nil} ->
              handle_login_response(message, updated_state)

            {%Lq.ResLogin{}, nil} ->
              handle_login_response(message, updated_state)

            {message, nil} ->
              handle_response(message, updated_state)

            {message, from} ->
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
        Logger.debug("Received raw notice: #{inspect(message)}")

        with {:ok, wrapper} <- Lq.Wrapper.decode(message),
             {:ok, notice_mod} <- Soulless.Notice.get_by_notice_name(wrapper.name),
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
        login(self(), state[:passport_url], state[:uid], state[:access_token], state[:version])
        {:ok, state}
      end

      @impl true
      def handle_info(:ready, state) do
        handle_ready(state)
      end

      # Auth flow

      defp base_url(:en) do
        "https://mahjongsoul.game.yo-star.com"
      end

      defp version_url(region) do
        "#{base_url(region)}/version.json"
      end

      defp config_url(region, version) do
        "#{base_url(region)}/v#{version}/config.json"
      end

      defp endpoint(:en = region) do
        with {:ok, version_response} <- HTTPoison.get(version_url(region)),
             {:ok, version_json} <- Jason.decode(version_response.body),
             {:ok, config_response} <- HTTPoison.get(config_url(region, version_json["version"])),
             {:ok, config_json} <- Jason.decode(config_response.body),
             {:ok, servers_response} <- HTTPoison.get(server_list_url_from_config(config_json)),
             {:ok, servers_json} <- Jason.decode(servers_response.body) do
          {
            "wss://#{List.first(servers_json["servers"])}",
            "#{List.first(config_json["yo_service_url"])}/user/login",
            String.trim_trailing(version_json["version"], ".w")
          }
        else
          {:error, reason} ->
            Logger.error("Could not retrieve endpoint: #{inspect(reason)}")
            {:error, reason}
        end
      end

      defp endpoint(region) do
        raise "Authentication flow for region '#{String.to_atom(region)}' is not supported"
      end

      defp server_list_url_from_config(config_json) do
        config_json
        |> Map.get("ip")
        |> List.first()
        |> Map.get("region_urls")
        |> List.first()
        |> Map.get("url")
        |> Kernel.<>("?service=ws-gateway&protocol=ws&ssl=true")
      end

      defp login(pid, passport_url, uid, access_token, version) do
        headers = [{"Content-type", "application/json"}, {"Accept", "application/json"}]
        body = Jason.encode!(%{uid: uid, token: access_token, deviceId: "web|#{uid}"})

        response = HTTPoison.post!(passport_url, body, headers)
        passport = Jason.decode!(response.body)

        Logger.debug("Obtained passport: #{inspect(passport)}")

        Soulless.Lobby.oauth2Auth(pid, %Lq.ReqOauth2Auth{
          type: 8,
          code: passport["accessToken"],
          uid: passport["uid"],
          client_version_string: "web-#{version}"
        })
      end

      defp handle_login_response(%Lq.ResOauth2Auth{} = message, %{version: version} = state) do
        Logger.debug("Obtained oauth2 token: #{inspect(message)}")
        # HACK For some reason the decoded access token contains
        # two bytes at the beginning that get rejected by the server
        # There's a possibility that the decoder does something wrong
        <<_::size(16), access_token::binary>> = message.access_token

        payload = %Lq.ReqOauth2Login{
          type: 8,
          access_token: access_token,
          device: %Lq.ClientDeviceInfo{
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
          client_version: %Lq.ClientVersionInfo{
            resource: "#{version}.w"
          },
          client_version_string: "web-#{version}",
          gen_access_token: false,
          reconnect: false,
          version: 0
        }

        Soulless.Lobby.oauth2Login(self(), payload)
        {:ok, state}
      end

      defp handle_login_response(%Lq.ResOauth2Check{} = _message, state) do
        # TODO implement
        {:ok, state}
      end

      defp handle_login_response(%Lq.ResLogin{} = message, state) do
        Logger.debug("Login attempt response: #{inspect(message)}")
        Logger.info("Logged in as #{message.account.nickname}")
        send(self(), :ready)
        {:ok, Map.put(state, :login, message)}
      end

      # Helpers

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
