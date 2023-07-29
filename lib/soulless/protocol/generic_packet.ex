defmodule Soulless.Protocol.GenericPacket do
  use TypedStruct

  @type kind :: :notice | :request | :response
  @type kind_or_unknown :: :notice | :request | :response | :unknown
  @type rpc :: [
          request_module: lq_module :: module(),
          response_module: lq_module :: module()
        ]
  @type rpc_name :: String.t()
  @type cache :: %{non_neg_integer() => module() | rpc()}

  @callback wrap_and_encode(rpc_name(), body :: binary()) :: binary()

  @callback decode_wrapper(body :: binary()) ::
              {:ok, struct()} | {:error, any()}

  @callback get_type_by_identifier(rpc_name()) ::
              {:ok, lq_module :: module()} | {:error, String.t()}

  @callback get_rpc_by_identifier(rpc_name()) :: {:ok, rpc} | {:error, error :: String.t()}

  @callback pre_body_encode(body :: struct()) :: struct()

  @callback post_body_decode(body :: struct()) ::
              {:ok, struct()} | {:error, any()}

  typedstruct do
    field(:kind, kind())
    field(:request_id, non_neg_integer() | nil)
    field(:rpc, rpc_name() | nil)
    field(:body, struct())
  end

  typedstruct module: Raw do
    field(:kind, Soulless.Protocol.Packet.kind_or_unknown())
    field(:request_id, non_neg_integer() | nil)
    field(:body, binary())
  end

  @spec serialize(module(), __MODULE__.t(), cache()) :: {nonempty_binary(), cache()}
  def serialize(callback_module, message, module_cache) do
    kind =
      case message.kind do
        :notice -> 1
        :request -> 2
        :response -> 3
        _ -> raise "invalid message kind"
      end

    to_cache =
      case message.kind do
        :notice ->
          callback_module.get_type_by_identifier(message.rpc)

        :request ->
          callback_module.get_rpc_by_identifier(message.rpc)

        :response ->
          if is_nil(message.rpc) do
            Map.fetch(module_cache, message.request_id)
          else
            callback_module.get_rpc_by_identifier(message.rpc)
          end
      end

    new_module_cache =
      case to_cache do
        {:ok, to_cache_value} -> Map.put(module_cache, message.request_id, to_cache_value)
        _ -> module_cache
      end

    module = message.body.__struct__

    body =
      message.body
      |> callback_module.pre_body_encode()
      |> module.encode!()
      |> :binary.list_to_bin()

    wrapper = callback_module.wrap_and_encode(message.rpc, body)

    binary =
      case message.kind do
        :notice ->
          <<kind::size(8), wrapper::binary>>

        _ ->
          <<kind::size(8), message.request_id::little-size(16), wrapper::binary>>
      end

    {binary, new_module_cache}
  end

  @spec parse(module(), binary(), cache()) ::
          {:ok, {__MODULE__.t(), cache()}} | {:error, String.t()}
  def parse(callback_module, binary, module_cache) do
    with {:ok, raw_packet} <- parse_raw_packet(binary),
         {:ok, {payload, rpc, new_module_cache}} <-
           unwrap_packet(callback_module, raw_packet, module_cache) do
      packet = %__MODULE__{
        kind: raw_packet.kind,
        request_id: raw_packet.request_id,
        rpc: rpc,
        body: payload
      }

      {:ok, {packet, new_module_cache}}
    end
  end

  @spec parse_raw_packet(binary()) ::
          {:ok, __MODULE__.Raw.t()} | {:error, String.t()}
  def parse_raw_packet(binary) do
    case binary do
      # notices do not have a request ID
      <<1::size(8), body::binary>> ->
        {:ok,
         %__MODULE__.Raw{
           kind: packet_kind_to_atom(1),
           request_id: nil,
           body: body
         }}

      <<kind::size(8), req_id::little-size(16), body::binary>> ->
        {:ok,
         %__MODULE__.Raw{
           kind: packet_kind_to_atom(kind),
           request_id: req_id,
           body: body
         }}

      _ ->
        {:error, "invalid packet shape"}
    end
  end

  @spec packet_kind_to_atom(byte()) :: kind_or_unknown()
  defp packet_kind_to_atom(kind) do
    case kind do
      1 -> :notice
      2 -> :request
      3 -> :response
      _ -> :unknown
    end
  end

  @spec unwrap_packet(module(), __MODULE__.Raw.t(), cache()) ::
          {:ok, {struct(), String.t(), cache()}} | {:error, String.t()}
  defp unwrap_packet(callback_module, raw_packet, module_cache) do
    with {:ok, wrapper} <- callback_module.decode_wrapper(raw_packet.body),
         {:ok, {body, rpc, new_module_cache}} <-
           unwrap_packet_body(
             callback_module,
             raw_packet.kind,
             raw_packet.request_id,
             wrapper,
             module_cache
           ),
         {:ok, body} <- callback_module.post_body_decode(body) do
      {:ok, {body, rpc, new_module_cache}}
    end
  end

  @spec unwrap_packet_body(
          module(),
          kind_or_unknown(),
          non_neg_integer(),
          Wrapper.t(),
          cache()
        ) ::
          {:ok, {struct(), rpc_name(), cache()}} | {:error, String.t()}
  defp unwrap_packet_body(
         callback_module,
         kind,
         request_id,
         wrapper,
         module_cache
       ) do
    case kind do
      :request ->
        unwrap_request_packet(
          callback_module,
          request_id,
          wrapper,
          module_cache
        )

      :response ->
        unwrap_response_packet(request_id, wrapper, module_cache)

      :notice ->
        unwrap_notice_packet(callback_module, wrapper, module_cache)

      _ ->
        {:error, "unsupported packet kind"}
    end
  end

  @spec unwrap_request_packet(module(), non_neg_integer(), Wrapper.t(), cache()) ::
          {:ok, {struct(), rpc_name(), cache()}} | {:error, String.t()}
  defp unwrap_request_packet(callback_module, request_id, wrapper, module_cache) do
    with {:ok, modules} <- callback_module.get_rpc_by_identifier(wrapper.name),
         {:ok, body} <- modules[:request_module].decode(wrapper.data) do
      modules_with_rpc = Keyword.put(modules, :rpc, wrapper.name)
      new_module_cache = Map.put(module_cache, request_id, modules_with_rpc)
      {:ok, {body, wrapper.name, new_module_cache}}
    end
  end

  @spec unwrap_notice_packet(module(), Wrapper.t(), cache()) ::
          {:ok, {struct(), rpc_name(), cache()}} | {:error, String.t()}
  defp unwrap_notice_packet(callback_module, wrapper, module_cache) do
    with {:ok, module} <- callback_module.get_type_by_identifier(wrapper.name),
         {:ok, body} <- module.decode(wrapper.data) do
      {:ok, {body, wrapper.name, module_cache}}
    end
  end

  @spec unwrap_response_packet(non_neg_integer(), Wrapper.t(), cache()) ::
          {:ok, {struct(), rpc_name(), cache()}} | {:error, String.t()}
  defp unwrap_response_packet(request_id, wrapper, module_cache) do
    with {:ok, {modules, new_module_cache}} <-
           cached_module_for_request(module_cache, request_id),
         {:ok, body} <- modules[:response_module].decode(wrapper.data) do
      {:ok, {body, modules[:rpc], new_module_cache}}
    end
  end

  @spec cached_module_for_request(cache(), non_neg_integer()) ::
          {:ok, {atom(), cache()}} | {:error, String.t()}
  defp cached_module_for_request(module_cache, request_id) do
    case Map.pop(module_cache, request_id) do
      {nil, _} ->
        {:error, "module not found for response packet ID #{request_id}"}

      {module, new_map} ->
        {:ok, {module, new_map}}
    end
  end
end
