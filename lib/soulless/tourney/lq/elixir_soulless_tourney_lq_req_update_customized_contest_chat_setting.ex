# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.ReqUpdateCustomizedContestChatSetting do
  @moduledoc false
  defstruct setting_type: 0, nicknames: [], account_ids: [], chat_limit_type: 0, __uf__: []

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
        |> encode_setting_type(msg)
        |> encode_nicknames(msg)
        |> encode_account_ids(msg)
        |> encode_chat_limit_type(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_setting_type(acc, msg) do
        try do
          if msg.setting_type == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.setting_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:setting_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_nicknames(acc, msg) do
        try do
          case msg.nicknames do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nicknames, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_account_ids(acc, msg) do
        try do
          case msg.account_ids do
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
            reraise Protox.EncodingError.new(:account_ids, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_chat_limit_type(acc, msg) do
        try do
          if msg.chat_limit_type == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.chat_limit_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chat_limit_type, "invalid field value"),
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
          parse_key_value(
            bytes,
            struct(Soulless.Tourney.Lq.ReqUpdateCustomizedContestChatSetting)
          )
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
              {[setting_type: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[nicknames: msg.nicknames ++ [delimited]], rest}

            {3, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 account_ids:
                   msg.account_ids ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[account_ids: msg.account_ids ++ [value]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[chat_limit_type: value], rest}

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
        Soulless.Tourney.Lq.ReqUpdateCustomizedContestChatSetting,
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
        1 => {:setting_type, {:scalar, 0}, :uint32},
        2 => {:nicknames, :unpacked, :string},
        3 => {:account_ids, :packed, :uint32},
        4 => {:chat_limit_type, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_ids: {3, :packed, :uint32},
        chat_limit_type: {4, {:scalar, 0}, :uint32},
        nicknames: {2, :unpacked, :string},
        setting_type: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "settingType",
          kind: {:scalar, 0},
          label: :optional,
          name: :setting_type,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "nicknames",
          kind: :unpacked,
          label: :repeated,
          name: :nicknames,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountIds",
          kind: :packed,
          label: :repeated,
          name: :account_ids,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "chatLimitType",
          kind: {:scalar, 0},
          label: :optional,
          name: :chat_limit_type,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:setting_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "settingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :setting_type,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("settingType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "settingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :setting_type,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("setting_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "settingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :setting_type,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:nicknames) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nicknames",
             kind: :unpacked,
             label: :repeated,
             name: :nicknames,
             tag: 2,
             type: :string
           }}
        end

        def field_def("nicknames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nicknames",
             kind: :unpacked,
             label: :repeated,
             name: :nicknames,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:account_ids) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountIds",
             kind: :packed,
             label: :repeated,
             name: :account_ids,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("accountIds") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountIds",
             kind: :packed,
             label: :repeated,
             name: :account_ids,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("account_ids") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountIds",
             kind: :packed,
             label: :repeated,
             name: :account_ids,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:chat_limit_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatLimitType",
             kind: {:scalar, 0},
             label: :optional,
             name: :chat_limit_type,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("chatLimitType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatLimitType",
             kind: {:scalar, 0},
             label: :optional,
             name: :chat_limit_type,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("chat_limit_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatLimitType",
             kind: {:scalar, 0},
             label: :optional,
             name: :chat_limit_type,
             tag: 4,
             type: :uint32
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
    def default(:setting_type) do
      {:ok, 0}
    end,
    def default(:nicknames) do
      {:error, :no_default_value}
    end,
    def default(:account_ids) do
      {:error, :no_default_value}
    end,
    def default(:chat_limit_type) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end