# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.AccountDetailStatisticV2) do
  @moduledoc false
  (
    defstruct(
      friend_room_statistic: nil,
      rank_statistic: nil,
      customized_contest_statistic: nil,
      leisure_match_statistic: nil,
      challenge_match_statistic: nil,
      activity_match_statistic: nil,
      ab_match_statistic: nil,
      __uf__: []
    )

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
          |> encode_friend_room_statistic(msg)
          |> encode_rank_statistic(msg)
          |> encode_customized_contest_statistic(msg)
          |> encode_leisure_match_statistic(msg)
          |> encode_challenge_match_statistic(msg)
          |> encode_activity_match_statistic(msg)
          |> encode_ab_match_statistic(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_friend_room_statistic(acc, msg)) do
          try do
            if(msg.friend_room_statistic == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.friend_room_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:friend_room_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_rank_statistic(acc, msg)) do
          try do
            if(msg.rank_statistic == nil) do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_message(msg.rank_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:rank_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_customized_contest_statistic(acc, msg)) do
          try do
            if(msg.customized_contest_statistic == nil) do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_message(msg.customized_contest_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:customized_contest_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_leisure_match_statistic(acc, msg)) do
          try do
            if(msg.leisure_match_statistic == nil) do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.leisure_match_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:leisure_match_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_challenge_match_statistic(acc, msg)) do
          try do
            if(msg.challenge_match_statistic == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.challenge_match_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:challenge_match_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_activity_match_statistic(acc, msg)) do
          try do
            if(msg.activity_match_statistic == nil) do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.activity_match_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:activity_match_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_ab_match_statistic(acc, msg)) do
          try do
            if(msg.ab_match_statistic == nil) do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.ab_match_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:ab_match_statistic, "invalid field value"),
                __STACKTRACE__
              )
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.AccountDetailStatisticV2))
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

                {[
                   friend_room_statistic:
                     Protox.Message.merge(
                       msg.friend_room_statistic,
                       Soulless.Game.Lq.AccountDetailStatistic.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   rank_statistic:
                     Protox.Message.merge(
                       msg.rank_statistic,
                       Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic.decode!(delimited)
                     )
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   customized_contest_statistic:
                     Protox.Message.merge(
                       msg.customized_contest_statistic,
                       Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic.decode!(
                         delimited
                       )
                     )
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   leisure_match_statistic:
                     Protox.Message.merge(
                       msg.leisure_match_statistic,
                       Soulless.Game.Lq.AccountDetailStatistic.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   challenge_match_statistic:
                     Protox.Message.merge(
                       msg.challenge_match_statistic,
                       Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic.decode!(
                         delimited
                       )
                     )
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   activity_match_statistic:
                     Protox.Message.merge(
                       msg.activity_match_statistic,
                       Soulless.Game.Lq.AccountDetailStatistic.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   ab_match_statistic:
                     Protox.Message.merge(
                       msg.ab_match_statistic,
                       Soulless.Game.Lq.AccountDetailStatistic.decode!(delimited)
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
          Soulless.Game.Lq.AccountDetailStatisticV2,
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
        1 =>
          {:friend_room_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        2 =>
          {:rank_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}},
        3 =>
          {:customized_contest_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}},
        4 =>
          {:leisure_match_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        5 =>
          {:challenge_match_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}},
        6 =>
          {:activity_match_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        7 =>
          {:ab_match_statistic, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatistic}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        ab_match_statistic:
          {7, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        activity_match_statistic:
          {6, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        challenge_match_statistic:
          {5, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}},
        customized_contest_statistic:
          {3, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}},
        friend_room_statistic:
          {1, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        leisure_match_statistic:
          {4, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountDetailStatistic}},
        rank_statistic:
          {2, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "friendRoomStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :friend_room_statistic,
          tag: 1,
          type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :rank_statistic,
          tag: 2,
          type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "customizedContestStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :customized_contest_statistic,
          tag: 3,
          type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "leisureMatchStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :leisure_match_statistic,
          tag: 4,
          type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "challengeMatchStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :challenge_match_statistic,
          tag: 5,
          type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityMatchStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_match_statistic,
          tag: 6,
          type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "abMatchStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :ab_match_statistic,
          tag: 7,
          type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:friend_room_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendRoomStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_room_statistic,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("friendRoomStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendRoomStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_room_statistic,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("friend_room_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendRoomStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_room_statistic,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end
      ),
      (
        def(field_def(:rank_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :rank_statistic,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}
           }}
        end

        def(field_def("rankStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :rank_statistic,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}
           }}
        end

        def(field_def("rank_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :rank_statistic,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.RankStatistic}
           }}
        end
      ),
      (
        def(field_def(:customized_contest_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "customizedContestStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :customized_contest_statistic,
             tag: 3,
             type:
               {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}
           }}
        end

        def(field_def("customizedContestStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "customizedContestStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :customized_contest_statistic,
             tag: 3,
             type:
               {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}
           }}
        end

        def(field_def("customized_contest_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "customizedContestStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :customized_contest_statistic,
             tag: 3,
             type:
               {:message, Soulless.Game.Lq.AccountDetailStatisticV2.CustomizedContestStatistic}
           }}
        end
      ),
      (
        def(field_def(:leisure_match_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leisureMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :leisure_match_statistic,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("leisureMatchStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leisureMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :leisure_match_statistic,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("leisure_match_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leisureMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :leisure_match_statistic,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end
      ),
      (
        def(field_def(:challenge_match_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :challenge_match_statistic,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}
           }}
        end

        def(field_def("challengeMatchStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :challenge_match_statistic,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}
           }}
        end

        def(field_def("challenge_match_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :challenge_match_statistic,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountDetailStatisticV2.ChallengeStatistic}
           }}
        end
      ),
      (
        def(field_def(:activity_match_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_match_statistic,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("activityMatchStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_match_statistic,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("activity_match_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_match_statistic,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end
      ),
      (
        def(field_def(:ab_match_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match_statistic,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("abMatchStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match_statistic,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
           }}
        end

        def(field_def("ab_match_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "abMatchStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :ab_match_statistic,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountDetailStatistic}
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
      def(default(:friend_room_statistic)) do
        {:ok, nil}
      end,
      def(default(:rank_statistic)) do
        {:ok, nil}
      end,
      def(default(:customized_contest_statistic)) do
        {:ok, nil}
      end,
      def(default(:leisure_match_statistic)) do
        {:ok, nil}
      end,
      def(default(:challenge_match_statistic)) do
        {:ok, nil}
      end,
      def(default(:activity_match_statistic)) do
        {:ok, nil}
      end,
      def(default(:ab_match_statistic)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end