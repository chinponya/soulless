# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.ResContestManageLogin do
  @moduledoc false
  defstruct error: nil,
            account_id: 0,
            nickname: "",
            access_token: "",
            diamond: 0,
            last_create_time: 0,
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
        |> encode_error(msg)
        |> encode_account_id(msg)
        |> encode_nickname(msg)
        |> encode_access_token(msg)
        |> encode_diamond(msg)
        |> encode_last_create_time(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_account_id(acc, msg) do
        try do
          if msg.account_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.account_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:account_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_nickname(acc, msg) do
        try do
          if msg.nickname == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.nickname)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:nickname, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_access_token(acc, msg) do
        try do
          if msg.access_token == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.access_token)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_token, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_diamond(acc, msg) do
        try do
          if msg.diamond == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.diamond)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:diamond, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_last_create_time(acc, msg) do
        try do
          if msg.last_create_time == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.last_create_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:last_create_time, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.ResContestManageLogin))
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

              {[
                 error:
                   Protox.MergeMessage.merge(
                     msg.error,
                     Soulless.Tourney.Lq.Error.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[account_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[nickname: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_token: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[diamond: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[last_create_time: value], rest}

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
        Soulless.Tourney.Lq.ResContestManageLogin,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Tourney.Lq.Error}},
        2 => {:account_id, {:scalar, 0}, :uint32},
        3 => {:nickname, {:scalar, ""}, :string},
        4 => {:access_token, {:scalar, ""}, :string},
        5 => {:diamond, {:scalar, 0}, :uint32},
        6 => {:last_create_time, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_token: {4, {:scalar, ""}, :string},
        account_id: {2, {:scalar, 0}, :uint32},
        diamond: {5, {:scalar, 0}, :uint32},
        error: {1, {:scalar, nil}, {:message, Soulless.Tourney.Lq.Error}},
        last_create_time: {6, {:scalar, 0}, :uint32},
        nickname: {3, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "nickname",
          kind: {:scalar, ""},
          label: :optional,
          name: :nickname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_token,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "diamond",
          kind: {:scalar, 0},
          label: :optional,
          name: :diamond,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastCreateTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :last_create_time,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:account_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("accountId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("account_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:nickname) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nickname",
             kind: {:scalar, ""},
             label: :optional,
             name: :nickname,
             tag: 3,
             type: :string
           }}
        end

        def field_def("nickname") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nickname",
             kind: {:scalar, ""},
             label: :optional,
             name: :nickname,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:access_token) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 4,
             type: :string
           }}
        end

        def field_def("accessToken") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 4,
             type: :string
           }}
        end

        def field_def("access_token") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:diamond) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "diamond",
             kind: {:scalar, 0},
             label: :optional,
             name: :diamond,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("diamond") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "diamond",
             kind: {:scalar, 0},
             label: :optional,
             name: :diamond,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:last_create_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastCreateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_create_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("lastCreateTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastCreateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_create_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("last_create_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastCreateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_create_time,
             tag: 6,
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
    def default(:error) do
      {:ok, nil}
    end,
    def default(:account_id) do
      {:ok, 0}
    end,
    def default(:nickname) do
      {:ok, ""}
    end,
    def default(:access_token) do
      {:ok, ""}
    end,
    def default(:diamond) do
      {:ok, 0}
    end,
    def default(:last_create_time) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end