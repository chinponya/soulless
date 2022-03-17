defmodule Soulless.MockServer.Socket do
  @behaviour :cowboy_websocket
  require Logger

  alias Soulless.Game.Lq
  alias Soulless.MockServer.Repo

  # Wire message types
  @notice 1
  @request 2
  @response 3

  def init(request, _opts) do
    Logger.info("#{__MODULE__} new peer #{inspect(request.peer)}")

    {:cowboy_websocket, request, %{}}
  end

  def websocket_init(state) do
    state =
      state
      |> Map.put_new(:service_module, Soulless.Game.Service)
      |> Map.put_new(:wrapper_module, Soulless.Game.Lq.Wrapper)

    {:ok, state}
  end

  def websocket_handle(:ping, state) do
    {:reply, :pong, state}
  end

  # Handle MJS requests
  def websocket_handle(
        {:binary, <<@request::size(8), message::binary>>},
        %{
          service_module: service_module,
          wrapper_module: wrapper_module
        } = state
      ) do
    # Messages are prepended with request ID which we need to include in the reply
    <<request_id::little-size(16), wrapper::binary>> = message

    with {:ok, wrapper} <- wrapper_module.decode(wrapper),
         {:ok, rpc_mod} <- service_module.get_module_by_identifier(wrapper.name),
         {:ok, request} <- rpc_mod[:request].decode(wrapper.data) do
      case handle_request(wrapper.name, request, state) do
        {:reply, response, new_state} ->
          response_encoded = rpc_mod[:response].encode!(response)

          response_wrapped =
            wrapper_module.__struct__(
              name: wrapper.name,
              data: :binary.list_to_bin(response_encoded)
            )
            |> wrapper_module.encode!()
            |> :binary.list_to_bin()

          response_binary = <<@response, request_id::little-size(16)>> <> response_wrapped

          {:reply, {:binary, response_binary}, new_state}

        _ ->
          Logger.warning("#{__MODULE__} Unhandled request '#{wrapper.name}': #{inspect(request)}")
          {:ok, state}
      end
    else
      {:error, reason} ->
        Logger.error("#{__MODULE__} Could not decode notice: #{inspect(reason)}")
        {:ok, state}
    end
  end

  # Ignore everything else
  def websocket_handle(_message, state) do
    {:ok, state}
  end

  # Format and forward elixir messages to client
  def websocket_info(message, state) do
    {:reply, {:text, message}, state}
  end

  def websocket_terminate(_reason, _state) do
    :ok
  end

  def handle_request(".lq.Lobby.heatbeat", %Lq.ReqHeatBeat{}, state) do
    {:reply, %Lq.ResCommon{}, state}
  end

  def handle_request(".lq.Lobby.oauth2Auth", %Lq.ReqOauth2Auth{} = message, state) do
    response =
      case Repo.create_session_token(message.uid, message.code) do
        {:ok, session_token} ->
          %Lq.ResOauth2Auth{access_token: session_token}

        {:error, _reason} ->
          %Lq.ResOauth2Auth{error: %Lq.Error{code: :OAUTH2_EXPIRED}}
      end

    {:reply, response, state}
  end

  def handle_request(".lq.Lobby.oauth2Check", %Lq.ReqOauth2Check{} = message, state) do
    response =
      case Repo.verify_session(message.access_token) do
        {:ok, _uid} ->
          %Lq.ResOauth2Check{has_account: true}

        {:error, _reason} ->
          %Lq.ResOauth2Check{error: %Lq.Error{code: :OAUTH2_EXPIRED}}
      end

    {:reply, response, state}
  end

  def handle_request(".lq.Lobby.oauth2Login", %Lq.ReqOauth2Login{} = message, state) do
    response =
      case Repo.verify_session(message.access_token) do
        {:ok, uid} ->
          {uid, ""} = Integer.parse(uid)
          %Lq.ResLogin{account_id: uid, account: %Lq.Account{account_id: uid}}

        {:error, _reason} ->
          %Lq.ResLogin{error: %Lq.Error{code: :OAUTH2_EXPIRED}}
      end

    {:reply, response, state}
  end

  def handle_request(_rpc_name, _message, state) do
    {:ok, state}
  end
end
