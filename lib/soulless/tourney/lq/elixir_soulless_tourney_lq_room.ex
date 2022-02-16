# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.Room do
  @moduledoc false
  defstruct room_id: 0,
            owner_id: 0,
            mode: nil,
            max_player_count: 0,
            persons: [],
            ready_list: [],
            is_playing: false,
            public_live: false,
            robot_count: 0,
            tournament_id: 0,
            seq: 0,
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
        |> encode_room_id(msg)
        |> encode_owner_id(msg)
        |> encode_mode(msg)
        |> encode_max_player_count(msg)
        |> encode_persons(msg)
        |> encode_ready_list(msg)
        |> encode_is_playing(msg)
        |> encode_public_live(msg)
        |> encode_robot_count(msg)
        |> encode_tournament_id(msg)
        |> encode_seq(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_room_id(acc, msg) do
        try do
          if msg.room_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.room_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:room_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_owner_id(acc, msg) do
        try do
          if msg.owner_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.owner_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:owner_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_mode(acc, msg) do
        try do
          if msg.mode == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.mode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_max_player_count(acc, msg) do
        try do
          if msg.max_player_count == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.max_player_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:max_player_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_persons(acc, msg) do
        try do
          case msg.persons do
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
            reraise Protox.EncodingError.new(:persons, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ready_list(acc, msg) do
        try do
          case msg.ready_list do
            [] ->
              acc

            values ->
              [
                acc,
                "2",
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
            reraise Protox.EncodingError.new(:ready_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_playing(acc, msg) do
        try do
          if msg.is_playing == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.is_playing)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_playing, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_public_live(acc, msg) do
        try do
          if msg.public_live == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.public_live)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:public_live, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_robot_count(acc, msg) do
        try do
          if msg.robot_count == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.robot_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:robot_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tournament_id(acc, msg) do
        try do
          if msg.tournament_id == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.tournament_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tournament_id, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_seq(acc, msg) do
        try do
          if msg.seq == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.seq)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:seq, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.Room))
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
              {[room_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[owner_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 mode:
                   Protox.MergeMessage.merge(
                     msg.mode,
                     Soulless.Tourney.Lq.GameMode.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[max_player_count: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[persons: msg.persons ++ [Soulless.Tourney.Lq.PlayerGameView.decode!(delimited)]],
               rest}

            {6, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[ready_list: msg.ready_list ++ Protox.Decode.parse_repeated_uint32([], delimited)],
               rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ready_list: msg.ready_list ++ [value]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_playing: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[public_live: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[robot_count: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tournament_id: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[seq: value], rest}

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
        Soulless.Tourney.Lq.Room,
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
        1 => {:room_id, {:scalar, 0}, :uint32},
        2 => {:owner_id, {:scalar, 0}, :uint32},
        3 => {:mode, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMode}},
        4 => {:max_player_count, {:scalar, 0}, :uint32},
        5 => {:persons, :unpacked, {:message, Soulless.Tourney.Lq.PlayerGameView}},
        6 => {:ready_list, :packed, :uint32},
        7 => {:is_playing, {:scalar, false}, :bool},
        8 => {:public_live, {:scalar, false}, :bool},
        9 => {:robot_count, {:scalar, 0}, :uint32},
        10 => {:tournament_id, {:scalar, 0}, :uint32},
        11 => {:seq, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        is_playing: {7, {:scalar, false}, :bool},
        max_player_count: {4, {:scalar, 0}, :uint32},
        mode: {3, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameMode}},
        owner_id: {2, {:scalar, 0}, :uint32},
        persons: {5, :unpacked, {:message, Soulless.Tourney.Lq.PlayerGameView}},
        public_live: {8, {:scalar, false}, :bool},
        ready_list: {6, :packed, :uint32},
        robot_count: {9, {:scalar, 0}, :uint32},
        room_id: {1, {:scalar, 0}, :uint32},
        seq: {11, {:scalar, 0}, :uint32},
        tournament_id: {10, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "roomId",
          kind: {:scalar, 0},
          label: :optional,
          name: :room_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ownerId",
          kind: {:scalar, 0},
          label: :optional,
          name: :owner_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "mode",
          kind: {:scalar, nil},
          label: :optional,
          name: :mode,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.GameMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxPlayerCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_player_count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "persons",
          kind: :unpacked,
          label: :repeated,
          name: :persons,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.PlayerGameView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "readyList",
          kind: :packed,
          label: :repeated,
          name: :ready_list,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isPlaying",
          kind: {:scalar, false},
          label: :optional,
          name: :is_playing,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "publicLive",
          kind: {:scalar, false},
          label: :optional,
          name: :public_live,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "robotCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :robot_count,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tournamentId",
          kind: {:scalar, 0},
          label: :optional,
          name: :tournament_id,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "seq",
          kind: {:scalar, 0},
          label: :optional,
          name: :seq,
          tag: 11,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:room_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("roomId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("room_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:owner_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("ownerId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("owner_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 2,
             type: :uint32
           }}
        end
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
             tag: 3,
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
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.GameMode}
           }}
        end

        []
      ),
      (
        def field_def(:max_player_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxPlayerCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_player_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("maxPlayerCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxPlayerCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_player_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("max_player_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxPlayerCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_player_count,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:persons) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "persons",
             kind: :unpacked,
             label: :repeated,
             name: :persons,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PlayerGameView}
           }}
        end

        def field_def("persons") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "persons",
             kind: :unpacked,
             label: :repeated,
             name: :persons,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PlayerGameView}
           }}
        end

        []
      ),
      (
        def field_def(:ready_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyList",
             kind: :packed,
             label: :repeated,
             name: :ready_list,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("readyList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyList",
             kind: :packed,
             label: :repeated,
             name: :ready_list,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("ready_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyList",
             kind: :packed,
             label: :repeated,
             name: :ready_list,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:is_playing) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isPlaying",
             kind: {:scalar, false},
             label: :optional,
             name: :is_playing,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("isPlaying") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isPlaying",
             kind: {:scalar, false},
             label: :optional,
             name: :is_playing,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("is_playing") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isPlaying",
             kind: {:scalar, false},
             label: :optional,
             name: :is_playing,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:public_live) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicLive",
             kind: {:scalar, false},
             label: :optional,
             name: :public_live,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("publicLive") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicLive",
             kind: {:scalar, false},
             label: :optional,
             name: :public_live,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("public_live") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicLive",
             kind: {:scalar, false},
             label: :optional,
             name: :public_live,
             tag: 8,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:robot_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("robotCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("robot_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:tournament_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tournamentId",
             kind: {:scalar, 0},
             label: :optional,
             name: :tournament_id,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("tournamentId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tournamentId",
             kind: {:scalar, 0},
             label: :optional,
             name: :tournament_id,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("tournament_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tournamentId",
             kind: {:scalar, 0},
             label: :optional,
             name: :tournament_id,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:seq) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seq",
             kind: {:scalar, 0},
             label: :optional,
             name: :seq,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("seq") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seq",
             kind: {:scalar, 0},
             label: :optional,
             name: :seq,
             tag: 11,
             type: :uint32
           }}
        end

        []
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
    def default(:room_id) do
      {:ok, 0}
    end,
    def default(:owner_id) do
      {:ok, 0}
    end,
    def default(:mode) do
      {:ok, nil}
    end,
    def default(:max_player_count) do
      {:ok, 0}
    end,
    def default(:persons) do
      {:error, :no_default_value}
    end,
    def default(:ready_list) do
      {:error, :no_default_value}
    end,
    def default(:is_playing) do
      {:ok, false}
    end,
    def default(:public_live) do
      {:ok, false}
    end,
    def default(:robot_count) do
      {:ok, 0}
    end,
    def default(:tournament_id) do
      {:ok, 0}
    end,
    def default(:seq) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end