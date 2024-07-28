defmodule Soulless.Protocol.Packet do
  alias Soulless.Protocol.GamePacket
  alias Soulless.Protocol.SpectatorRPC
  alias Soulless.Protocol.SpectatorPacket

  @type cache :: %{non_neg_integer() => atom() | String.t()}

  @spec parse(binary(), boolean(), boolean(), cache()) ::
          {:ok, {GamePacket.t(), cache()}}
          | {:ok, {SpectatorPacket.t(), cache()}}
          | {:ok, {SpectatorRPC.t(), cache()}}
          | {:error, String.t()}
  def parse(binary, is_spectator, is_binary, module_cache) do
    case {is_spectator, is_binary} do
      {false, true} -> GamePacket.parse(binary, module_cache)
      {true, false} -> SpectatorRPC.parse(binary, module_cache)
      {true, true} -> spectator_packet_with_cache(binary, module_cache)
      _ -> {:error, "unknown protocol"}
    end
  end

  defp spectator_packet_with_cache(binary, module_cache) do
    case SpectatorPacket.parse(binary) do
      {:ok, packet} -> {:ok, {packet, module_cache}}
      error -> error
    end
  end
end
