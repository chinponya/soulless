# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.PaymentSetting) do
  @moduledoc false
  (
    defstruct(
      open_payment: 0,
      payment_info_show_type: 0,
      payment_info: "",
      wechat: nil,
      alipay: nil,
      __uf__: []
    )

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
          |> encode_open_payment(msg)
          |> encode_payment_info_show_type(msg)
          |> encode_payment_info(msg)
          |> encode_wechat(msg)
          |> encode_alipay(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_open_payment(acc, msg)) do
          try do
            if(msg.open_payment == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.open_payment)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:open_payment, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_payment_info_show_type(acc, msg)) do
          try do
            if(msg.payment_info_show_type == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.payment_info_show_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:payment_info_show_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_payment_info(acc, msg)) do
          try do
            if(msg.payment_info == "") do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_string(msg.payment_info)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:payment_info, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_wechat(acc, msg)) do
          try do
            if(msg.wechat == nil) do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.wechat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:wechat, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_alipay(acc, msg)) do
          try do
            if(msg.alipay == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.alipay)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:alipay, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.PaymentSetting))
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
                {[open_payment: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[payment_info_show_type: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[payment_info: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   wechat:
                     Protox.Message.merge(
                       msg.wechat,
                       Soulless.Game.Lq.PaymentSetting.WechatData.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   alipay:
                     Protox.Message.merge(
                       msg.alipay,
                       Soulless.Game.Lq.PaymentSetting.AlipayData.decode!(delimited)
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
          Soulless.Game.Lq.PaymentSetting,
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
        1 => {:open_payment, {:scalar, 0}, :uint32},
        2 => {:payment_info_show_type, {:scalar, 0}, :uint32},
        3 => {:payment_info, {:scalar, ""}, :string},
        4 => {:wechat, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting.WechatData}},
        5 => {:alipay, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting.AlipayData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        alipay: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting.AlipayData}},
        open_payment: {1, {:scalar, 0}, :uint32},
        payment_info: {3, {:scalar, ""}, :string},
        payment_info_show_type: {2, {:scalar, 0}, :uint32},
        wechat: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting.WechatData}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "openPayment",
          kind: {:scalar, 0},
          label: :optional,
          name: :open_payment,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "paymentInfoShowType",
          kind: {:scalar, 0},
          label: :optional,
          name: :payment_info_show_type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "paymentInfo",
          kind: {:scalar, ""},
          label: :optional,
          name: :payment_info,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "wechat",
          kind: {:scalar, nil},
          label: :optional,
          name: :wechat,
          tag: 4,
          type: {:message, Soulless.Game.Lq.PaymentSetting.WechatData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "alipay",
          kind: {:scalar, nil},
          label: :optional,
          name: :alipay,
          tag: 5,
          type: {:message, Soulless.Game.Lq.PaymentSetting.AlipayData}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:open_payment)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openPayment",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_payment,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("openPayment")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openPayment",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_payment,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("open_payment")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openPayment",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_payment,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:payment_info_show_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfoShowType",
             kind: {:scalar, 0},
             label: :optional,
             name: :payment_info_show_type,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("paymentInfoShowType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfoShowType",
             kind: {:scalar, 0},
             label: :optional,
             name: :payment_info_show_type,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("payment_info_show_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfoShowType",
             kind: {:scalar, 0},
             label: :optional,
             name: :payment_info_show_type,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:payment_info)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :payment_info,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("paymentInfo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :payment_info,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("payment_info")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentInfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :payment_info,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:wechat)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wechat",
             kind: {:scalar, nil},
             label: :optional,
             name: :wechat,
             tag: 4,
             type: {:message, Soulless.Game.Lq.PaymentSetting.WechatData}
           }}
        end

        def(field_def("wechat")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "wechat",
             kind: {:scalar, nil},
             label: :optional,
             name: :wechat,
             tag: 4,
             type: {:message, Soulless.Game.Lq.PaymentSetting.WechatData}
           }}
        end

        []
      ),
      (
        def(field_def(:alipay)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alipay",
             kind: {:scalar, nil},
             label: :optional,
             name: :alipay,
             tag: 5,
             type: {:message, Soulless.Game.Lq.PaymentSetting.AlipayData}
           }}
        end

        def(field_def("alipay")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "alipay",
             kind: {:scalar, nil},
             label: :optional,
             name: :alipay,
             tag: 5,
             type: {:message, Soulless.Game.Lq.PaymentSetting.AlipayData}
           }}
        end

        []
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
      def(default(:open_payment)) do
        {:ok, 0}
      end,
      def(default(:payment_info_show_type)) do
        {:ok, 0}
      end,
      def(default(:payment_info)) do
        {:ok, ""}
      end,
      def(default(:wechat)) do
        {:ok, nil}
      end,
      def(default(:alipay)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end