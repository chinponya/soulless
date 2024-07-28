# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqIslandActivityBuy.BuyItems do
  @moduledoc false
  defstruct goods_id: 0, pos: [], rotate: 0, bag_id: 0, price: 0, __uf__: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        []
        |> encode_goods_id(msg)
        |> encode_pos(msg)
        |> encode_rotate(msg)
        |> encode_bag_id(msg)
        |> encode_price(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_goods_id(acc, msg) do
        try do
          if msg.goods_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.goods_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:goods_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_pos(acc, msg) do
        try do
          case msg.pos do
            [] ->
              acc

            values ->
              [
                acc,
                "\x1A",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint32(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:pos, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rotate(acc, msg) do
        try do
          if msg.rotate == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.rotate)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rotate, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bag_id(acc, msg) do
        try do
          if msg.bag_id == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.bag_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bag_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_price(acc, msg) do
        try do
          if msg.price == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.price)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:price, "invalid field value"), __STACKTRACE__
        end
      end
    ]

    defp encode_unknown_fields(acc, msg) do
      Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
        case wire_type do
          0 ->
            [acc, Protox.Encode.make_key_bytes(tag, :int32), bytes]

          1 ->
            [acc, Protox.Encode.make_key_bytes(tag, :double), bytes]

          2 ->
            len_bytes = bytes |> byte_size() |> Protox.Varint.encode()
            [acc, Protox.Encode.make_key_bytes(tag, :packed), len_bytes, bytes]

          5 ->
            [acc, Protox.Encode.make_key_bytes(tag, :float), bytes]
        end
      end)
    end
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqIslandActivityBuy.BuyItems))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[goods_id: value], rest}

            {3, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[pos: msg.pos ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[pos: msg.pos ++ [value]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rotate: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[bag_id: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[price: value], rest}

            {tag, wire_type, rest} ->
              {value, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)

              {[
                 {msg.__struct__.unknown_fields_name,
                  [value | msg.__struct__.unknown_fields(msg)]}
               ], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        Soulless.Game.Lq.ReqIslandActivityBuy.BuyItems,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        2 => {:goods_id, {:scalar, 0}, :uint32},
        3 => {:pos, :packed, :uint32},
        4 => {:rotate, {:scalar, 0}, :uint32},
        5 => {:bag_id, {:scalar, 0}, :uint32},
        6 => {:price, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        bag_id: {5, {:scalar, 0}, :uint32},
        goods_id: {2, {:scalar, 0}, :uint32},
        pos: {3, :packed, :uint32},
        price: {6, {:scalar, 0}, :uint32},
        rotate: {4, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "goodsId",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "pos",
          kind: :packed,
          label: :repeated,
          name: :pos,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rotate",
          kind: {:scalar, 0},
          label: :optional,
          name: :rotate,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "bagId",
          kind: {:scalar, 0},
          label: :optional,
          name: :bag_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "price",
          kind: {:scalar, 0},
          label: :optional,
          name: :price,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:goods_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("goodsId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("goods_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:pos) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pos",
             kind: :packed,
             label: :repeated,
             name: :pos,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("pos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pos",
             kind: :packed,
             label: :repeated,
             name: :pos,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:rotate) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rotate",
             kind: {:scalar, 0},
             label: :optional,
             name: :rotate,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("rotate") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rotate",
             kind: {:scalar, 0},
             label: :optional,
             name: :rotate,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:bag_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("bagId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("bag_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:price) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "price",
             kind: {:scalar, 0},
             label: :optional,
             name: :price,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("price") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "price",
             kind: {:scalar, 0},
             label: :optional,
             name: :price,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  (
    @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
    def unknown_fields(msg) do
      msg.__uf__
    end

    @spec unknown_fields_name() :: :__uf__
    def unknown_fields_name() do
      :__uf__
    end

    @spec clear_unknown_fields(struct) :: struct
    def clear_unknown_fields(msg) do
      struct!(msg, [{unknown_fields_name(), []}])
    end
  )

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto3
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:goods_id) do
      {:ok, 0}
    end,
    def default(:pos) do
      {:error, :no_default_value}
    end,
    def default(:rotate) do
      {:ok, 0}
    end,
    def default(:bag_id) do
      {:ok, 0}
    end,
    def default(:price) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end