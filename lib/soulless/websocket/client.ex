defmodule Soulless.Websocket.Client do
  use WebSockex
  require Logger

  # Wire message types
  @notice 1
  @request 2
  @response 3

  def start_link(opts) do
    user_agent = Keyword.get(opts, :user_agent, Soulless.HTTP.default_user_agent())

    user_agent = opts[:user_agent] || default_user_agent

    case opts[:protocol_module].get_type_by_identifier(".lq.Wrapper") do
      {:ok, wrapper_module} ->
        state = %{
          next_request_id: 1,
          pending_requests: %{},
          parent_pid: opts[:parent_pid],
          protocol_module: opts[:protocol_module],
          wrapper_module: wrapper_module
        }

        WebSockex.start_link(opts[:endpoint_url], __MODULE__, state,
          name: opts[:name],
          extra_headers: [{"User-Agent", user_agent}]
        )

      error ->
        error
    end
  end

  # Websocket callbacks
  @impl true
  def handle_connect(_conn, %{parent_pid: parent_pid} = state) do
    GenServer.cast(parent_pid, :ready)
    {:ok, update_heartbeat(state)}
  end

  @impl true
  def handle_disconnect(disconnect_map, %{parent_pid: parent_pid} = state) do
    Logger.warn("#{__MODULE__} disconnected: #{inspect(disconnect_map)}")
    GenServer.cast(parent_pid, :disconnected)
    Process.sleep(60_000)
    {:reconnect, state}
  end

  # Handle requests
  def handle_info({:"$gen_call", from, message}, state) do
    handle_call(message, from, state)
  end

  def handle_info({:"$gen_cast", message}, state) do
    handle_cast(message, state)
  end

  @impl true
  def handle_info(:ready, %{parent_pid: parent_pid} = state) do
    send(parent_pid, :ready)
    {:ok, state}
  end

  def handle_info(:heartbeat, state) do
    {:reply, :ping, update_heartbeat(state)}
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
         %{next_request_id: next_request_id, wrapper_module: wrapper_module} = state
       ) do
    wrapper =
      wrapper_module.__struct__(name: namespace, data: :binary.list_to_bin(message))
      |> wrapper_module.encode!()
      |> :binary.list_to_bin()

    message = <<@request, next_request_id::little-size(16)>> <> wrapper

    {:reply, {:binary, message},
     state
     |> increment_request_id()
     |> put_request(next_request_id, namespace, decoder_mod, from)}
  end

  # Handle response
  @impl true
  def handle_frame(
        {:binary, <<@response::size(8), message::binary>>},
        %{parent_pid: parent_pid, wrapper_module: wrapper_module} = state
      ) do
    <<req_id::little-size(16), wrapper::binary>> = message

    with {updated_state, {_namespace, decoder_mod, from}} <- pop_request(state, req_id),
         {:ok, unwrapped} <- wrapper_module.decode(wrapper),
         {:ok, message} <- decoder_mod.decode(unwrapped.data) do
      if is_nil(from) do
        GenServer.cast(parent_pid, {:response, message})
      else
        GenServer.reply(from, message)
      end

      {:ok, updated_state}
    else
      {:error, reason} ->
        Logger.warn(
          "#{__MODULE__} Could not decode a message for with ID #{req_id}: #{inspect(reason)}"
        )

        {:ok, state}

      _ ->
        Logger.warn("#{__MODULE__} Received an unknown message with ID #{req_id}")
        {:ok, state}
    end
  end

  # Handle notice
  @impl true
  def handle_frame(
        {:binary, <<@notice::size(8), message::binary>>},
        %{
          parent_pid: parent_pid,
          wrapper_module: wrapper_module,
          protocol_module: protocol_module
        } = state
      ) do
    with {:ok, wrapper} <- wrapper_module.decode(message),
         {:ok, notice_mod} <- protocol_module.get_rpc_by_identifier(wrapper.name),
         {:ok, notice} <- notice_mod.decode(wrapper.data) do
      :ok = GenServer.cast(parent_pid, {:notice, notice})
      {:ok, state}
    else
      {:error, reason} ->
        Logger.error("#{__MODULE__} Could not decode notice: #{inspect(reason)}")
        {:ok, state}
    end
  end

  @impl true
  def handle_frame(response, state) do
    Logger.warn("#{__MODULE__} Unhandled message: #{inspect(response)}")
    {:ok, state}
  end

  @impl true
  def handle_ping(:ping, state) do
    {:reply, :pong, update_heartbeat(state)}
  end

  def handle_ping({:ping, message}, state) do
    {:reply, {:pong, message}, update_heartbeat(state)}
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
end
