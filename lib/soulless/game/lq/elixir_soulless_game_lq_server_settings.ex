# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ServerSettings do
  @moduledoc false
  defstruct payment_setting: nil, payment_setting_v2: nil, nickname_setting: nil, __uf__: []

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
        |> encode_payment_setting(msg)
        |> encode_payment_setting_v2(msg)
        |> encode_nickname_setting(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_payment_setting(acc, msg) do
        try do
          if msg.payment_setting == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.payment_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:payment_setting, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_payment_setting_v2(acc, msg) do
        try do
          if msg.payment_setting_v2 == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.payment_setting_v2)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:payment_setting_v2, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_nickname_setting(acc, msg) do
        try do
          if msg.nickname_setting == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.nickname_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nickname_setting, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ServerSettings))
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

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 payment_setting:
                   Protox.MergeMessage.merge(
                     msg.payment_setting,
                     Soulless.Game.Lq.PaymentSetting.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 payment_setting_v2:
                   Protox.MergeMessage.merge(
                     msg.payment_setting_v2,
                     Soulless.Game.Lq.PaymentSettingV2.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 nickname_setting:
                   Protox.MergeMessage.merge(
                     msg.nickname_setting,
                     Soulless.Game.Lq.NicknameSetting.decode!(delimited)
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
        Soulless.Game.Lq.ServerSettings,
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
        3 => {:payment_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting}},
        4 => {:payment_setting_v2, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSettingV2}},
        5 => {:nickname_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.NicknameSetting}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        nickname_setting: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.NicknameSetting}},
        payment_setting: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSetting}},
        payment_setting_v2: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.PaymentSettingV2}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "paymentSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :payment_setting,
          tag: 3,
          type: {:message, Soulless.Game.Lq.PaymentSetting}
        },
        %{
          __struct__: Protox.Field,
          json_name: "paymentSettingV2",
          kind: {:scalar, nil},
          label: :optional,
          name: :payment_setting_v2,
          tag: 4,
          type: {:message, Soulless.Game.Lq.PaymentSettingV2}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nicknameSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :nickname_setting,
          tag: 5,
          type: {:message, Soulless.Game.Lq.NicknameSetting}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:payment_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.PaymentSetting}
           }}
        end

        def field_def("paymentSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.PaymentSetting}
           }}
        end

        def field_def("payment_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.PaymentSetting}
           }}
        end
      ),
      (
        def field_def(:payment_setting_v2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSettingV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting_v2,
             tag: 4,
             type: {:message, Soulless.Game.Lq.PaymentSettingV2}
           }}
        end

        def field_def("paymentSettingV2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSettingV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting_v2,
             tag: 4,
             type: {:message, Soulless.Game.Lq.PaymentSettingV2}
           }}
        end

        def field_def("payment_setting_v2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paymentSettingV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :payment_setting_v2,
             tag: 4,
             type: {:message, Soulless.Game.Lq.PaymentSettingV2}
           }}
        end
      ),
      (
        def field_def(:nickname_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nicknameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :nickname_setting,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NicknameSetting}
           }}
        end

        def field_def("nicknameSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nicknameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :nickname_setting,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NicknameSetting}
           }}
        end

        def field_def("nickname_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nicknameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :nickname_setting,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NicknameSetting}
           }}
        end
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
    def default(:payment_setting) do
      {:ok, nil}
    end,
    def default(:payment_setting_v2) do
      {:ok, nil}
    end,
    def default(:nickname_setting) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end