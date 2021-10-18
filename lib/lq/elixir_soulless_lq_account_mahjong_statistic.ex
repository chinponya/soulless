# credo:disable-for-this-file
defmodule(Soulless.Lq.AccountMahjongStatistic) do
  @moduledoc false
  (
    defstruct(
      final_position_counts: [],
      recent_round: nil,
      recent_hu: nil,
      highest_hu: nil,
      recent_20_hu_summary: nil,
      recent_10_hu_summary: nil,
      recent_10_game_result: [],
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
          |> encode_final_position_counts(msg)
          |> encode_recent_round(msg)
          |> encode_recent_hu(msg)
          |> encode_highest_hu(msg)
          |> encode_recent_20_hu_summary(msg)
          |> encode_recent_10_hu_summary(msg)
          |> encode_recent_10_game_result(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_final_position_counts(acc, msg)) do
          try do
            case(msg.final_position_counts) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\n",
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
              reraise(
                Protox.EncodingError.new(:final_position_counts, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_recent_round(acc, msg)) do
          try do
            if(msg.recent_round == nil) do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_message(msg.recent_round)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:recent_round, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_recent_hu(acc, msg)) do
          try do
            if(msg.recent_hu == nil) do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_message(msg.recent_hu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:recent_hu, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_highest_hu(acc, msg)) do
          try do
            if(msg.highest_hu == nil) do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.highest_hu)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:highest_hu, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_recent_20_hu_summary(acc, msg)) do
          try do
            if(msg.recent_20_hu_summary == nil) do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.recent_20_hu_summary)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:recent_20_hu_summary, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_recent_10_hu_summary(acc, msg)) do
          try do
            if(msg.recent_10_hu_summary == nil) do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.recent_10_hu_summary)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:recent_10_hu_summary, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_recent_10_game_result(acc, msg)) do
          try do
            case(msg.recent_10_game_result) do
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
              reraise(
                Protox.EncodingError.new(:recent_10_game_result, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.AccountMahjongStatistic))
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

              {1, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   final_position_counts:
                     msg.final_position_counts ++
                       Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[final_position_counts: msg.final_position_counts ++ [value]], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   recent_round:
                     Protox.Message.merge(
                       msg.recent_round,
                       Soulless.Lq.AccountMahjongStatistic.RoundSummary.decode!(delimited)
                     )
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   recent_hu:
                     Protox.Message.merge(
                       msg.recent_hu,
                       Soulless.Lq.AccountMahjongStatistic.HuSummary.decode!(delimited)
                     )
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   highest_hu:
                     Protox.Message.merge(
                       msg.highest_hu,
                       Soulless.Lq.AccountMahjongStatistic.HighestHuRecord.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   recent_20_hu_summary:
                     Protox.Message.merge(
                       msg.recent_20_hu_summary,
                       Soulless.Lq.AccountMahjongStatistic.Liqi20Summary.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   recent_10_hu_summary:
                     Protox.Message.merge(
                       msg.recent_10_hu_summary,
                       Soulless.Lq.AccountMahjongStatistic.LiQi10Summary.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   recent_10_game_result:
                     msg.recent_10_game_result ++
                       [Soulless.Lq.AccountMahjongStatistic.GameResult.decode!(delimited)]
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
          Soulless.Lq.AccountMahjongStatistic,
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
        1 => {:final_position_counts, :packed, :uint32},
        2 =>
          {:recent_round, {:scalar, nil},
           {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}},
        3 =>
          {:recent_hu, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}},
        4 =>
          {:highest_hu, {:scalar, nil},
           {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}},
        6 =>
          {:recent_20_hu_summary, {:scalar, nil},
           {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}},
        7 =>
          {:recent_10_hu_summary, {:scalar, nil},
           {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}},
        8 =>
          {:recent_10_game_result, :unpacked,
           {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        final_position_counts: {1, :packed, :uint32},
        highest_hu:
          {4, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}},
        recent_10_game_result:
          {8, :unpacked, {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}},
        recent_10_hu_summary:
          {7, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}},
        recent_20_hu_summary:
          {6, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}},
        recent_hu: {3, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}},
        recent_round:
          {2, {:scalar, nil}, {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "finalPositionCounts",
          kind: :packed,
          label: :repeated,
          name: :final_position_counts,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "recentRound",
          kind: {:scalar, nil},
          label: :optional,
          name: :recent_round,
          tag: 2,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recentHu",
          kind: {:scalar, nil},
          label: :optional,
          name: :recent_hu,
          tag: 3,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}
        },
        %{
          __struct__: Protox.Field,
          json_name: "highestHu",
          kind: {:scalar, nil},
          label: :optional,
          name: :highest_hu,
          tag: 4,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recent20HuSummary",
          kind: {:scalar, nil},
          label: :optional,
          name: :recent_20_hu_summary,
          tag: 6,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recent10HuSummary",
          kind: {:scalar, nil},
          label: :optional,
          name: :recent_10_hu_summary,
          tag: 7,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recent10GameResult",
          kind: :unpacked,
          label: :repeated,
          name: :recent_10_game_result,
          tag: 8,
          type: {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:final_position_counts)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPositionCounts",
             kind: :packed,
             label: :repeated,
             name: :final_position_counts,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("finalPositionCounts")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPositionCounts",
             kind: :packed,
             label: :repeated,
             name: :final_position_counts,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("final_position_counts")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finalPositionCounts",
             kind: :packed,
             label: :repeated,
             name: :final_position_counts,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:recent_round)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentRound",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_round,
             tag: 2,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}
           }}
        end

        def(field_def("recentRound")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentRound",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_round,
             tag: 2,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}
           }}
        end

        def(field_def("recent_round")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentRound",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_round,
             tag: 2,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.RoundSummary}
           }}
        end
      ),
      (
        def(field_def(:recent_hu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_hu,
             tag: 3,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}
           }}
        end

        def(field_def("recentHu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_hu,
             tag: 3,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}
           }}
        end

        def(field_def("recent_hu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_hu,
             tag: 3,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HuSummary}
           }}
        end
      ),
      (
        def(field_def(:highest_hu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :highest_hu,
             tag: 4,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}
           }}
        end

        def(field_def("highestHu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :highest_hu,
             tag: 4,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}
           }}
        end

        def(field_def("highest_hu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestHu",
             kind: {:scalar, nil},
             label: :optional,
             name: :highest_hu,
             tag: 4,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.HighestHuRecord}
           }}
        end
      ),
      (
        def(field_def(:recent_20_hu_summary)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent20HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_20_hu_summary,
             tag: 6,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}
           }}
        end

        def(field_def("recent20HuSummary")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent20HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_20_hu_summary,
             tag: 6,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}
           }}
        end

        def(field_def("recent_20_hu_summary")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent20HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_20_hu_summary,
             tag: 6,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.Liqi20Summary}
           }}
        end
      ),
      (
        def(field_def(:recent_10_hu_summary)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_10_hu_summary,
             tag: 7,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}
           }}
        end

        def(field_def("recent10HuSummary")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_10_hu_summary,
             tag: 7,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}
           }}
        end

        def(field_def("recent_10_hu_summary")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10HuSummary",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_10_hu_summary,
             tag: 7,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.LiQi10Summary}
           }}
        end
      ),
      (
        def(field_def(:recent_10_game_result)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10GameResult",
             kind: :unpacked,
             label: :repeated,
             name: :recent_10_game_result,
             tag: 8,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}
           }}
        end

        def(field_def("recent10GameResult")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10GameResult",
             kind: :unpacked,
             label: :repeated,
             name: :recent_10_game_result,
             tag: 8,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}
           }}
        end

        def(field_def("recent_10_game_result")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recent10GameResult",
             kind: :unpacked,
             label: :repeated,
             name: :recent_10_game_result,
             tag: 8,
             type: {:message, Soulless.Lq.AccountMahjongStatistic.GameResult}
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
      def(default(:final_position_counts)) do
        {:error, :no_default_value}
      end,
      def(default(:recent_round)) do
        {:ok, nil}
      end,
      def(default(:recent_hu)) do
        {:ok, nil}
      end,
      def(default(:highest_hu)) do
        {:ok, nil}
      end,
      def(default(:recent_20_hu_summary)) do
        {:ok, nil}
      end,
      def(default(:recent_10_hu_summary)) do
        {:ok, nil}
      end,
      def(default(:recent_10_game_result)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end