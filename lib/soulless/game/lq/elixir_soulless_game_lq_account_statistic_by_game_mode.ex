# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountStatisticByGameMode do
  @moduledoc false
  defstruct mode: 0,
            game_count_sum: 0,
            game_final_position: [],
            fly_count: 0,
            gold_earn_sum: 0.0,
            round_count_sum: 0,
            dadian_sum: 0.0,
            round_end: [],
            ming_count_sum: 0,
            liqi_count_sum: 0,
            xun_count_sum: 0,
            highest_lianzhuang: 0,
            score_earn_sum: 0,
            rank_score: [],
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
        |> encode_mode(msg)
        |> encode_game_count_sum(msg)
        |> encode_game_final_position(msg)
        |> encode_fly_count(msg)
        |> encode_gold_earn_sum(msg)
        |> encode_round_count_sum(msg)
        |> encode_dadian_sum(msg)
        |> encode_round_end(msg)
        |> encode_ming_count_sum(msg)
        |> encode_liqi_count_sum(msg)
        |> encode_xun_count_sum(msg)
        |> encode_highest_lianzhuang(msg)
        |> encode_score_earn_sum(msg)
        |> encode_rank_score(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_mode(acc, msg) do
        try do
          if msg.mode == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.mode)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mode, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_count_sum(acc, msg) do
        try do
          if msg.game_count_sum == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.game_count_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_count_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_game_final_position(acc, msg) do
        try do
          case msg.game_final_position do
            [] ->
              acc

            values ->
              [
                acc,
                "\x1A",
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
            reraise Protox.EncodingError.new(:game_final_position, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_fly_count(acc, msg) do
        try do
          if msg.fly_count == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.fly_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fly_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_gold_earn_sum(acc, msg) do
        try do
          if msg.gold_earn_sum == 0.0 do
            acc
          else
            [acc, "-", Protox.Encode.encode_float(msg.gold_earn_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gold_earn_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_round_count_sum(acc, msg) do
        try do
          if msg.round_count_sum == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.round_count_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:round_count_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_dadian_sum(acc, msg) do
        try do
          if msg.dadian_sum == 0.0 do
            acc
          else
            [acc, "=", Protox.Encode.encode_float(msg.dadian_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dadian_sum, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_round_end(acc, msg) do
        try do
          case msg.round_end do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:round_end, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ming_count_sum(acc, msg) do
        try do
          if msg.ming_count_sum == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.ming_count_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ming_count_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_liqi_count_sum(acc, msg) do
        try do
          if msg.liqi_count_sum == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.liqi_count_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:liqi_count_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_xun_count_sum(acc, msg) do
        try do
          if msg.xun_count_sum == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.xun_count_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xun_count_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_highest_lianzhuang(acc, msg) do
        try do
          if msg.highest_lianzhuang == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.highest_lianzhuang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:highest_lianzhuang, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_score_earn_sum(acc, msg) do
        try do
          if msg.score_earn_sum == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.score_earn_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:score_earn_sum, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_rank_score(acc, msg) do
        try do
          case msg.rank_score do
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
            reraise Protox.EncodingError.new(:rank_score, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountStatisticByGameMode))
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
              {[mode: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[game_count_sum: value], rest}

            {3, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 game_final_position:
                   msg.game_final_position ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[game_final_position: msg.game_final_position ++ [value]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fly_count: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_float(bytes)
              {[gold_earn_sum: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[round_count_sum: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_float(bytes)
              {[dadian_sum: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 round_end:
                   msg.round_end ++
                     [Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData.decode!(delimited)]
               ], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ming_count_sum: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[liqi_count_sum: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[xun_count_sum: value], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[highest_lianzhuang: value], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[score_earn_sum: value], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 rank_score:
                   msg.rank_score ++
                     [Soulless.Game.Lq.AccountStatisticByGameMode.RankScore.decode!(delimited)]
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
        Soulless.Game.Lq.AccountStatisticByGameMode,
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
        1 => {:mode, {:scalar, 0}, :uint32},
        2 => {:game_count_sum, {:scalar, 0}, :uint32},
        3 => {:game_final_position, :packed, :uint32},
        4 => {:fly_count, {:scalar, 0}, :uint32},
        5 => {:gold_earn_sum, {:scalar, 0.0}, :float},
        6 => {:round_count_sum, {:scalar, 0}, :uint32},
        7 => {:dadian_sum, {:scalar, 0.0}, :float},
        8 =>
          {:round_end, :unpacked,
           {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}},
        9 => {:ming_count_sum, {:scalar, 0}, :uint32},
        10 => {:liqi_count_sum, {:scalar, 0}, :uint32},
        11 => {:xun_count_sum, {:scalar, 0}, :uint32},
        12 => {:highest_lianzhuang, {:scalar, 0}, :uint32},
        13 => {:score_earn_sum, {:scalar, 0}, :uint32},
        14 =>
          {:rank_score, :unpacked,
           {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        dadian_sum: {7, {:scalar, 0.0}, :float},
        fly_count: {4, {:scalar, 0}, :uint32},
        game_count_sum: {2, {:scalar, 0}, :uint32},
        game_final_position: {3, :packed, :uint32},
        gold_earn_sum: {5, {:scalar, 0.0}, :float},
        highest_lianzhuang: {12, {:scalar, 0}, :uint32},
        liqi_count_sum: {10, {:scalar, 0}, :uint32},
        ming_count_sum: {9, {:scalar, 0}, :uint32},
        mode: {1, {:scalar, 0}, :uint32},
        rank_score:
          {14, :unpacked, {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}},
        round_count_sum: {6, {:scalar, 0}, :uint32},
        round_end:
          {8, :unpacked, {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}},
        score_earn_sum: {13, {:scalar, 0}, :uint32},
        xun_count_sum: {11, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mode",
          kind: {:scalar, 0},
          label: :optional,
          name: :mode,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameCountSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_count_sum,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameFinalPosition",
          kind: :packed,
          label: :repeated,
          name: :game_final_position,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "flyCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :fly_count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "goldEarnSum",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :gold_earn_sum,
          tag: 5,
          type: :float
        },
        %{
          __struct__: Protox.Field,
          json_name: "roundCountSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :round_count_sum,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "dadianSum",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :dadian_sum,
          tag: 7,
          type: :float
        },
        %{
          __struct__: Protox.Field,
          json_name: "roundEnd",
          kind: :unpacked,
          label: :repeated,
          name: :round_end,
          tag: 8,
          type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mingCountSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :ming_count_sum,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqiCountSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqi_count_sum,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "xunCountSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :xun_count_sum,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "highestLianzhuang",
          kind: {:scalar, 0},
          label: :optional,
          name: :highest_lianzhuang,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "scoreEarnSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :score_earn_sum,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankScore",
          kind: :unpacked,
          label: :repeated,
          name: :rank_score,
          tag: 14,
          type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:game_count_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_count_sum,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("gameCountSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_count_sum,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("game_count_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_count_sum,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_final_position) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameFinalPosition",
             kind: :packed,
             label: :repeated,
             name: :game_final_position,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("gameFinalPosition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameFinalPosition",
             kind: :packed,
             label: :repeated,
             name: :game_final_position,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("game_final_position") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameFinalPosition",
             kind: :packed,
             label: :repeated,
             name: :game_final_position,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:fly_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flyCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :fly_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("flyCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flyCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :fly_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("fly_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flyCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :fly_count,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:gold_earn_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goldEarnSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :gold_earn_sum,
             tag: 5,
             type: :float
           }}
        end

        def field_def("goldEarnSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goldEarnSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :gold_earn_sum,
             tag: 5,
             type: :float
           }}
        end

        def field_def("gold_earn_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goldEarnSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :gold_earn_sum,
             tag: 5,
             type: :float
           }}
        end
      ),
      (
        def field_def(:round_count_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_count_sum,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("roundCountSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_count_sum,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("round_count_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_count_sum,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:dadian_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dadianSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :dadian_sum,
             tag: 7,
             type: :float
           }}
        end

        def field_def("dadianSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dadianSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :dadian_sum,
             tag: 7,
             type: :float
           }}
        end

        def field_def("dadian_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dadianSum",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :dadian_sum,
             tag: 7,
             type: :float
           }}
        end
      ),
      (
        def field_def(:round_end) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundEnd",
             kind: :unpacked,
             label: :repeated,
             name: :round_end,
             tag: 8,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}
           }}
        end

        def field_def("roundEnd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundEnd",
             kind: :unpacked,
             label: :repeated,
             name: :round_end,
             tag: 8,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}
           }}
        end

        def field_def("round_end") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundEnd",
             kind: :unpacked,
             label: :repeated,
             name: :round_end,
             tag: 8,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RoundEndData}
           }}
        end
      ),
      (
        def field_def(:ming_count_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :ming_count_sum,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("mingCountSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :ming_count_sum,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("ming_count_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mingCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :ming_count_sum,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:liqi_count_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_count_sum,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("liqiCountSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_count_sum,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("liqi_count_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_count_sum,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:xun_count_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xunCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun_count_sum,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("xunCountSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xunCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun_count_sum,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("xun_count_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xunCountSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun_count_sum,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:highest_lianzhuang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestLianzhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :highest_lianzhuang,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("highestLianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestLianzhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :highest_lianzhuang,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("highest_lianzhuang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestLianzhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :highest_lianzhuang,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:score_earn_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreEarnSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :score_earn_sum,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("scoreEarnSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreEarnSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :score_earn_sum,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("score_earn_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scoreEarnSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :score_earn_sum,
             tag: 13,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:rank_score) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankScore",
             kind: :unpacked,
             label: :repeated,
             name: :rank_score,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}
           }}
        end

        def field_def("rankScore") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankScore",
             kind: :unpacked,
             label: :repeated,
             name: :rank_score,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}
           }}
        end

        def field_def("rank_score") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankScore",
             kind: :unpacked,
             label: :repeated,
             name: :rank_score,
             tag: 14,
             type: {:message, Soulless.Game.Lq.AccountStatisticByGameMode.RankScore}
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
    def default(:mode) do
      {:ok, 0}
    end,
    def default(:game_count_sum) do
      {:ok, 0}
    end,
    def default(:game_final_position) do
      {:error, :no_default_value}
    end,
    def default(:fly_count) do
      {:ok, 0}
    end,
    def default(:gold_earn_sum) do
      {:ok, 0.0}
    end,
    def default(:round_count_sum) do
      {:ok, 0}
    end,
    def default(:dadian_sum) do
      {:ok, 0.0}
    end,
    def default(:round_end) do
      {:error, :no_default_value}
    end,
    def default(:ming_count_sum) do
      {:ok, 0}
    end,
    def default(:liqi_count_sum) do
      {:ok, 0}
    end,
    def default(:xun_count_sum) do
      {:ok, 0}
    end,
    def default(:highest_lianzhuang) do
      {:ok, 0}
    end,
    def default(:score_earn_sum) do
      {:ok, 0}
    end,
    def default(:rank_score) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
