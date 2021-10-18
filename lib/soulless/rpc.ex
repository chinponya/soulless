defmodule Soulless.RPC do
  @enforce_keys [:message, :request_module, :response_module, :namespace]
  defstruct [:client, :message, :request_module, :response_module, :namespace]

  def send(%Soulless.RPC{} = rpc, client) do
    case rpc.request_module.encode(rpc.message) do
      {:ok, bytes} ->
        WebSockex.cast(client, {:send, bytes, rpc.namespace, rpc.response_module})

      error ->
        error
    end
  end

  def fetch(%Soulless.RPC{} = rpc, client) do
    case rpc.request_module.encode(rpc.message) do
      {:ok, bytes} ->
        GenServer.call(client, {:send, bytes, rpc.namespace, rpc.response_module})

      error ->
        error
    end
  end
end
