# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.ZHPShop do
  @moduledoc false
  (
    defstruct goods: [], buy_records: [], free_refresh: nil, cost_refresh: nil, __uf__: []

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
          |> encode_goods(msg)
          |> encode_buy_records(msg)
          |> encode_free_refresh(msg)
          |> encode_cost_refresh(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_goods(acc, msg) do
          try do
            case msg.goods do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\n",
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
              reraise Protox.EncodingError.new(:goods, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_buy_records(acc, msg) do
          try do
            case msg.buy_records do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\x12", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:buy_records, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_free_refresh(acc, msg) do
          try do
            if msg.free_refresh == nil do
              acc
            else
              [acc, "\x1A", Protox.Encode.encode_message(msg.free_refresh)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:free_refresh, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_cost_refresh(acc, msg) do
          try do
            if msg.cost_refresh == nil do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.cost_refresh)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:cost_refresh, "invalid field value"),
                      __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.ZHPShop))
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

              {1, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[goods: msg.goods ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[goods: msg.goods ++ [value]], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   buy_records:
                     msg.buy_records ++ [Soulless.Tourney.Lq.BuyRecord.decode!(delimited)]
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   free_refresh:
                     Protox.MergeMessage.merge(
                       msg.free_refresh,
                       Soulless.Tourney.Lq.ZHPShop.RefreshCount.decode!(delimited)
                     )
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   cost_refresh:
                     Protox.MergeMessage.merge(
                       msg.cost_refresh,
                       Soulless.Tourney.Lq.ZHPShop.RefreshCount.decode!(delimited)
                     )
                 ], rest}

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
          Soulless.Tourney.Lq.ZHPShop,
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

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:goods, :packed, :uint32},
        2 => {:buy_records, :unpacked, {:message, Soulless.Tourney.Lq.BuyRecord}},
        3 =>
          {:free_refresh, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}},
        4 => {:cost_refresh, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        buy_records: {2, :unpacked, {:message, Soulless.Tourney.Lq.BuyRecord}},
        cost_refresh: {4, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}},
        free_refresh: {3, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}},
        goods: {1, :packed, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "goods",
          kind: :packed,
          label: :repeated,
          name: :goods,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buyRecords",
          kind: :unpacked,
          label: :repeated,
          name: :buy_records,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.BuyRecord}
        },
        %{
          __struct__: Protox.Field,
          json_name: "freeRefresh",
          kind: {:scalar, nil},
          label: :optional,
          name: :free_refresh,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
        },
        %{
          __struct__: Protox.Field,
          json_name: "costRefresh",
          kind: {:scalar, nil},
          label: :optional,
          name: :cost_refresh,
          tag: 4,
          type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:goods) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goods",
             kind: :packed,
             label: :repeated,
             name: :goods,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("goods") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goods",
             kind: :packed,
             label: :repeated,
             name: :goods,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:buy_records) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecords",
             kind: :unpacked,
             label: :repeated,
             name: :buy_records,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.BuyRecord}
           }}
        end

        def field_def("buyRecords") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecords",
             kind: :unpacked,
             label: :repeated,
             name: :buy_records,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.BuyRecord}
           }}
        end

        def field_def("buy_records") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecords",
             kind: :unpacked,
             label: :repeated,
             name: :buy_records,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.BuyRecord}
           }}
        end
      ),
      (
        def field_def(:free_refresh) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "freeRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :free_refresh,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end

        def field_def("freeRefresh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "freeRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :free_refresh,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end

        def field_def("free_refresh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "freeRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :free_refresh,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end
      ),
      (
        def field_def(:cost_refresh) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "costRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :cost_refresh,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end

        def field_def("costRefresh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "costRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :cost_refresh,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end

        def field_def("cost_refresh") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "costRefresh",
             kind: {:scalar, nil},
             label: :optional,
             name: :cost_refresh,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.ZHPShop.RefreshCount}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]

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

    @spec required_fields() :: []
    def required_fields() do
      []
    end

    @spec syntax() :: atom
    def syntax() do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def default(:goods) do
        {:error, :no_default_value}
      end,
      def default(:buy_records) do
        {:error, :no_default_value}
      end,
      def default(:free_refresh) do
        {:ok, nil}
      end,
      def default(:cost_refresh) do
        {:ok, nil}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end