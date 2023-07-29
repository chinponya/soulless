defmodule Soulless.Protocol.TourneyPacket do
  @behaviour Soulless.Protocol.GenericPacket

  use TypedStruct
  alias Soulless.Protocol.GenericPacket
  alias Soulless.Tourney.Lq
  alias Soulless.Tourney.Service

  typedstruct do
    field(:kind, GenericPacket.kind())
    field(:request_id, non_neg_integer() | nil)
    field(:rpc, String.t() | nil)
    field(:body, struct())
  end

  @spec serialize(__MODULE__.t()) :: nonempty_binary()
  def serialize(message) do
    generic_packet_message = %{message | __struct__: GenericPacket}
    GenericPacket.serialize(__MODULE__, generic_packet_message)
  end

  @spec parse(binary(), GenericPacket.cache()) ::
          {:ok, {__MODULE__.t(), GenericPacket.cache()}} | {:error, String.t()}
  def parse(binary, module_cache) do
    case GenericPacket.parse(__MODULE__, binary, module_cache) do
      {:ok, {message, new_module_cache}} ->
        {:ok, {%{message | __struct__: __MODULE__}, new_module_cache}}

      error ->
        error
    end
  end

  @impl GenericPacket
  def wrap_and_encode(rpc_name, body) do
    %Lq.Wrapper{name: rpc_name, data: body}
    |> Lq.Wrapper.encode!()
    |> :binary.list_to_bin()
  end

  @impl GenericPacket
  def decode_wrapper(body) do
    Lq.Wrapper.decode(body)
  end

  @impl GenericPacket
  def get_type_by_identifier(rpc_name) do
    Lq.get_type_by_identifier(rpc_name)
  end

  @impl GenericPacket
  def get_rpc_by_identifier(rpc_name) do
    Service.get_rpc_by_identifier(rpc_name)
  end

  @impl GenericPacket
  def pre_body_encode(body) do
    body
  end

  @impl GenericPacket
  def post_body_decode(body) do
    body
  end
end
