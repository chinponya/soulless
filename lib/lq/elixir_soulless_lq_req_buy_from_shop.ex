# credo:disable-for-this-file
defmodule(Soulless.Lq.ReqBuyFromShop) do
  @moduledoc false
  (
    defstruct(goods_id: 0, count: 0, bill_short_cut: [], deal_price: 0, __uf__: [])

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_goods_id(msg)
          |> encode_count(msg)
          |> encode_bill_short_cut(msg)
          |> encode_deal_price(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_goods_id(acc, msg)) do
          try do
            if(msg.goods_id == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.goods_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:goods_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_count(acc, msg)) do
          try do
            if(msg.count == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.count)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:count, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_bill_short_cut(acc, msg)) do
          try do
            case(msg.bill_short_cut) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:bill_short_cut, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_deal_price(acc, msg)) do
          try do
            if(msg.deal_price == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.deal_price)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:deal_price, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      defp(encode_unknown_fields(acc, msg)) do
        Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
          case(wire_type) do
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
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(Soulless.Lq.ReqBuyFromShop))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[goods_id: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[count: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   bill_short_cut:
                     msg.bill_short_cut ++ [Soulless.Lq.BillShortcut.decode!(delimited)]
                 ], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[deal_price: value], rest}

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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          Soulless.Lq.ReqBuyFromShop,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:goods_id, {:scalar, 0}, :uint32},
        2 => {:count, {:scalar, 0}, :uint32},
        3 => {:bill_short_cut, :unpacked, {:message, Soulless.Lq.BillShortcut}},
        4 => {:deal_price, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        bill_short_cut: {3, :unpacked, {:message, Soulless.Lq.BillShortcut}},
        count: {2, {:scalar, 0}, :uint32},
        deal_price: {4, {:scalar, 0}, :uint32},
        goods_id: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "goodsId",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "count",
          kind: {:scalar, 0},
          label: :optional,
          name: :count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "billShortCut",
          kind: :unpacked,
          label: :repeated,
          name: :bill_short_cut,
          tag: 3,
          type: {:message, Soulless.Lq.BillShortcut}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dealPrice",
          kind: {:scalar, 0},
          label: :optional,
          name: :deal_price,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:goods_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("goodsId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("goods_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:bill_short_cut)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "billShortCut",
             kind: :unpacked,
             label: :repeated,
             name: :bill_short_cut,
             tag: 3,
             type: {:message, Soulless.Lq.BillShortcut}
           }}
        end

        def(field_def("billShortCut")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "billShortCut",
             kind: :unpacked,
             label: :repeated,
             name: :bill_short_cut,
             tag: 3,
             type: {:message, Soulless.Lq.BillShortcut}
           }}
        end

        def(field_def("bill_short_cut")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "billShortCut",
             kind: :unpacked,
             label: :repeated,
             name: :bill_short_cut,
             tag: 3,
             type: {:message, Soulless.Lq.BillShortcut}
           }}
        end
      ),
      (
        def(field_def(:deal_price)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dealPrice",
             kind: {:scalar, 0},
             label: :optional,
             name: :deal_price,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("dealPrice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dealPrice",
             kind: {:scalar, 0},
             label: :optional,
             name: :deal_price,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("deal_price")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dealPrice",
             kind: {:scalar, 0},
             label: :optional,
             name: :deal_price,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    (
      @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
      def(unknown_fields(msg)) do
        msg.__uf__
      end

      @spec unknown_fields_name() :: :__uf__
      def(unknown_fields_name()) do
        :__uf__
      end

      @spec clear_unknown_fields(struct) :: struct
      def(clear_unknown_fields(msg)) do
        struct!(msg, [{unknown_fields_name(), []}])
      end
    )

    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:goods_id)) do
        {:ok, 0}
      end,
      def(default(:count)) do
        {:ok, 0}
      end,
      def(default(:bill_short_cut)) do
        {:error, :no_default_value}
      end,
      def(default(:deal_price)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end