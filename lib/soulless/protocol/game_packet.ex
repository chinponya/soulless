defmodule Soulless.Protocol.GamePacket do
  @behaviour Soulless.Protocol.GenericPacket

  use TypedStruct
  alias Soulless.Protocol.GenericPacket
  alias Soulless.Game.Lq
  alias Soulless.Game.Lq.ActionPrototype
  alias Soulless.Game.Service

  typedstruct do
    field(:kind, GenericPacket.kind())
    field(:request_id, non_neg_integer() | nil)
    field(:rpc, String.t() | nil)
    field(:body, struct())
  end

  @spec serialize(__MODULE__.t(), GenericPacket.cache()) :: {nonempty_binary(), GenericPacket.cache()}
  def serialize(message, module_cache) do
    generic_packet_message = %{message | __struct__: GenericPacket}
    GenericPacket.serialize(__MODULE__, generic_packet_message, module_cache)
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
    maybe_wrap_action(body)
  end

  @impl GenericPacket
  def post_body_decode(body) do
    maybe_unwrap_action(body)
  end

  @spec maybe_wrap_action(struct()) :: struct()
  defp maybe_wrap_action(body) do
    case body do
      %ActionPrototype{} -> wrap_action(body)
      _ -> body
    end
  end

  @spec wrap_action(ActionPrototype.t()) :: ActionPrototype.t()
  defp wrap_action(action_prototype) do
    identifier = ".lq.#{action_prototype.name}"
    {:ok, module} = Soulless.Game.Lq.get_type_by_identifier(identifier)
    data = action_prototype.data |> module.encode!() |> :binary.list_to_bin()
    encoded_data = encode_action(data)
    %ActionPrototype{action_prototype | data: encoded_data}
  end

  @spec maybe_unwrap_action(struct()) :: {:ok, struct()} | {:error, String.t()}
  defp maybe_unwrap_action(body) do
    case body do
      %ActionPrototype{} -> unwrap_action(body)
      _ -> {:ok, body}
    end
  end

  @spec unwrap_action(ActionPrototype.t()) :: {:ok, ActionPrototype.t()} | {:error, String.t()}
  defp unwrap_action(action_prototype) do
    identifier = ".lq.#{action_prototype.name}"
    action_data = decode_action(action_prototype.data)

    with {:ok, module} <- Soulless.Game.Lq.get_type_by_identifier(identifier),
         {:ok, data} <- module.decode(action_data) do
      {:ok, %ActionPrototype{action_prototype | data: data}}
    end
  end

  @spec encode_action(binary()) :: binary()
  defp encode_action(action_bin) do
    # source: window.view.DesktopMgr.EnDecode
    #
    # let key = [132,94,78,66,57,162,31,96,28]
    # for (let index=0; index < input.byteLength; index++) {
    #     let i = (23 ^ input.byteLength) + 5 * index + key[index % key.length] & 255;
    #     console.log(i)
    #     input[index] ^= i;
    # }
    key = [132, 94, 78, 66, 57, 162, 31, 96, 28]
    action_size = byte_size(action_bin)
    key_length = Enum.count(key)

    action_bin
    |> :binary.bin_to_list()
    |> Enum.with_index()
    |> Enum.map(fn {byte, index} ->
      key_at_index = Enum.at(key, rem(index, key_length))
      i = Bitwise.band(Bitwise.bxor(23, action_size) + 5 * index + key_at_index, 255)
      Bitwise.bxor(byte, i)
    end)
    |> :binary.list_to_bin()
  end

  @spec decode_action(binary()) :: binary()
  defp decode_action(action_bin) do
    encode_action(action_bin)
  end
end
