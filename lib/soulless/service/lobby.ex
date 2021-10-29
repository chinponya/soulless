defmodule Soulless.Service.Lobby do
  use Soulless.RPC,
    file: "priv/protos/majsoul.proto",
    service: "Lobby",
    namespace: Soulless

  def heatbeat() do
    heatbeat(%Soulless.Lq.ReqHeatBeat{no_operation_counter: 1})
  end
end
