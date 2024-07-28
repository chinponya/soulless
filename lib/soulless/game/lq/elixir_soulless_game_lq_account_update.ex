# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountUpdate do
  @moduledoc false
  defstruct numerical: [],
            character: nil,
            bag: nil,
            achievement: nil,
            shilian: nil,
            daily_task: nil,
            title: nil,
            new_recharged_list: [],
            activity_task: nil,
            activity_flip_task: nil,
            activity_period_task: nil,
            activity_random_task: nil,
            challenge: nil,
            ab_match: nil,
            activity: nil,
            activity_segment_task: nil,
            month_ticket: nil,
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
        |> encode_numerical(msg)
        |> encode_character(msg)
        |> encode_bag(msg)
        |> encode_achievement(msg)
        |> encode_shilian(msg)
        |> encode_daily_task(msg)
        |> encode_title(msg)
        |> encode_new_recharged_list(msg)
        |> encode_activity_task(msg)
        |> encode_activity_flip_task(msg)
        |> encode_activity_period_task(msg)
        |> encode_activity_random_task(msg)
        |> encode_challenge(msg)
        |> encode_ab_match(msg)
        |> encode_activity(msg)
        |> encode_activity_segment_task(msg)
        |> encode_month_ticket(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_numerical(acc, msg) do
        try do
          case msg.numerical do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:numerical, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_character(acc, msg) do
        try do
          if msg.character == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.character)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:character, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bag(acc, msg) do
        try do
          if msg.bag == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.bag)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bag, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_achievement(acc, msg) do
        try do
          if msg.achievement == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.achievement)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:achievement, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shilian(acc, msg) do
        try do
          if msg.shilian == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.shilian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shilian, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_daily_task(acc, msg) do
        try do
          if msg.daily_task == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.daily_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:daily_task, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_title(acc, msg) do
        try do
          if msg.title == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.title)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_new_recharged_list(acc, msg) do
        try do
          case msg.new_recharged_list do
            [] ->
              acc

            values ->
              [
                acc,
                "B",
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
            reraise Protox.EncodingError.new(:new_recharged_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_task(acc, msg) do
        try do
          if msg.activity_task == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.activity_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_task, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_flip_task(acc, msg) do
        try do
          if msg.activity_flip_task == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.activity_flip_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_flip_task, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_period_task(acc, msg) do
        try do
          if msg.activity_period_task == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.activity_period_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_period_task, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_random_task(acc, msg) do
        try do
          if msg.activity_random_task == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.activity_random_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_random_task, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_challenge(acc, msg) do
        try do
          if msg.challenge == nil do
            acc
          else
            [acc, "j", Protox.Encode.encode_message(msg.challenge)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:challenge, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ab_match(acc, msg) do
        try do
          if msg.ab_match == nil do
            acc
          else
            [acc, "r", Protox.Encode.encode_message(msg.ab_match)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ab_match, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_activity(acc, msg) do
        try do
          if msg.activity == nil do
            acc
          else
            [acc, "z", Protox.Encode.encode_message(msg.activity)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_activity_segment_task(acc, msg) do
        try do
          if msg.activity_segment_task == nil do
            acc
          else
            [acc, "\x82\x01", Protox.Encode.encode_message(msg.activity_segment_task)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_segment_task, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_month_ticket(acc, msg) do
        try do
          if msg.month_ticket == nil do
            acc
          else
            [acc, "\x8A\x01", Protox.Encode.encode_message(msg.month_ticket)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:month_ticket, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountUpdate))
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
                 numerical:
                   msg.numerical ++
                     [Soulless.Game.Lq.AccountUpdate.NumericalUpdate.decode!(delimited)]
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 character:
                   Protox.MergeMessage.merge(
                     msg.character,
                     Soulless.Game.Lq.AccountUpdate.CharacterUpdate.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 bag:
                   Protox.MergeMessage.merge(
                     msg.bag,
                     Soulless.Game.Lq.BagUpdate.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 achievement:
                   Protox.MergeMessage.merge(
                     msg.achievement,
                     Soulless.Game.Lq.AccountUpdate.AchievementUpdate.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 shilian:
                   Protox.MergeMessage.merge(
                     msg.shilian,
                     Soulless.Game.Lq.AccountShiLian.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 daily_task:
                   Protox.MergeMessage.merge(
                     msg.daily_task,
                     Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 title:
                   Protox.MergeMessage.merge(
                     msg.title,
                     Soulless.Game.Lq.AccountUpdate.TitleUpdate.decode!(delimited)
                   )
               ], rest}

            {8, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 new_recharged_list:
                   msg.new_recharged_list ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[new_recharged_list: msg.new_recharged_list ++ [value]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_task:
                   Protox.MergeMessage.merge(
                     msg.activity_task,
                     Soulless.Game.Lq.AccountUpdate.TaskUpdate.decode!(delimited)
                   )
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_flip_task:
                   Protox.MergeMessage.merge(
                     msg.activity_flip_task,
                     Soulless.Game.Lq.AccountUpdate.TaskUpdate.decode!(delimited)
                   )
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_period_task:
                   Protox.MergeMessage.merge(
                     msg.activity_period_task,
                     Soulless.Game.Lq.AccountUpdate.TaskUpdate.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_random_task:
                   Protox.MergeMessage.merge(
                     msg.activity_random_task,
                     Soulless.Game.Lq.AccountUpdate.TaskUpdate.decode!(delimited)
                   )
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 challenge:
                   Protox.MergeMessage.merge(
                     msg.challenge,
                     Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate.decode!(delimited)
                   )
               ], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 ab_match:
                   Protox.MergeMessage.merge(
                     msg.ab_match,
                     Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.decode!(delimited)
                   )
               ], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity:
                   Protox.MergeMessage.merge(
                     msg.activity,
                     Soulless.Game.Lq.AccountActivityUpdate.decode!(delimited)
                   )
               ], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_segment_task:
                   Protox.MergeMessage.merge(
                     msg.activity_segment_task,
                     Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate.decode!(delimited)
                   )
               ], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 month_ticket:
                   Protox.MergeMessage.merge(
                     msg.month_ticket,
                     Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate.decode!(delimited)
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
        Soulless.Game.Lq.AccountUpdate,
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
        1 => {:numerical, :unpacked, {:message, Soulless.Game.Lq.AccountUpdate.NumericalUpdate}},
        2 =>
          {:character, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.CharacterUpdate}},
        3 => {:bag, {:scalar, nil}, {:message, Soulless.Game.Lq.BagUpdate}},
        4 =>
          {:achievement, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.AchievementUpdate}},
        5 => {:shilian, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountShiLian}},
        6 =>
          {:daily_task, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}},
        7 => {:title, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TitleUpdate}},
        8 => {:new_recharged_list, :packed, :uint32},
        9 =>
          {:activity_task, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        10 =>
          {:activity_flip_task, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        11 =>
          {:activity_period_task, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        12 =>
          {:activity_random_task, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        13 =>
          {:challenge, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate}},
        14 =>
          {:ab_match, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}},
        15 => {:activity, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountActivityUpdate}},
        16 =>
          {:activity_segment_task, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}},
        17 =>
          {:month_ticket, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        ab_match:
          {14, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}},
        achievement:
          {4, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.AchievementUpdate}},
        activity: {15, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountActivityUpdate}},
        activity_flip_task:
          {10, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        activity_period_task:
          {11, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        activity_random_task:
          {12, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        activity_segment_task:
          {16, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}},
        activity_task: {9, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}},
        bag: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.BagUpdate}},
        challenge:
          {13, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate}},
        character:
          {2, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.CharacterUpdate}},
        daily_task:
          {6, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}},
        month_ticket:
          {17, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}},
        new_recharged_list: {8, :packed, :uint32},
        numerical: {1, :unpacked, {:message, Soulless.Game.Lq.AccountUpdate.NumericalUpdate}},
        shilian: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountShiLian}},
        title: {7, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountUpdate.TitleUpdate}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "numerical",
          kind: :unpacked,
          label: :repeated,
          name: :numerical,
          tag: 1,
          type: {:message, Soulless.Game.Lq.AccountUpdate.NumericalUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "character",
          kind: {:scalar, nil},
          label: :optional,
          name: :character,
          tag: 2,
          type: {:message, Soulless.Game.Lq.AccountUpdate.CharacterUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "bag",
          kind: {:scalar, nil},
          label: :optional,
          name: :bag,
          tag: 3,
          type: {:message, Soulless.Game.Lq.BagUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "achievement",
          kind: {:scalar, nil},
          label: :optional,
          name: :achievement,
          tag: 4,
          type: {:message, Soulless.Game.Lq.AccountUpdate.AchievementUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shilian",
          kind: {:scalar, nil},
          label: :optional,
          name: :shilian,
          tag: 5,
          type: {:message, Soulless.Game.Lq.AccountShiLian}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dailyTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :daily_task,
          tag: 6,
          type: {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, nil},
          label: :optional,
          name: :title,
          tag: 7,
          type: {:message, Soulless.Game.Lq.AccountUpdate.TitleUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "newRechargedList",
          kind: :packed,
          label: :repeated,
          name: :new_recharged_list,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_task,
          tag: 9,
          type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityFlipTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_flip_task,
          tag: 10,
          type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityPeriodTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_period_task,
          tag: 11,
          type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityRandomTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_random_task,
          tag: 12,
          type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "challenge",
          kind: {:scalar, nil},
          label: :optional,
          name: :challenge,
          tag: 13,
          type: {:message, Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "abMatch",
          kind: {:scalar, nil},
          label: :optional,
          name: :ab_match,
          tag: 14,
          type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activity",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity,
          tag: 15,
          type: {:message, Soulless.Game.Lq.AccountActivityUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activitySegmentTask",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_segment_task,
          tag: 16,
          type: {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthTicket",
          kind: {:scalar, nil},
          label: :optional,
          name: :month_ticket,
          tag: 17,
          type: {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:numerical) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "numerical",
             kind: :unpacked,
             label: :repeated,
             name: :numerical,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountUpdate.NumericalUpdate}
           }}
        end

        def field_def("numerical") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "numerical",
             kind: :unpacked,
             label: :repeated,
             name: :numerical,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountUpdate.NumericalUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:character) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountUpdate.CharacterUpdate}
           }}
        end

        def field_def("character") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountUpdate.CharacterUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:bag) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bag",
             kind: {:scalar, nil},
             label: :optional,
             name: :bag,
             tag: 3,
             type: {:message, Soulless.Game.Lq.BagUpdate}
           }}
        end

        def field_def("bag") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bag",
             kind: {:scalar, nil},
             label: :optional,
             name: :bag,
             tag: 3,
             type: {:message, Soulless.Game.Lq.BagUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:achievement) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievement",
             kind: {:scalar, nil},
             label: :optional,
             name: :achievement,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AchievementUpdate}
           }}
        end

        def field_def("achievement") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievement",
             kind: {:scalar, nil},
             label: :optional,
             name: :achievement,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AchievementUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:shilian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shilian",
             kind: {:scalar, nil},
             label: :optional,
             name: :shilian,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountShiLian}
           }}
        end

        def field_def("shilian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shilian",
             kind: {:scalar, nil},
             label: :optional,
             name: :shilian,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountShiLian}
           }}
        end

        []
      ),
      (
        def field_def(:daily_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :daily_task,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}
           }}
        end

        def field_def("dailyTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :daily_task,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}
           }}
        end

        def field_def("daily_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :daily_task,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.DailyTaskUpdate}
           }}
        end
      ),
      (
        def field_def(:title) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, nil},
             label: :optional,
             name: :title,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TitleUpdate}
           }}
        end

        def field_def("title") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, nil},
             label: :optional,
             name: :title,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TitleUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:new_recharged_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newRechargedList",
             kind: :packed,
             label: :repeated,
             name: :new_recharged_list,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("newRechargedList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newRechargedList",
             kind: :packed,
             label: :repeated,
             name: :new_recharged_list,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("new_recharged_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "newRechargedList",
             kind: :packed,
             label: :repeated,
             name: :new_recharged_list,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:activity_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_task,
             tag: 9,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activityTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_task,
             tag: 9,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activity_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_task,
             tag: 9,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end
      ),
      (
        def field_def(:activity_flip_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityFlipTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_flip_task,
             tag: 10,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activityFlipTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityFlipTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_flip_task,
             tag: 10,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activity_flip_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityFlipTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_flip_task,
             tag: 10,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end
      ),
      (
        def field_def(:activity_period_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityPeriodTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_period_task,
             tag: 11,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activityPeriodTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityPeriodTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_period_task,
             tag: 11,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activity_period_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityPeriodTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_period_task,
             tag: 11,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end
      ),
      (
        def field_def(:activity_random_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityRandomTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_random_task,
             tag: 12,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activityRandomTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityRandomTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_random_task,
             tag: 12,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end

        def field_def("activity_random_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityRandomTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_random_task,
             tag: 12,
             type: {:message, Soulless.Game.Lq.AccountUpdate.TaskUpdate}
           }}
        end
      ),
      (
        def field_def(:challenge) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challenge",
             kind: {:scalar, nil},
             label: :optional,
             name: :challenge,
             tag: 13,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate}
           }}
        end

        def field_def("challenge") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challenge",
             kind: {:scalar, nil},
             label: :optional,
             name: :challenge,
             tag: 13,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountChallengeUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:ab_match) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatch",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}
           }}
        end

        def field_def("abMatch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatch",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}
           }}
        end

        def field_def("ab_match") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatch",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate}
           }}
        end
      ),
      (
        def field_def(:activity) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activity",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity,
             tag: 15,
             type: {:message, Soulless.Game.Lq.AccountActivityUpdate}
           }}
        end

        def field_def("activity") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activity",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity,
             tag: 15,
             type: {:message, Soulless.Game.Lq.AccountActivityUpdate}
           }}
        end

        []
      ),
      (
        def field_def(:activity_segment_task) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activitySegmentTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_segment_task,
             tag: 16,
             type: {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}
           }}
        end

        def field_def("activitySegmentTask") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activitySegmentTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_segment_task,
             tag: 16,
             type: {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}
           }}
        end

        def field_def("activity_segment_task") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activitySegmentTask",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_segment_task,
             tag: 16,
             type: {:message, Soulless.Game.Lq.AccountUpdate.SegmentTaskUpdate}
           }}
        end
      ),
      (
        def field_def(:month_ticket) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 17,
             type: {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}
           }}
        end

        def field_def("monthTicket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 17,
             type: {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}
           }}
        end

        def field_def("month_ticket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 17,
             type: {:message, Soulless.Game.Lq.AccountUpdate.MonthTicketUpdate}
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
    def default(:numerical) do
      {:error, :no_default_value}
    end,
    def default(:character) do
      {:ok, nil}
    end,
    def default(:bag) do
      {:ok, nil}
    end,
    def default(:achievement) do
      {:ok, nil}
    end,
    def default(:shilian) do
      {:ok, nil}
    end,
    def default(:daily_task) do
      {:ok, nil}
    end,
    def default(:title) do
      {:ok, nil}
    end,
    def default(:new_recharged_list) do
      {:error, :no_default_value}
    end,
    def default(:activity_task) do
      {:ok, nil}
    end,
    def default(:activity_flip_task) do
      {:ok, nil}
    end,
    def default(:activity_period_task) do
      {:ok, nil}
    end,
    def default(:activity_random_task) do
      {:ok, nil}
    end,
    def default(:challenge) do
      {:ok, nil}
    end,
    def default(:ab_match) do
      {:ok, nil}
    end,
    def default(:activity) do
      {:ok, nil}
    end,
    def default(:activity_segment_task) do
      {:ok, nil}
    end,
    def default(:month_ticket) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end