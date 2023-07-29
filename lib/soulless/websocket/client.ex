defmodule Soulless.Websocket.Client do
  use WebSockex
  require Logger

  def start_link(opts) do
    user_agent = Keyword.get(opts, :user_agent, Soulless.HTTP.default_user_agent())
    parse = Keyword.fetch!(opts, :parse)
    serialize = Keyword.fetch!(opts, :serialize)

    state = %{
      next_request_id: 1,
      pending_requests: %{},
      module_cache: %{},
      parent_pid: opts[:parent_pid],
      parse: parse,
      serialize: serialize
    }

    WebSockex.start_link(opts[:endpoint_url], __MODULE__, state,
      name: opts[:name],
      extra_headers: [{"User-Agent", user_agent}]
    )
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

  def handle_call({:send, _} = message, from, state) do
    handle_request(message, from, state)
  end

  @impl true
  def handle_cast({:send, _} = message, state) do
    handle_request(message, nil, state)
  end

  defp handle_request({:send, packet}, from, state) do
    {raw_packet, module_cache} =
      packet
      |> Map.put(:request_id, state.next_request_id)
      |> state.serialize.(state.module_cache)

    pending_requests = Map.put(state.pending_requests, state.next_request_id, from)

    new_state =
      state
      |> increment_request_id()
      |> Map.put(:module_cache, module_cache)
      |> Map.put(:pending_requests, pending_requests)

    {:reply, {:binary, raw_packet}, new_state}
  end

  @impl true
  def handle_frame({:binary, raw_packet}, state) do
    with {:ok, {packet, module_cache}} <-
           state.parse.(raw_packet, state.module_cache) do
      {from, pending_requests} = Map.pop(state.pending_requests, packet.request_id)

      if is_nil(from) do
        GenServer.cast(state.parent_pid, {packet.kind, packet})
      else
        GenServer.reply(from, packet)
      end

      new_state =
        state
        |> Map.put(:module_cache, module_cache)
        |> Map.put(:pending_requests, pending_requests)

      {:ok, new_state}
    else
      {:error, reason} ->
        Logger.warn("#{__MODULE__} Could not decode packet: #{inspect(reason)}")

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
end
