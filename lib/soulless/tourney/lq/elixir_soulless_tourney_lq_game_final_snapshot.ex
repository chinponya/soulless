# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.GameFinalSnapshot do
  @moduledoc false
  (
    defstruct uuid: "",
              state: 0,
              category: 0,
              mode: nil,
              meta: nil,
              calculate_param: nil,
              create_time: 0,
              start_time: 0,
              finish_time: 0,
              seats: [],
              rounds: [],
              account_views: [],
              final_players: [],
              afk_info: [],
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
          |> encode_state(msg)
          |> encode_category(msg)
          |> encode_mode(msg)
          |> encode_meta(msg)
          |> encode_calculate_param(msg)
          |> encode_create_time(msg)
          |> encode_start_time(msg)
          |> encode_finish_time(msg)
          |> encode_seats(msg)
          |> encode_rounds(msg)
          |> encode_account_views(msg)
          |> encode_final_players(msg)
          |> encode_afk_info(msg)
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
        defp encode_state(acc, msg) do
          try do
            if msg.state == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.state)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:state, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_category(acc, msg) do
          try do
            if msg.category == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.category)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:category, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_mode(acc, msg) do
          try do
            if msg.mode == nil do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.mode)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:mode, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_meta(acc, msg) do
          try do
            if msg.meta == nil do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.meta)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:meta, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_calculate_param(acc, msg) do
          try do
            if msg.calculate_param == nil do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.calculate_param)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:calculate_param, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_create_time(acc, msg) do
          try do
            if msg.create_time == 0 do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.create_time)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:create_time, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_start_time(acc, msg) do
          try do
            if msg.start_time == 0 do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.start_time)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_finish_time(acc, msg) do
          try do
            if msg.finish_time == 0 do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.finish_time)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:finish_time, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_seats(acc, msg) do
          try do
            case msg.seats do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "R", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:seats, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_rounds(acc, msg) do
          try do
            case msg.rounds do
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
              reraise Protox.EncodingError.new(:rounds, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_account_views(acc, msg) do
          try do
            case msg.account_views do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "b", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:account_views, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_final_players(acc, msg) do
          try do
            case msg.final_players do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "j", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:final_players, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_afk_info(acc, msg) do
          try do
            case msg.afk_info do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "r", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:afk_info, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.GameFinalSnapshot))
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
                {[state: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[category: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   mode:
                     Protox.MergeMessage.merge(
                       msg.mode,
                       Soulless.Tourney.Lq.GameMode.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   meta:
                     Protox.MergeMessage.merge(
                       msg.meta,
                       Soulless.Tourney.Lq.GameMetaData.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   calculate_param:
                     Protox.MergeMessage.merge(
                       msg.calculate_param,
                       Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[create_time: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[start_time: value], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[finish_time: value], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   seats:
                     msg.seats ++
                       [Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat.decode!(delimited)]
                 ], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   rounds:
                     msg.rounds ++ [Soulless.Tourney.Lq.GameRoundSnapshot.decode!(delimited)]
                 ], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   account_views:
                     msg.account_views ++ [Soulless.Tourney.Lq.PlayerGameView.decode!(delimited)]
                 ], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   final_players:
                     msg.final_players ++
                       [Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer.decode!(delimited)]
                 ], rest}

              {14, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   afk_info:
                     msg.afk_info ++
                       [Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo.decode!(delimited)]
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
          Soulless.Tourney.Lq.GameFinalSnapshot,
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
        2 => {:state, {:scalar, 0}, :uint32},
        3 => {:category, {:scalar, 0}, :uint32},
        4 => {:mode, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMode}},
        5 => {:meta, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMetaData}},
        6 =>
          {:calculate_param, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}},
        7 => {:create_time, {:scalar, 0}, :uint32},
        8 => {:start_time, {:scalar, 0}, :uint32},
        9 => {:finish_time, {:scalar, 0}, :uint32},
        10 => {:seats, :unpacked, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat}},
        11 => {:rounds, :unpacked, {:message, Soulless.Tourney.Lq.GameRoundSnapshot}},
        12 => {:account_views, :unpacked, {:message, Soulless.Tourney.Lq.PlayerGameView}},
        13 =>
          {:final_players, :unpacked,
           {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}},
        14 => {:afk_info, :unpacked, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_views: {12, :unpacked, {:message, Soulless.Tourney.Lq.PlayerGameView}},
        afk_info: {14, :unpacked, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}},
        calculate_param:
          {6, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}},
        category: {3, {:scalar, 0}, :uint32},
        create_time: {7, {:scalar, 0}, :uint32},
        final_players:
          {13, :unpacked, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}},
        finish_time: {9, {:scalar, 0}, :uint32},
        meta: {5, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMetaData}},
        mode: {4, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMode}},
        rounds: {11, :unpacked, {:message, Soulless.Tourney.Lq.GameRoundSnapshot}},
        seats: {10, :unpacked, {:message, Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat}},
        start_time: {8, {:scalar, 0}, :uint32},
        state: {2, {:scalar, 0}, :uint32},
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
          json_name: "state",
          kind: {:scalar, 0},
          label: :optional,
          name: :state,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "category",
          kind: {:scalar, 0},
          label: :optional,
          name: :category,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "mode",
          kind: {:scalar, nil},
          label: :optional,
          name: :mode,
          tag: 4,
          type: {:message, Soulless.Tourney.Lq.GameMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "meta",
          kind: {:scalar, nil},
          label: :optional,
          name: :meta,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.GameMetaData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "calculateParam",
          kind: {:scalar, nil},
          label: :optional,
          name: :calculate_param,
          tag: 6,
          type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :create_time,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "finishTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :finish_time,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "seats",
          kind: :unpacked,
          label: :repeated,
          name: :seats,
          tag: 10,
          type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rounds",
          kind: :unpacked,
          label: :repeated,
          name: :rounds,
          tag: 11,
          type: {:message, Soulless.Tourney.Lq.GameRoundSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountViews",
          kind: :unpacked,
          label: :repeated,
          name: :account_views,
          tag: 12,
          type: {:message, Soulless.Tourney.Lq.PlayerGameView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "finalPlayers",
          kind: :unpacked,
          label: :repeated,
          name: :final_players,
          tag: 13,
          type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}
        },
        %{
          __struct__: Protox.Field,
          json_name: "afkInfo",
          kind: :unpacked,
          label: :repeated,
          name: :afk_info,
          tag: 14,
          type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}
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
        def field_def(:state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:category) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "category",
             kind: {:scalar, 0},
             label: :optional,
             name: :category,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("category") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "category",
             kind: {:scalar, 0},
             label: :optional,
             name: :category,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, nil},
             label: :optional,
             name: :mode,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.GameMode}
           }}
        end

        def field_def("mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, nil},
             label: :optional,
             name: :mode,
             tag: 4,
             type: {:message, Soulless.Tourney.Lq.GameMode}
           }}
        end

        []
      ),
      (
        def field_def(:meta) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "meta",
             kind: {:scalar, nil},
             label: :optional,
             name: :meta,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.GameMetaData}
           }}
        end

        def field_def("meta") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "meta",
             kind: {:scalar, nil},
             label: :optional,
             name: :meta,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.GameMetaData}
           }}
        end

        []
      ),
      (
        def field_def(:calculate_param) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "calculateParam",
             kind: {:scalar, nil},
             label: :optional,
             name: :calculate_param,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}
           }}
        end

        def field_def("calculateParam") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "calculateParam",
             kind: {:scalar, nil},
             label: :optional,
             name: :calculate_param,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}
           }}
        end

        def field_def("calculate_param") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "calculateParam",
             kind: {:scalar, nil},
             label: :optional,
             name: :calculate_param,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam}
           }}
        end
      ),
      (
        def field_def(:create_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("createTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("create_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end
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
             tag: 8,
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
             tag: 8,
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
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:finish_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("finishTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("finish_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:seats) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seats",
             kind: :unpacked,
             label: :repeated,
             name: :seats,
             tag: 10,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat}
           }}
        end

        def field_def("seats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seats",
             kind: :unpacked,
             label: :repeated,
             name: :seats,
             tag: 10,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.GameSeat}
           }}
        end

        []
      ),
      (
        def field_def(:rounds) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rounds",
             kind: :unpacked,
             label: :repeated,
             name: :rounds,
             tag: 11,
             type: {:message, Soulless.Tourney.Lq.GameRoundSnapshot}
           }}
        end

        def field_def("rounds") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rounds",
             kind: :unpacked,
             label: :repeated,
             name: :rounds,
             tag: 11,
             type: {:message, Soulless.Tourney.Lq.GameRoundSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:account_views) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountViews",
             kind: :unpacked,
             label: :repeated,
             name: :account_views,
             tag: 12,
             type: {:message, Soulless.Tourney.Lq.PlayerGameView}
           }}
        end

        def field_def("accountViews") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountViews",
             kind: :unpacked,
             label: :repeated,
             name: :account_views,
             tag: 12,
             type: {:message, Soulless.Tourney.Lq.PlayerGameView}
           }}
        end

        def field_def("account_views") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountViews",
             kind: :unpacked,
             label: :repeated,
             name: :account_views,
             tag: 12,
             type: {:message, Soulless.Tourney.Lq.PlayerGameView}
           }}
        end
      ),
      (
        def field_def(:final_players) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPlayers",
             kind: :unpacked,
             label: :repeated,
             name: :final_players,
             tag: 13,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}
           }}
        end

        def field_def("finalPlayers") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPlayers",
             kind: :unpacked,
             label: :repeated,
             name: :final_players,
             tag: 13,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}
           }}
        end

        def field_def("final_players") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPlayers",
             kind: :unpacked,
             label: :repeated,
             name: :final_players,
             tag: 13,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer}
           }}
        end
      ),
      (
        def field_def(:afk_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "afkInfo",
             kind: :unpacked,
             label: :repeated,
             name: :afk_info,
             tag: 14,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}
           }}
        end

        def field_def("afkInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "afkInfo",
             kind: :unpacked,
             label: :repeated,
             name: :afk_info,
             tag: 14,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}
           }}
        end

        def field_def("afk_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "afkInfo",
             kind: :unpacked,
             label: :repeated,
             name: :afk_info,
             tag: 14,
             type: {:message, Soulless.Tourney.Lq.GameFinalSnapshot.AFKInfo}
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
      def default(:uuid) do
        {:ok, ""}
      end,
      def default(:state) do
        {:ok, 0}
      end,
      def default(:category) do
        {:ok, 0}
      end,
      def default(:mode) do
        {:ok, nil}
      end,
      def default(:meta) do
        {:ok, nil}
      end,
      def default(:calculate_param) do
        {:ok, nil}
      end,
      def default(:create_time) do
        {:ok, 0}
      end,
      def default(:start_time) do
        {:ok, 0}
      end,
      def default(:finish_time) do
        {:ok, 0}
      end,
      def default(:seats) do
        {:error, :no_default_value}
      end,
      def default(:rounds) do
        {:error, :no_default_value}
      end,
      def default(:account_views) do
        {:error, :no_default_value}
      end,
      def default(:final_players) do
        {:error, :no_default_value}
      end,
      def default(:afk_info) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end