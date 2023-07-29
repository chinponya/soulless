defmodule Soulless.Protocol.SpectatorPacket do
  use TypedStruct

  typedstruct enforce: true do
    field(:request_id, non_neg_integer())
    field(:offset_time, non_neg_integer())
    field(:ended, boolean())
    field(:category, non_neg_integer())
    field(:length, non_neg_integer())
    field(:body, struct())
  end

  typedstruct module: Raw, enforce: true do
    field(:request_id, non_neg_integer())
    field(:offset_time, non_neg_integer())
    field(:ended, non_neg_integer())
    field(:category, non_neg_integer())
    field(:length, non_neg_integer())
    field(:body, binary())
  end

  @spec serialize(__MODULE__.t()) :: binary()
  def serialize(message) do
    ended = if message.ended, do: 1, else: 0
    module = message.body.__struct__

    body =
      message.body
      |> module.encode!()
      |> :binary.list_to_bin()

    name =
      module
      |> Module.split()
      |> List.last()

    wrapper =
      %Soulless.Game.Lq.Wrapper{name: ".lq.#{name}", data: body}
      |> Soulless.Game.Lq.Wrapper.encode!()
      |> :binary.list_to_bin()

    <<
      message.request_id::little-size(16),
      message.offset_time::little-size(32),
      ended::little-size(16),
      message.category::little-size(16),
      message.length::little-size(32),
      wrapper::binary
    >>
  end

  @spec parse(binary()) :: {:ok, __MODULE__.t()} | {:error, String.t()}
  def parse(binary) do
    with {:ok, raw_packet} <- parse_raw_packet(binary),
         {:ok, payload} <- unwrap_packet(raw_packet) do
      packet = %__MODULE__{
        request_id: raw_packet.request_id,
        offset_time: raw_packet.offset_time,
        ended: raw_packet.ended > 0,
        category: raw_packet.category,
        length: raw_packet.length,
        body: payload
      }

      {:ok, packet}
    end
  end

  @spec parse_raw_packet(binary()) :: {:ok, __MODULE__.Raw.t()} | {:error, String.t()}
  def parse_raw_packet(binary) do
    case binary do
      <<
        request_id::little-size(16),
        offset_time::little-size(32),
        ended::little-size(16),
        category::little-size(16),
        length::little-size(32),
        body::binary
      >> ->
        {:ok,
         %__MODULE__.Raw{
           request_id: request_id,
           offset_time: offset_time,
           ended: ended,
           category: category,
           length: length,
           body: body
         }}

      _ ->
        {:error, "invalid packet shape"}
    end
  end

  @spec unwrap_packet(__MODULE__.Raw.t()) :: {:ok, struct()} | {:error, String.t()}
  defp unwrap_packet(raw_packet) do
    with {:ok, wrapper} <- Soulless.Game.Lq.Wrapper.decode(raw_packet.body),
         {:ok, module} <- Soulless.Game.Lq.get_type_by_identifier(wrapper.name),
         {:ok, body} <- module.decode(wrapper.data) do
      {:ok, body}
    end
  end
end
