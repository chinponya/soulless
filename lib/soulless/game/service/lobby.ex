defmodule Soulless.Game.Service.Lobby do
  use Soulless.RPC,
    file: "priv/protos/majsoul.proto",
    service: "Lobby",
    namespace: Soulless.Game,
    packet_type: Soulless.Protocol.GamePacket

  def heatbeat() do
    heatbeat(%Soulless.Game.Lq.ReqHeatBeat{no_operation_counter: 1})
  end
end
