# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.PaymentSettingV2.PaymentSettingUnit do
  @moduledoc false
  defstruct platform: "",
            is_show: false,
            goods_click_action: 0,
            goods_click_text: "",
            maintain: nil,
            enable_for_frozen_account: false,
            extra_data: "",
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
        |> encode_platform(msg)
        |> encode_is_show(msg)
        |> encode_goods_click_action(msg)
        |> encode_goods_click_text(msg)
        |> encode_maintain(msg)
        |> encode_enable_for_frozen_account(msg)
        |> encode_extra_data(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_platform(acc, msg) do
        try do
          if msg.platform == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.platform)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:platform, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_show(acc, msg) do
        try do
          if msg.is_show == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.is_show)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_show, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_goods_click_action(acc, msg) do
        try do
          if msg.goods_click_action == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.goods_click_action)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:goods_click_action, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_goods_click_text(acc, msg) do
        try do
          if msg.goods_click_text == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.goods_click_text)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:goods_click_text, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_maintain(acc, msg) do
        try do
          if msg.maintain == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.maintain)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:maintain, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_enable_for_frozen_account(acc, msg) do
        try do
          if msg.enable_for_frozen_account == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.enable_for_frozen_account)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:enable_for_frozen_account, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_extra_data(acc, msg) do
        try do
          if msg.extra_data == "" do
            acc
          else
            [acc, ":", Protox.Encode.encode_string(msg.extra_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:extra_data, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.PaymentSettingV2.PaymentSettingUnit))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[platform: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_show: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[goods_click_action: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[goods_click_text: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 maintain:
                   Protox.MergeMessage.merge(
                     msg.maintain,
                     Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[enable_for_frozen_account: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[extra_data: delimited], rest}

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
        Soulless.Tourney.Lq.PaymentSettingV2.PaymentSettingUnit,
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
        1 => {:platform, {:scalar, ""}, :string},
        2 => {:is_show, {:scalar, false}, :bool},
        3 => {:goods_click_action, {:scalar, 0}, :uint32},
        4 => {:goods_click_text, {:scalar, ""}, :string},
        5 =>
          {:maintain, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain}},
        6 => {:enable_for_frozen_account, {:scalar, false}, :bool},
        7 => {:extra_data, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        enable_for_frozen_account: {6, {:scalar, false}, :bool},
        extra_data: {7, {:scalar, ""}, :string},
        goods_click_action: {3, {:scalar, 0}, :uint32},
        goods_click_text: {4, {:scalar, ""}, :string},
        is_show: {2, {:scalar, false}, :bool},
        maintain:
          {5, {:scalar, nil}, {:message, Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain}},
        platform: {1, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "platform",
          kind: {:scalar, ""},
          label: :optional,
          name: :platform,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isShow",
          kind: {:scalar, false},
          label: :optional,
          name: :is_show,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "goodsClickAction",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_click_action,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "goodsClickText",
          kind: {:scalar, ""},
          label: :optional,
          name: :goods_click_text,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "maintain",
          kind: {:scalar, nil},
          label: :optional,
          name: :maintain,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain}
        },
        %{
          __struct__: Protox.Field,
          json_name: "enableForFrozenAccount",
          kind: {:scalar, false},
          label: :optional,
          name: :enable_for_frozen_account,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "extraData",
          kind: {:scalar, ""},
          label: :optional,
          name: :extra_data,
          tag: 7,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:platform) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platform",
             kind: {:scalar, ""},
             label: :optional,
             name: :platform,
             tag: 1,
             type: :string
           }}
        end

        def field_def("platform") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platform",
             kind: {:scalar, ""},
             label: :optional,
             name: :platform,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:is_show) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isShow",
             kind: {:scalar, false},
             label: :optional,
             name: :is_show,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isShow") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isShow",
             kind: {:scalar, false},
             label: :optional,
             name: :is_show,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("is_show") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isShow",
             kind: {:scalar, false},
             label: :optional,
             name: :is_show,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:goods_click_action) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickAction",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_click_action,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("goodsClickAction") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickAction",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_click_action,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("goods_click_action") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickAction",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_click_action,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:goods_click_text) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickText",
             kind: {:scalar, ""},
             label: :optional,
             name: :goods_click_text,
             tag: 4,
             type: :string
           }}
        end

        def field_def("goodsClickText") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickText",
             kind: {:scalar, ""},
             label: :optional,
             name: :goods_click_text,
             tag: 4,
             type: :string
           }}
        end

        def field_def("goods_click_text") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsClickText",
             kind: {:scalar, ""},
             label: :optional,
             name: :goods_click_text,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:maintain) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maintain",
             kind: {:scalar, nil},
             label: :optional,
             name: :maintain,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain}
           }}
        end

        def field_def("maintain") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maintain",
             kind: {:scalar, nil},
             label: :optional,
             name: :maintain,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PaymentSettingV2.PaymentMaintain}
           }}
        end

        []
      ),
      (
        def field_def(:enable_for_frozen_account) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableForFrozenAccount",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_for_frozen_account,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("enableForFrozenAccount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableForFrozenAccount",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_for_frozen_account,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("enable_for_frozen_account") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enableForFrozenAccount",
             kind: {:scalar, false},
             label: :optional,
             name: :enable_for_frozen_account,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:extra_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraData",
             kind: {:scalar, ""},
             label: :optional,
             name: :extra_data,
             tag: 7,
             type: :string
           }}
        end

        def field_def("extraData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraData",
             kind: {:scalar, ""},
             label: :optional,
             name: :extra_data,
             tag: 7,
             type: :string
           }}
        end

        def field_def("extra_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraData",
             kind: {:scalar, ""},
             label: :optional,
             name: :extra_data,
             tag: 7,
             type: :string
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
    def default(:platform) do
      {:ok, ""}
    end,
    def default(:is_show) do
      {:ok, false}
    end,
    def default(:goods_click_action) do
      {:ok, 0}
    end,
    def default(:goods_click_text) do
      {:ok, ""}
    end,
    def default(:maintain) do
      {:ok, nil}
    end,
    def default(:enable_for_frozen_account) do
      {:ok, false}
    end,
    def default(:extra_data) do
      {:ok, ""}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end