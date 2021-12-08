# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.NotifyPayResult do
  @moduledoc false
  (
    defstruct pay_result: 0,
              order_id: "",
              goods_id: 0,
              new_month_ticket: 0,
              resource_modify: [],
              __uf__: []

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
          |> encode_pay_result(msg)
          |> encode_order_id(msg)
          |> encode_goods_id(msg)
          |> encode_new_month_ticket(msg)
          |> encode_resource_modify(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_pay_result(acc, msg) do
          try do
            if msg.pay_result == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.pay_result)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:pay_result, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_order_id(acc, msg) do
          try do
            if msg.order_id == "" do
              acc
            else
              [acc, "\x12", Protox.Encode.encode_string(msg.order_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:order_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_goods_id(acc, msg) do
          try do
            if msg.goods_id == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.goods_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:goods_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_new_month_ticket(acc, msg) do
          try do
            if msg.new_month_ticket == 0 do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.new_month_ticket)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:new_month_ticket, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_resource_modify(acc, msg) do
          try do
            case msg.resource_modify do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "*", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:resource_modify, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.NotifyPayResult))
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

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[pay_result: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[order_id: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[goods_id: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[new_month_ticket: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   resource_modify:
                     msg.resource_modify ++
                       [Soulless.Tourney.Lq.NotifyPayResult.ResourceModify.decode!(delimited)]
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
          Soulless.Tourney.Lq.NotifyPayResult,
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
        1 => {:pay_result, {:scalar, 0}, :uint32},
        2 => {:order_id, {:scalar, ""}, :string},
        3 => {:goods_id, {:scalar, 0}, :uint32},
        4 => {:new_month_ticket, {:scalar, 0}, :uint32},
        5 =>
          {:resource_modify, :unpacked,
           {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        goods_id: {3, {:scalar, 0}, :uint32},
        new_month_ticket: {4, {:scalar, 0}, :uint32},
        order_id: {2, {:scalar, ""}, :string},
        pay_result: {1, {:scalar, 0}, :uint32},
        resource_modify:
          {5, :unpacked, {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "payResult",
          kind: {:scalar, 0},
          label: :optional,
          name: :pay_result,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "orderId",
          kind: {:scalar, ""},
          label: :optional,
          name: :order_id,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "goodsId",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_id,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "newMonthTicket",
          kind: {:scalar, 0},
          label: :optional,
          name: :new_month_ticket,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resourceModify",
          kind: :unpacked,
          label: :repeated,
          name: :resource_modify,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:pay_result) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "payResult",
             kind: {:scalar, 0},
             label: :optional,
             name: :pay_result,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("payResult") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "payResult",
             kind: {:scalar, 0},
             label: :optional,
             name: :pay_result,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("pay_result") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "payResult",
             kind: {:scalar, 0},
             label: :optional,
             name: :pay_result,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:order_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end

        def field_def("orderId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end

        def field_def("order_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:goods_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:new_month_ticket) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newMonthTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :new_month_ticket,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("newMonthTicket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newMonthTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :new_month_ticket,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("new_month_ticket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newMonthTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :new_month_ticket,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:resource_modify) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceModify",
             kind: :unpacked,
             label: :repeated,
             name: :resource_modify,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}
           }}
        end

        def field_def("resourceModify") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceModify",
             kind: :unpacked,
             label: :repeated,
             name: :resource_modify,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}
           }}
        end

        def field_def("resource_modify") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceModify",
             kind: :unpacked,
             label: :repeated,
             name: :resource_modify,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.NotifyPayResult.ResourceModify}
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
      def default(:pay_result) do
        {:ok, 0}
      end,
      def default(:order_id) do
        {:ok, ""}
      end,
      def default(:goods_id) do
        {:ok, 0}
      end,
      def default(:new_month_ticket) do
        {:ok, 0}
      end,
      def default(:resource_modify) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end