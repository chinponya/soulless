# credo:disable-for-this-file
defmodule Soulless.Game.Lq.CustomizedContestDetail do
  @moduledoc false
  defstruct unique_id: 0,
            contest_id: 0,
            contest_name: "",
            state: 0,
            creator_id: 0,
            create_time: 0,
            start_time: 0,
            finish_time: 0,
            open: false,
            rank_rule: 0,
            game_mode: nil,
            private_notice: "",
            observer_switch: 0,
            emoji_switch: 0,
            contest_type: 0,
            disable_broadcast: 0,
            signup_start_time: 0,
            signup_end_time: 0,
            signup_type: 0,
            auto_match: 0,
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
        |> encode_unique_id(msg)
        |> encode_contest_id(msg)
        |> encode_contest_name(msg)
        |> encode_state(msg)
        |> encode_creator_id(msg)
        |> encode_create_time(msg)
        |> encode_start_time(msg)
        |> encode_finish_time(msg)
        |> encode_open(msg)
        |> encode_rank_rule(msg)
        |> encode_game_mode(msg)
        |> encode_private_notice(msg)
        |> encode_observer_switch(msg)
        |> encode_emoji_switch(msg)
        |> encode_contest_type(msg)
        |> encode_disable_broadcast(msg)
        |> encode_signup_start_time(msg)
        |> encode_signup_end_time(msg)
        |> encode_signup_type(msg)
        |> encode_auto_match(msg)
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
      defp encode_contest_id(acc, msg) do
        try do
          if msg.contest_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.contest_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_contest_name(acc, msg) do
        try do
          if msg.contest_name == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.contest_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_state(acc, msg) do
        try do
          if msg.state == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_creator_id(acc, msg) do
        try do
          if msg.creator_id == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.creator_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:creator_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_time(acc, msg) do
        try do
          if msg.create_time == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.create_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_start_time(acc, msg) do
        try do
          if msg.start_time == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.start_time)]
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
            [acc, "@", Protox.Encode.encode_uint32(msg.finish_time)]
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
            [acc, "H", Protox.Encode.encode_bool(msg.open)]
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
            [acc, "P", Protox.Encode.encode_uint32(msg.rank_rule)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rank_rule, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_mode(acc, msg) do
        try do
          if msg.game_mode == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.game_mode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_mode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_private_notice(acc, msg) do
        try do
          if msg.private_notice == "" do
            acc
          else
            [acc, "b", Protox.Encode.encode_string(msg.private_notice)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:private_notice, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_observer_switch(acc, msg) do
        try do
          if msg.observer_switch == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.observer_switch)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:observer_switch, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_emoji_switch(acc, msg) do
        try do
          if msg.emoji_switch == 0 do
            acc
          else
            [acc, "p", Protox.Encode.encode_uint32(msg.emoji_switch)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:emoji_switch, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_contest_type(acc, msg) do
        try do
          if msg.contest_type == 0 do
            acc
          else
            [acc, "x", Protox.Encode.encode_uint32(msg.contest_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_disable_broadcast(acc, msg) do
        try do
          if msg.disable_broadcast == 0 do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_uint32(msg.disable_broadcast)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:disable_broadcast, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_signup_start_time(acc, msg) do
        try do
          if msg.signup_start_time == 0 do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_uint32(msg.signup_start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:signup_start_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_signup_end_time(acc, msg) do
        try do
          if msg.signup_end_time == 0 do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_uint32(msg.signup_end_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:signup_end_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_signup_type(acc, msg) do
        try do
          if msg.signup_type == 0 do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_uint32(msg.signup_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:signup_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_auto_match(acc, msg) do
        try do
          if msg.auto_match == 0 do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_uint32(msg.auto_match)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:auto_match, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.CustomizedContestDetail))
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
              {[contest_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[contest_name: delimited], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[state: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[creator_id: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[create_time: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[finish_time: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[open: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rank_rule: value], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 game_mode:
                   Protox.MergeMessage.merge(
                     msg.game_mode,
                     Soulless.Game.Lq.GameMode.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[private_notice: delimited], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[observer_switch: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[emoji_switch: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[contest_type: value], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[disable_broadcast: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[signup_start_time: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[signup_end_time: value], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[signup_type: value], rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[auto_match: value], rest}

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
        Soulless.Game.Lq.CustomizedContestDetail,
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
        1 => {:unique_id, {:scalar, 0}, :uint32},
        2 => {:contest_id, {:scalar, 0}, :uint32},
        3 => {:contest_name, {:scalar, ""}, :string},
        4 => {:state, {:scalar, 0}, :uint32},
        5 => {:creator_id, {:scalar, 0}, :uint32},
        6 => {:create_time, {:scalar, 0}, :uint32},
        7 => {:start_time, {:scalar, 0}, :uint32},
        8 => {:finish_time, {:scalar, 0}, :uint32},
        9 => {:open, {:scalar, false}, :bool},
        10 => {:rank_rule, {:scalar, 0}, :uint32},
        11 => {:game_mode, {:scalar, nil}, {:message, Soulless.Game.Lq.GameMode}},
        12 => {:private_notice, {:scalar, ""}, :string},
        13 => {:observer_switch, {:scalar, 0}, :uint32},
        14 => {:emoji_switch, {:scalar, 0}, :uint32},
        15 => {:contest_type, {:scalar, 0}, :uint32},
        16 => {:disable_broadcast, {:scalar, 0}, :uint32},
        17 => {:signup_start_time, {:scalar, 0}, :uint32},
        18 => {:signup_end_time, {:scalar, 0}, :uint32},
        19 => {:signup_type, {:scalar, 0}, :uint32},
        20 => {:auto_match, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        auto_match: {20, {:scalar, 0}, :uint32},
        contest_id: {2, {:scalar, 0}, :uint32},
        contest_name: {3, {:scalar, ""}, :string},
        contest_type: {15, {:scalar, 0}, :uint32},
        create_time: {6, {:scalar, 0}, :uint32},
        creator_id: {5, {:scalar, 0}, :uint32},
        disable_broadcast: {16, {:scalar, 0}, :uint32},
        emoji_switch: {14, {:scalar, 0}, :uint32},
        finish_time: {8, {:scalar, 0}, :uint32},
        game_mode: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.GameMode}},
        observer_switch: {13, {:scalar, 0}, :uint32},
        open: {9, {:scalar, false}, :bool},
        private_notice: {12, {:scalar, ""}, :string},
        rank_rule: {10, {:scalar, 0}, :uint32},
        signup_end_time: {18, {:scalar, 0}, :uint32},
        signup_start_time: {17, {:scalar, 0}, :uint32},
        signup_type: {19, {:scalar, 0}, :uint32},
        start_time: {7, {:scalar, 0}, :uint32},
        state: {4, {:scalar, 0}, :uint32},
        unique_id: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
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
          json_name: "contestId",
          kind: {:scalar, 0},
          label: :optional,
          name: :contest_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestName",
          kind: {:scalar, ""},
          label: :optional,
          name: :contest_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "state",
          kind: {:scalar, 0},
          label: :optional,
          name: :state,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "creatorId",
          kind: {:scalar, 0},
          label: :optional,
          name: :creator_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :create_time,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "finishTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :finish_time,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "open",
          kind: {:scalar, false},
          label: :optional,
          name: :open,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankRule",
          kind: {:scalar, 0},
          label: :optional,
          name: :rank_rule,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameMode",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_mode,
          tag: 11,
          type: {:message, Soulless.Game.Lq.GameMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "privateNotice",
          kind: {:scalar, ""},
          label: :optional,
          name: :private_notice,
          tag: 12,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "observerSwitch",
          kind: {:scalar, 0},
          label: :optional,
          name: :observer_switch,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "emojiSwitch",
          kind: {:scalar, 0},
          label: :optional,
          name: :emoji_switch,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestType",
          kind: {:scalar, 0},
          label: :optional,
          name: :contest_type,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "disableBroadcast",
          kind: {:scalar, 0},
          label: :optional,
          name: :disable_broadcast,
          tag: 16,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "signupStartTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :signup_start_time,
          tag: 17,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "signupEndTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :signup_end_time,
          tag: 18,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "signupType",
          kind: {:scalar, 0},
          label: :optional,
          name: :signup_type,
          tag: 19,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "autoMatch",
          kind: {:scalar, 0},
          label: :optional,
          name: :auto_match,
          tag: 20,
          type: :uint32
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
        def field_def(:contest_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("contestId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("contest_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:contest_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end
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
             tag: 4,
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
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:creator_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("creatorId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("creator_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
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
             tag: 6,
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
             tag: 6,
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
             tag: 6,
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
             tag: 7,
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
             tag: 7,
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
             tag: 7,
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
             tag: 8,
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
             tag: 8,
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
             tag: 8,
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
             tag: 9,
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
             tag: 9,
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
             tag: 10,
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
             tag: 10,
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
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_mode,
             tag: 11,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end

        def field_def("gameMode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_mode,
             tag: 11,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end

        def field_def("game_mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_mode,
             tag: 11,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end
      ),
      (
        def field_def(:private_notice) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "privateNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :private_notice,
             tag: 12,
             type: :string
           }}
        end

        def field_def("privateNotice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "privateNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :private_notice,
             tag: 12,
             type: :string
           }}
        end

        def field_def("private_notice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "privateNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :private_notice,
             tag: 12,
             type: :string
           }}
        end
      ),
      (
        def field_def(:observer_switch) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "observerSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :observer_switch,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("observerSwitch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "observerSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :observer_switch,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("observer_switch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "observerSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :observer_switch,
             tag: 13,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:emoji_switch) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :emoji_switch,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("emojiSwitch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :emoji_switch,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("emoji_switch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emojiSwitch",
             kind: {:scalar, 0},
             label: :optional,
             name: :emoji_switch,
             tag: 14,
             type: :uint32
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
             tag: 15,
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
             tag: 15,
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
             tag: 15,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:disable_broadcast) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableBroadcast",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_broadcast,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("disableBroadcast") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableBroadcast",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_broadcast,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("disable_broadcast") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "disableBroadcast",
             kind: {:scalar, 0},
             label: :optional,
             name: :disable_broadcast,
             tag: 16,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:signup_start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_start_time,
             tag: 17,
             type: :uint32
           }}
        end

        def field_def("signupStartTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_start_time,
             tag: 17,
             type: :uint32
           }}
        end

        def field_def("signup_start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_start_time,
             tag: 17,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:signup_end_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupEndTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_end_time,
             tag: 18,
             type: :uint32
           }}
        end

        def field_def("signupEndTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupEndTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_end_time,
             tag: 18,
             type: :uint32
           }}
        end

        def field_def("signup_end_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupEndTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_end_time,
             tag: 18,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:signup_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupType",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_type,
             tag: 19,
             type: :uint32
           }}
        end

        def field_def("signupType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupType",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_type,
             tag: 19,
             type: :uint32
           }}
        end

        def field_def("signup_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupType",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_type,
             tag: 19,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:auto_match) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 20,
             type: :uint32
           }}
        end

        def field_def("autoMatch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 20,
             type: :uint32
           }}
        end

        def field_def("auto_match") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 20,
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
    def default(:unique_id) do
      {:ok, 0}
    end,
    def default(:contest_id) do
      {:ok, 0}
    end,
    def default(:contest_name) do
      {:ok, ""}
    end,
    def default(:state) do
      {:ok, 0}
    end,
    def default(:creator_id) do
      {:ok, 0}
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
    def default(:open) do
      {:ok, false}
    end,
    def default(:rank_rule) do
      {:ok, 0}
    end,
    def default(:game_mode) do
      {:ok, nil}
    end,
    def default(:private_notice) do
      {:ok, ""}
    end,
    def default(:observer_switch) do
      {:ok, 0}
    end,
    def default(:emoji_switch) do
      {:ok, 0}
    end,
    def default(:contest_type) do
      {:ok, 0}
    end,
    def default(:disable_broadcast) do
      {:ok, 0}
    end,
    def default(:signup_start_time) do
      {:ok, 0}
    end,
    def default(:signup_end_time) do
      {:ok, 0}
    end,
    def default(:signup_type) do
      {:ok, 0}
    end,
    def default(:auto_match) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end