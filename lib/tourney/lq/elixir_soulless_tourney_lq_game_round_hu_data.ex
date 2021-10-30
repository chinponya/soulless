# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.GameRoundHuData) do
  @moduledoc false
  (
    defstruct(
      hupai: nil,
      fans: [],
      score: 0,
      xun: 0,
      title_id: 0,
      fan_sum: 0,
      fu_sum: 0,
      yakuman_count: 0,
      biao_dora_count: 0,
      red_dora_count: 0,
      li_dora_count: 0,
      babei_count: 0,
      xuan_shang_count: 0,
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
          |> encode_hupai(msg)
          |> encode_fans(msg)
          |> encode_score(msg)
          |> encode_xun(msg)
          |> encode_title_id(msg)
          |> encode_fan_sum(msg)
          |> encode_fu_sum(msg)
          |> encode_yakuman_count(msg)
          |> encode_biao_dora_count(msg)
          |> encode_red_dora_count(msg)
          |> encode_li_dora_count(msg)
          |> encode_babei_count(msg)
          |> encode_xuan_shang_count(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_hupai(acc, msg)) do
          try do
            if(msg.hupai == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.hupai)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hupai, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_fans(acc, msg)) do
          try do
            case(msg.fans) do
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
              reraise(Protox.EncodingError.new(:fans, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_score(acc, msg)) do
          try do
            if(msg.score == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.score)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:score, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_xun(acc, msg)) do
          try do
            if(msg.xun == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.xun)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:xun, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_title_id(acc, msg)) do
          try do
            if(msg.title_id == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.title_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:title_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_fan_sum(acc, msg)) do
          try do
            if(msg.fan_sum == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.fan_sum)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:fan_sum, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_fu_sum(acc, msg)) do
          try do
            if(msg.fu_sum == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.fu_sum)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:fu_sum, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_yakuman_count(acc, msg)) do
          try do
            if(msg.yakuman_count == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.yakuman_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:yakuman_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_biao_dora_count(acc, msg)) do
          try do
            if(msg.biao_dora_count == 0) do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.biao_dora_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:biao_dora_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_red_dora_count(acc, msg)) do
          try do
            if(msg.red_dora_count == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.red_dora_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:red_dora_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_li_dora_count(acc, msg)) do
          try do
            if(msg.li_dora_count == 0) do
              acc
            else
              [acc, "X", Protox.Encode.encode_uint32(msg.li_dora_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:li_dora_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_babei_count(acc, msg)) do
          try do
            if(msg.babei_count == 0) do
              acc
            else
              [acc, "`", Protox.Encode.encode_uint32(msg.babei_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:babei_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_xuan_shang_count(acc, msg)) do
          try do
            if(msg.xuan_shang_count == 0) do
              acc
            else
              [acc, "h", Protox.Encode.encode_uint32(msg.xuan_shang_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:xuan_shang_count, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.GameRoundHuData))
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
                   hupai:
                     Protox.Message.merge(
                       msg.hupai,
                       Soulless.Tourney.Lq.GameRoundHuData.HuPai.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[fans: msg.fans ++ [Soulless.Tourney.Lq.GameRoundHuData.Fan.decode!(delimited)]],
                 rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[score: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[xun: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[title_id: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[fan_sum: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[fu_sum: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[yakuman_count: value], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[biao_dora_count: value], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[red_dora_count: value], rest}

              {11, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[li_dora_count: value], rest}

              {12, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[babei_count: value], rest}

              {13, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[xuan_shang_count: value], rest}

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
          Soulless.Tourney.Lq.GameRoundHuData,
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
        1 => {:hupai, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameRoundHuData.HuPai}},
        2 => {:fans, :unpacked, {:message, Soulless.Tourney.Lq.GameRoundHuData.Fan}},
        3 => {:score, {:scalar, 0}, :uint32},
        4 => {:xun, {:scalar, 0}, :uint32},
        5 => {:title_id, {:scalar, 0}, :uint32},
        6 => {:fan_sum, {:scalar, 0}, :uint32},
        7 => {:fu_sum, {:scalar, 0}, :uint32},
        8 => {:yakuman_count, {:scalar, 0}, :uint32},
        9 => {:biao_dora_count, {:scalar, 0}, :uint32},
        10 => {:red_dora_count, {:scalar, 0}, :uint32},
        11 => {:li_dora_count, {:scalar, 0}, :uint32},
        12 => {:babei_count, {:scalar, 0}, :uint32},
        13 => {:xuan_shang_count, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        babei_count: {12, {:scalar, 0}, :uint32},
        biao_dora_count: {9, {:scalar, 0}, :uint32},
        fan_sum: {6, {:scalar, 0}, :uint32},
        fans: {2, :unpacked, {:message, Soulless.Tourney.Lq.GameRoundHuData.Fan}},
        fu_sum: {7, {:scalar, 0}, :uint32},
        hupai: {1, {:scalar, nil}, {:message, Soulless.Tourney.Lq.GameRoundHuData.HuPai}},
        li_dora_count: {11, {:scalar, 0}, :uint32},
        red_dora_count: {10, {:scalar, 0}, :uint32},
        score: {3, {:scalar, 0}, :uint32},
        title_id: {5, {:scalar, 0}, :uint32},
        xuan_shang_count: {13, {:scalar, 0}, :uint32},
        xun: {4, {:scalar, 0}, :uint32},
        yakuman_count: {8, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "hupai",
          kind: {:scalar, nil},
          label: :optional,
          name: :hupai,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.GameRoundHuData.HuPai}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fans",
          kind: :unpacked,
          label: :repeated,
          name: :fans,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.GameRoundHuData.Fan}
        },
        %{
          __struct__: Protox.Field,
          json_name: "score",
          kind: {:scalar, 0},
          label: :optional,
          name: :score,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "xun",
          kind: {:scalar, 0},
          label: :optional,
          name: :xun,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleId",
          kind: {:scalar, 0},
          label: :optional,
          name: :title_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fanSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :fan_sum,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fuSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :fu_sum,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "yakumanCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :yakuman_count,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "biaoDoraCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :biao_dora_count,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "redDoraCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :red_dora_count,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liDoraCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :li_dora_count,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "babeiCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :babei_count,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "xuanShangCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :xuan_shang_count,
          tag: 13,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:hupai)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hupai",
             kind: {:scalar, nil},
             label: :optional,
             name: :hupai,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.GameRoundHuData.HuPai}
           }}
        end

        def(field_def("hupai")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hupai",
             kind: {:scalar, nil},
             label: :optional,
             name: :hupai,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.GameRoundHuData.HuPai}
           }}
        end

        []
      ),
      (
        def(field_def(:fans)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fans",
             kind: :unpacked,
             label: :repeated,
             name: :fans,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.GameRoundHuData.Fan}
           }}
        end

        def(field_def("fans")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fans",
             kind: :unpacked,
             label: :repeated,
             name: :fans,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.GameRoundHuData.Fan}
           }}
        end

        []
      ),
      (
        def(field_def(:score)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("score")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:xun)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xun",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("xun")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xun",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:title_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("titleId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("title_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:fan_sum)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fan_sum,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("fanSum")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fan_sum,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("fan_sum")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fan_sum,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:fu_sum)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_sum,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("fuSum")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_sum,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("fu_sum")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_sum,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:yakuman_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yakumanCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :yakuman_count,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("yakumanCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yakumanCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :yakuman_count,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("yakuman_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yakumanCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :yakuman_count,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:biao_dora_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("biaoDoraCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("biao_dora_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:red_dora_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "redDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :red_dora_count,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("redDoraCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "redDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :red_dora_count,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("red_dora_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "redDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :red_dora_count,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:li_dora_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :li_dora_count,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("liDoraCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :li_dora_count,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("li_dora_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :li_dora_count,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:babei_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babeiCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :babei_count,
             tag: 12,
             type: :uint32
           }}
        end

        def(field_def("babeiCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babeiCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :babei_count,
             tag: 12,
             type: :uint32
           }}
        end

        def(field_def("babei_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babeiCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :babei_count,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:xuan_shang_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xuanShangCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :xuan_shang_count,
             tag: 13,
             type: :uint32
           }}
        end

        def(field_def("xuanShangCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xuanShangCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :xuan_shang_count,
             tag: 13,
             type: :uint32
           }}
        end

        def(field_def("xuan_shang_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xuanShangCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :xuan_shang_count,
             tag: 13,
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
      def(default(:hupai)) do
        {:ok, nil}
      end,
      def(default(:fans)) do
        {:error, :no_default_value}
      end,
      def(default(:score)) do
        {:ok, 0}
      end,
      def(default(:xun)) do
        {:ok, 0}
      end,
      def(default(:title_id)) do
        {:ok, 0}
      end,
      def(default(:fan_sum)) do
        {:ok, 0}
      end,
      def(default(:fu_sum)) do
        {:ok, 0}
      end,
      def(default(:yakuman_count)) do
        {:ok, 0}
      end,
      def(default(:biao_dora_count)) do
        {:ok, 0}
      end,
      def(default(:red_dora_count)) do
        {:ok, 0}
      end,
      def(default(:li_dora_count)) do
        {:ok, 0}
      end,
      def(default(:babei_count)) do
        {:ok, 0}
      end,
      def(default(:xuan_shang_count)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end