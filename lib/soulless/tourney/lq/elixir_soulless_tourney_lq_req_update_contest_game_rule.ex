# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.ReqUpdateContestGameRule do
  @moduledoc false
  defstruct contest_name: "",
            start_time: 0,
            finish_time: 0,
            open: false,
            rank_rule: 0,
            game_rule_setting: nil,
            auto_match: false,
            auto_disable_end_chat: false,
            contest_type: 0,
            banned_zones: "",
            hidden_zones: "",
            emoji_switch: false,
            player_roster_type: 0,
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
        |> encode_contest_name(msg)
        |> encode_start_time(msg)
        |> encode_finish_time(msg)
        |> encode_open(msg)
        |> encode_rank_rule(msg)
        |> encode_game_rule_setting(msg)
        |> encode_auto_match(msg)
        |> encode_auto_disable_end_chat(msg)
        |> encode_contest_type(msg)
        |> encode_banned_zones(msg)
        |> encode_hidden_zones(msg)
        |> encode_emoji_switch(msg)
        |> encode_player_roster_type(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_contest_name(acc, msg) do
        try do
          if msg.contest_name == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.contest_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_name, "invalid field value"), __STACKTRACE__
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
      defp encode_finish_time(acc, msg) do
        try do
          if msg.finish_time == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.finish_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:finish_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_open(acc, msg) do
        try do
          if msg.open == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.open)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:open, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rank_rule(acc, msg) do
        try do
          if msg.rank_rule == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.rank_rule)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rank_rule, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_rule_setting(acc, msg) do
        try do
          if msg.game_rule_setting == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.game_rule_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_rule_setting, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_auto_match(acc, msg) do
        try do
          if msg.auto_match == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.auto_match)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:auto_match, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_auto_disable_end_chat(acc, msg) do
        try do
          if msg.auto_disable_end_chat == false do
            acc
          else
            [acc, "@", Protox.Encode.encode_bool(msg.auto_disable_end_chat)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:auto_disable_end_chat, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_contest_type(acc, msg) do
        try do
          if msg.contest_type == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.contest_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_banned_zones(acc, msg) do
        try do
          if msg.banned_zones == "" do
            acc
          else
            [acc, "R", Protox.Encode.encode_string(msg.banned_zones)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:banned_zones, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hidden_zones(acc, msg) do
        try do
          if msg.hidden_zones == "" do
            acc
          else
            [acc, "Z", Protox.Encode.encode_string(msg.hidden_zones)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hidden_zones, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_emoji_switch(acc, msg) do
        try do
          if msg.emoji_switch == false do
            acc
          else
            [acc, "`", Protox.Encode.encode_bool(msg.emoji_switch)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:emoji_switch, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_player_roster_type(acc, msg) do
        try do
          if msg.player_roster_type == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.player_roster_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:player_roster_type, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.ReqUpdateContestGameRule))
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
              {[contest_name: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[finish_time: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[open: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rank_rule: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 game_rule_setting:
                   Protox.MergeMessage.merge(
                     msg.game_rule_setting,
                     Soulless.Tourney.Lq.GameRuleSetting.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[auto_match: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[auto_disable_end_chat: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[contest_type: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[banned_zones: delimited], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hidden_zones: delimited], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[emoji_switch: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[player_roster_type: value], rest}

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
        Soulless.Tourney.Lq.ReqUpdateContestGameRule,
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
        1 => {:contest_name, {:scalar, ""}, :string},
        2 => {:start_time, {:scalar, 0}, :uint32},
        3 => {:finish_time, {:scalar, 0}, :uint32},
        4 => {:open, {:scalar, false}, :bool},
        5 => {:rank_rule, {:scalar, 0}, :uint32},
        6 =>
          {:game_rule_setting, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameRuleSetting}},
        7 => {:auto_match, {:scalar, false}, :bool},
        8 => {:auto_disable_end_chat, {:scalar, false}, :bool},
        9 => {:contest_type, {:scalar, 0}, :uint32},
        10 => {:banned_zones, {:scalar, ""}, :string},
        11 => {:hidden_zones, {:scalar, ""}, :string},
        12 => {:emoji_switch, {:scalar, false}, :bool},
        13 => {:player_roster_type, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        auto_disable_end_chat: {8, {:scalar, false}, :bool},
        auto_match: {7, {:scalar, false}, :bool},
        banned_zones: {10, {:scalar, ""}, :string},
        contest_name: {1, {:scalar, ""}, :string},
        contest_type: {9, {:scalar, 0}, :uint32},
        emoji_switch: {12, {:scalar, false}, :bool},
        finish_time: {3, {:scalar, 0}, :uint32},
        game_rule_setting: {6, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameRuleSetting}},
        hidden_zones: {11, {:scalar, ""}, :string},
        open: {4, {:scalar, false}, :bool},
        player_roster_type: {13, {:scalar, 0}, :uint32},
        rank_rule: {5, {:scalar, 0}, :uint32},
        start_time: {2, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "contestName",
          kind: {:scalar, ""},
          label: :optional,
          name: :contest_name,
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
          json_name: "finishTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :finish_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "open",
          kind: {:scalar, false},
          label: :optional,
          name: :open,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankRule",
          kind: {:scalar, 0},
          label: :optional,
          name: :rank_rule,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameRuleSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_rule_setting,
          tag: 6,
          type: {:message, Soulless.Tourney.Lq.GameRuleSetting}
        },
        %{
          __struct__: Protox.Field,
          json_name: "autoMatch",
          kind: {:scalar, false},
          label: :optional,
          name: :auto_match,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "autoDisableEndChat",
          kind: {:scalar, false},
          label: :optional,
          name: :auto_disable_end_chat,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestType",
          kind: {:scalar, 0},
          label: :optional,
          name: :contest_type,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "bannedZones",
          kind: {:scalar, ""},
          label: :optional,
          name: :banned_zones,
          tag: 10,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "hiddenZones",
          kind: {:scalar, ""},
          label: :optional,
          name: :hidden_zones,
          tag: 11,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "emojiSwitch",
          kind: {:scalar, false},
          label: :optional,
          name: :emoji_switch,
          tag: 12,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "playerRosterType",
          kind: {:scalar, 0},
          label: :optional,
          name: :player_roster_type,
          tag: 13,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:contest_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("contestName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
           }}
        end

        def field_def("contest_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
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
        def field_def(:finish_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:open) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "open",
             kind: {:scalar, false},
             label: :optional,
             name: :open,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("open") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "open",
             kind: {:scalar, false},
             label: :optional,
             name: :open,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:rank_rule) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("rankRule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("rank_rule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_rule_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameRuleSetting}
           }}
        end

        def field_def("gameRuleSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameRuleSetting}
           }}
        end

        def field_def("game_rule_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.GameRuleSetting}
           }}
        end
      ),
      (
        def field_def(:auto_match) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("autoMatch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("auto_match") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:auto_disable_end_chat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoDisableEndChat",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_disable_end_chat,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("autoDisableEndChat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoDisableEndChat",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_disable_end_chat,
             tag: 8,
             type: :bool
           }}
        end

        def field_def("auto_disable_end_chat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoDisableEndChat",
             kind: {:scalar, false},
             label: :optional,
             name: :auto_disable_end_chat,
             tag: 8,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:contest_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("contestType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("contest_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:banned_zones) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bannedZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :banned_zones,
             tag: 10,
             type: :string
           }}
        end

        def field_def("bannedZones") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bannedZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :banned_zones,
             tag: 10,
             type: :string
           }}
        end

        def field_def("banned_zones") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bannedZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :banned_zones,
             tag: 10,
             type: :string
           }}
        end
      ),
      (
        def field_def(:hidden_zones) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :hidden_zones,
             tag: 11,
             type: :string
           }}
        end

        def field_def("hiddenZones") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :hidden_zones,
             tag: 11,
             type: :string
           }}
        end

        def field_def("hidden_zones") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenZones",
             kind: {:scalar, ""},
             label: :optional,
             name: :hidden_zones,
             tag: 11,
             type: :string
           }}
        end
      ),
      (
        def field_def(:emoji_switch) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, false},
             label: :optional,
             name: :emoji_switch,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("emojiSwitch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, false},
             label: :optional,
             name: :emoji_switch,
             tag: 12,
             type: :bool
           }}
        end

        def field_def("emoji_switch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, false},
             label: :optional,
             name: :emoji_switch,
             tag: 12,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:player_roster_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerRosterType",
             kind: {:scalar, 0},
             label: :optional,
             name: :player_roster_type,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("playerRosterType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerRosterType",
             kind: {:scalar, 0},
             label: :optional,
             name: :player_roster_type,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("player_roster_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerRosterType",
             kind: {:scalar, 0},
             label: :optional,
             name: :player_roster_type,
             tag: 13,
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
    def default(:contest_name) do
      {:ok, ""}
    end,
    def default(:start_time) do
      {:ok, 0}
    end,
    def default(:finish_time) do
      {:ok, 0}
    end,
    def default(:open) do
      {:ok, false}
    end,
    def default(:rank_rule) do
      {:ok, 0}
    end,
    def default(:game_rule_setting) do
      {:ok, nil}
    end,
    def default(:auto_match) do
      {:ok, false}
    end,
    def default(:auto_disable_end_chat) do
      {:ok, false}
    end,
    def default(:contest_type) do
      {:ok, 0}
    end,
    def default(:banned_zones) do
      {:ok, ""}
    end,
    def default(:hidden_zones) do
      {:ok, ""}
    end,
    def default(:emoji_switch) do
      {:ok, false}
    end,
    def default(:player_roster_type) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end