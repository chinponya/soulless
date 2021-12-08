# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordGame do
  @moduledoc false
  (
    defstruct uuid: "",
              start_time: 0,
              end_time: 0,
              config: nil,
              accounts: [],
              result: nil,
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
          |> encode_uuid(msg)
          |> encode_start_time(msg)
          |> encode_end_time(msg)
          |> encode_config(msg)
          |> encode_accounts(msg)
          |> encode_result(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_uuid(acc, msg) do
          try do
            if msg.uuid == "" do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.uuid)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:uuid, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_start_time(acc, msg) do
          try do
            if msg.start_time == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.start_time)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_end_time(acc, msg) do
          try do
            if msg.end_time == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.end_time)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:end_time, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_config(acc, msg) do
          try do
            if msg.config == nil do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.config)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:config, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_accounts(acc, msg) do
          try do
            case msg.accounts do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "Z", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:accounts, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_result(acc, msg) do
          try do
            if msg.result == nil do
              acc
            else
              [acc, "b", Protox.Encode.encode_message(msg.result)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:result, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.RecordGame))
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
                {[uuid: delimited], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[start_time: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[end_time: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   config:
                     Protox.MergeMessage.merge(
                       msg.config,
                       Soulless.Game.Lq.GameConfig.decode!(delimited)
                     )
                 ], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   accounts:
                     msg.accounts ++ [Soulless.Game.Lq.RecordGame.AccountInfo.decode!(delimited)]
                 ], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   result:
                     Protox.MergeMessage.merge(
                       msg.result,
                       Soulless.Game.Lq.GameEndResult.decode!(delimited)
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
          Soulless.Game.Lq.RecordGame,
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
        1 => {:uuid, {:scalar, ""}, :string},
        2 => {:start_time, {:scalar, 0}, :uint32},
        3 => {:end_time, {:scalar, 0}, :uint32},
        5 => {:config, {:scalar, nil}, {:message, Soulless.Game.Lq.GameConfig}},
        11 => {:accounts, :unpacked, {:message, Soulless.Game.Lq.RecordGame.AccountInfo}},
        12 => {:result, {:scalar, nil}, {:message, Soulless.Game.Lq.GameEndResult}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        accounts: {11, :unpacked, {:message, Soulless.Game.Lq.RecordGame.AccountInfo}},
        config: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.GameConfig}},
        end_time: {3, {:scalar, 0}, :uint32},
        result: {12, {:scalar, nil}, {:message, Soulless.Game.Lq.GameEndResult}},
        start_time: {2, {:scalar, 0}, :uint32},
        uuid: {1, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "uuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :uuid,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "endTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :end_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "config",
          kind: {:scalar, nil},
          label: :optional,
          name: :config,
          tag: 5,
          type: {:message, Soulless.Game.Lq.GameConfig}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accounts",
          kind: :unpacked,
          label: :repeated,
          name: :accounts,
          tag: 11,
          type: {:message, Soulless.Game.Lq.RecordGame.AccountInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "result",
          kind: {:scalar, nil},
          label: :optional,
          name: :result,
          tag: 12,
          type: {:message, Soulless.Game.Lq.GameEndResult}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 1,
             type: :string
           }}
        end

        def field_def("uuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("startTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:end_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("endTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("end_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:config) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "config",
             kind: {:scalar, nil},
             label: :optional,
             name: :config,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameConfig}
           }}
        end

        def field_def("config") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "config",
             kind: {:scalar, nil},
             label: :optional,
             name: :config,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameConfig}
           }}
        end

        []
      ),
      (
        def field_def(:accounts) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accounts",
             kind: :unpacked,
             label: :repeated,
             name: :accounts,
             tag: 11,
             type: {:message, Soulless.Game.Lq.RecordGame.AccountInfo}
           }}
        end

        def field_def("accounts") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accounts",
             kind: :unpacked,
             label: :repeated,
             name: :accounts,
             tag: 11,
             type: {:message, Soulless.Game.Lq.RecordGame.AccountInfo}
           }}
        end

        []
      ),
      (
        def field_def(:result) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, nil},
             label: :optional,
             name: :result,
             tag: 12,
             type: {:message, Soulless.Game.Lq.GameEndResult}
           }}
        end

        def field_def("result") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, nil},
             label: :optional,
             name: :result,
             tag: 12,
             type: {:message, Soulless.Game.Lq.GameEndResult}
           }}
        end

        []
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
      def default(:uuid) do
        {:ok, ""}
      end,
      def default(:start_time) do
        {:ok, 0}
      end,
      def default(:end_time) do
        {:ok, 0}
      end,
      def default(:config) do
        {:ok, nil}
      end,
      def default(:accounts) do
        {:error, :no_default_value}
      end,
      def default(:result) do
        {:ok, nil}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end