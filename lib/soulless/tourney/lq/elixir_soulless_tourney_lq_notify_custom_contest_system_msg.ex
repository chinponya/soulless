# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.NotifyCustomContestSystemMsg do
  @moduledoc false
  (
    defstruct unique_id: 0, type: 0, uuid: "", game_start: nil, game_end: nil, __uf__: []

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
          |> encode_unique_id(msg)
          |> encode_type(msg)
          |> encode_uuid(msg)
          |> encode_game_start(msg)
          |> encode_game_end(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_unique_id(acc, msg) do
          try do
            if msg.unique_id == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.unique_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:unique_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_type(acc, msg) do
          try do
            if msg.type == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.type)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_uuid(acc, msg) do
          try do
            if msg.uuid == "" do
              acc
            else
              [acc, "\x1A", Protox.Encode.encode_string(msg.uuid)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:uuid, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_game_start(acc, msg) do
          try do
            if msg.game_start == nil do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.game_start)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_start, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_game_end(acc, msg) do
          try do
            if msg.game_end == nil do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.game_end)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_end, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.NotifyCustomContestSystemMsg))
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
                {[unique_id: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[type: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[uuid: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_start:
                     Protox.MergeMessage.merge(
                       msg.game_start,
                       Soulless.Tourney.Lq.CustomizedContestGameStart.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_end:
                     Protox.MergeMessage.merge(
                       msg.game_end,
                       Soulless.Tourney.Lq.CustomizedContestGameEnd.decode!(delimited)
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
          Soulless.Tourney.Lq.NotifyCustomContestSystemMsg,
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
        1 => {:unique_id, {:scalar, 0}, :uint32},
        2 => {:type, {:scalar, 0}, :uint32},
        3 => {:uuid, {:scalar, ""}, :string},
        4 =>
          {:game_start, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}},
        5 => {:game_end, {:scalar, nil}, {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        game_end: {5, {:scalar, nil}, {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}},
        game_start:
          {4, {:scalar, nil}, {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}},
        type: {2, {:scalar, 0}, :uint32},
        unique_id: {1, {:scalar, 0}, :uint32},
        uuid: {3, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "uniqueId",
          kind: {:scalar, 0},
          label: :optional,
          name: :unique_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "uuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :uuid,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameStart",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_start,
          tag: 4,
          type: {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameEnd",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_end,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:unique_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("uniqueId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("unique_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:game_start) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStart",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_start,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}
           }}
        end

        def field_def("gameStart") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStart",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_start,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}
           }}
        end

        def field_def("game_start") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStart",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_start,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameStart}
           }}
        end
      ),
      (
        def field_def(:game_end) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEnd",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_end,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}
           }}
        end

        def field_def("gameEnd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEnd",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_end,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}
           }}
        end

        def field_def("game_end") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEnd",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_end,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.CustomizedContestGameEnd}
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
      def default(:unique_id) do
        {:ok, 0}
      end,
      def default(:type) do
        {:ok, 0}
      end,
      def default(:uuid) do
        {:ok, ""}
      end,
      def default(:game_start) do
        {:ok, nil}
      end,
      def default(:game_end) do
        {:ok, nil}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end