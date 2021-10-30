# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.ContestGameInfo) do
  @moduledoc false
  (
    defstruct(game_uuid: "", players: [], start_time: 0, end_time: 0, __uf__: [])

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
          |> encode_game_uuid(msg)
          |> encode_players(msg)
          |> encode_start_time(msg)
          |> encode_end_time(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_game_uuid(acc, msg)) do
          try do
            if(msg.game_uuid == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.game_uuid)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:game_uuid, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_players(acc, msg)) do
          try do
            case(msg.players) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:players, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_start_time(acc, msg)) do
          try do
            if(msg.start_time == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.start_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:start_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_end_time(acc, msg)) do
          try do
            if(msg.end_time == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.end_time)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:end_time, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.ContestGameInfo))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[game_uuid: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   players:
                     msg.players ++
                       [Soulless.Tourney.Lq.ContestGameInfo.Player.decode!(delimited)]
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[start_time: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[end_time: value], rest}

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
          Soulless.Tourney.Lq.ContestGameInfo,
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
        1 => {:game_uuid, {:scalar, ""}, :string},
        2 => {:players, :unpacked, {:message, Soulless.Tourney.Lq.ContestGameInfo.Player}},
        3 => {:start_time, {:scalar, 0}, :uint32},
        4 => {:end_time, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        end_time: {4, {:scalar, 0}, :uint32},
        game_uuid: {1, {:scalar, ""}, :string},
        players: {2, :unpacked, {:message, Soulless.Tourney.Lq.ContestGameInfo.Player}},
        start_time: {3, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "gameUuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :game_uuid,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "players",
          kind: :unpacked,
          label: :repeated,
          name: :players,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.ContestGameInfo.Player}
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "endTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :end_time,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:game_uuid)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("gameUuid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("game_uuid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:players)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.ContestGameInfo.Player}
           }}
        end

        def(field_def("players")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.ContestGameInfo.Player}
           }}
        end

        []
      ),
      (
        def(field_def(:start_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("startTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("start_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:end_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("endTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("end_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
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
      def(default(:game_uuid)) do
        {:ok, ""}
      end,
      def(default(:players)) do
        {:error, :no_default_value}
      end,
      def(default(:start_time)) do
        {:ok, 0}
      end,
      def(default(:end_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end