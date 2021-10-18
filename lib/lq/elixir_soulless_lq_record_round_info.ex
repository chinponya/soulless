# credo:disable-for-this-file
defmodule(Soulless.Lq.RecordRoundInfo) do
  @moduledoc false
  (
    defstruct(
      name: "",
      chang: 0,
      ju: 0,
      ben: 0,
      scores: [],
      liqi_infos: [],
      gang_infos: [],
      peipai_infos: [],
      babai_infos: [],
      hules_info: nil,
      liuju_info: nil,
      no_tile_info: nil,
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
          |> encode_name(msg)
          |> encode_chang(msg)
          |> encode_ju(msg)
          |> encode_ben(msg)
          |> encode_scores(msg)
          |> encode_liqi_infos(msg)
          |> encode_gang_infos(msg)
          |> encode_peipai_infos(msg)
          |> encode_babai_infos(msg)
          |> encode_hules_info(msg)
          |> encode_liuju_info(msg)
          |> encode_no_tile_info(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_name(acc, msg)) do
          try do
            if(msg.name == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.name)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_chang(acc, msg)) do
          try do
            if(msg.chang == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.chang)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:chang, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ju(acc, msg)) do
          try do
            if(msg.ju == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.ju)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ju, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ben(acc, msg)) do
          try do
            if(msg.ben == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.ben)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ben, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_scores(acc, msg)) do
          try do
            case(msg.scores) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "*",
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
              reraise(Protox.EncodingError.new(:scores, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqi_infos(acc, msg)) do
          try do
            case(msg.liqi_infos) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, ":", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:liqi_infos, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_gang_infos(acc, msg)) do
          try do
            case(msg.gang_infos) do
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
                Protox.EncodingError.new(:gang_infos, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_peipai_infos(acc, msg)) do
          try do
            case(msg.peipai_infos) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "J", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:peipai_infos, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_babai_infos(acc, msg)) do
          try do
            case(msg.babai_infos) do
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
              reraise(
                Protox.EncodingError.new(:babai_infos, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_hules_info(acc, msg)) do
          try do
            if(msg.hules_info == nil) do
              acc
            else
              [acc, "Z", Protox.Encode.encode_message(msg.hules_info)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:hules_info, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_liuju_info(acc, msg)) do
          try do
            if(msg.liuju_info == nil) do
              acc
            else
              [acc, "b", Protox.Encode.encode_message(msg.liuju_info)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:liuju_info, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_no_tile_info(acc, msg)) do
          try do
            if(msg.no_tile_info == nil) do
              acc
            else
              [acc, "j", Protox.Encode.encode_message(msg.no_tile_info)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:no_tile_info, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.RecordRoundInfo))
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
                {[name: delimited], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[chang: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ju: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ben: value], rest}

              {5, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[scores: msg.scores ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[scores: msg.scores ++ [value]], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[liqi_infos: msg.liqi_infos ++ [Soulless.Lq.RecordLiqiInfo.decode!(delimited)]],
                 rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[gang_infos: msg.gang_infos ++ [Soulless.Lq.RecordGangInfo.decode!(delimited)]],
                 rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   peipai_infos:
                     msg.peipai_infos ++ [Soulless.Lq.RecordPeiPaiInfo.decode!(delimited)]
                 ], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   babai_infos:
                     msg.babai_infos ++ [Soulless.Lq.RecordBaBeiInfo.decode!(delimited)]
                 ], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   hules_info:
                     Protox.Message.merge(
                       msg.hules_info,
                       Soulless.Lq.RecordHulesInfo.decode!(delimited)
                     )
                 ], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   liuju_info:
                     Protox.Message.merge(
                       msg.liuju_info,
                       Soulless.Lq.RecordLiujuInfo.decode!(delimited)
                     )
                 ], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   no_tile_info:
                     Protox.Message.merge(
                       msg.no_tile_info,
                       Soulless.Lq.RecordNoTileInfo.decode!(delimited)
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
          Soulless.Lq.RecordRoundInfo,
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
        1 => {:name, {:scalar, ""}, :string},
        2 => {:chang, {:scalar, 0}, :uint32},
        3 => {:ju, {:scalar, 0}, :uint32},
        4 => {:ben, {:scalar, 0}, :uint32},
        5 => {:scores, :packed, :uint32},
        7 => {:liqi_infos, :unpacked, {:message, Soulless.Lq.RecordLiqiInfo}},
        8 => {:gang_infos, :unpacked, {:message, Soulless.Lq.RecordGangInfo}},
        9 => {:peipai_infos, :unpacked, {:message, Soulless.Lq.RecordPeiPaiInfo}},
        10 => {:babai_infos, :unpacked, {:message, Soulless.Lq.RecordBaBeiInfo}},
        11 => {:hules_info, {:scalar, nil}, {:message, Soulless.Lq.RecordHulesInfo}},
        12 => {:liuju_info, {:scalar, nil}, {:message, Soulless.Lq.RecordLiujuInfo}},
        13 => {:no_tile_info, {:scalar, nil}, {:message, Soulless.Lq.RecordNoTileInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        babai_infos: {10, :unpacked, {:message, Soulless.Lq.RecordBaBeiInfo}},
        ben: {4, {:scalar, 0}, :uint32},
        chang: {2, {:scalar, 0}, :uint32},
        gang_infos: {8, :unpacked, {:message, Soulless.Lq.RecordGangInfo}},
        hules_info: {11, {:scalar, nil}, {:message, Soulless.Lq.RecordHulesInfo}},
        ju: {3, {:scalar, 0}, :uint32},
        liqi_infos: {7, :unpacked, {:message, Soulless.Lq.RecordLiqiInfo}},
        liuju_info: {12, {:scalar, nil}, {:message, Soulless.Lq.RecordLiujuInfo}},
        name: {1, {:scalar, ""}, :string},
        no_tile_info: {13, {:scalar, nil}, {:message, Soulless.Lq.RecordNoTileInfo}},
        peipai_infos: {9, :unpacked, {:message, Soulless.Lq.RecordPeiPaiInfo}},
        scores: {5, :packed, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "chang",
          kind: {:scalar, 0},
          label: :optional,
          name: :chang,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ju",
          kind: {:scalar, 0},
          label: :optional,
          name: :ju,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ben",
          kind: {:scalar, 0},
          label: :optional,
          name: :ben,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "scores",
          kind: :packed,
          label: :repeated,
          name: :scores,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqiInfos",
          kind: :unpacked,
          label: :repeated,
          name: :liqi_infos,
          tag: 7,
          type: {:message, Soulless.Lq.RecordLiqiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gangInfos",
          kind: :unpacked,
          label: :repeated,
          name: :gang_infos,
          tag: 8,
          type: {:message, Soulless.Lq.RecordGangInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "peipaiInfos",
          kind: :unpacked,
          label: :repeated,
          name: :peipai_infos,
          tag: 9,
          type: {:message, Soulless.Lq.RecordPeiPaiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "babaiInfos",
          kind: :unpacked,
          label: :repeated,
          name: :babai_infos,
          tag: 10,
          type: {:message, Soulless.Lq.RecordBaBeiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hulesInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :hules_info,
          tag: 11,
          type: {:message, Soulless.Lq.RecordHulesInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "liujuInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :liuju_info,
          tag: 12,
          type: {:message, Soulless.Lq.RecordLiujuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "noTileInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :no_tile_info,
          tag: 13,
          type: {:message, Soulless.Lq.RecordNoTileInfo}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:chang)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("chang")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:ju)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("ju")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:ben)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("ben")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:scores)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("scores")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:liqi_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :liqi_infos,
             tag: 7,
             type: {:message, Soulless.Lq.RecordLiqiInfo}
           }}
        end

        def(field_def("liqiInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :liqi_infos,
             tag: 7,
             type: {:message, Soulless.Lq.RecordLiqiInfo}
           }}
        end

        def(field_def("liqi_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :liqi_infos,
             tag: 7,
             type: {:message, Soulless.Lq.RecordLiqiInfo}
           }}
        end
      ),
      (
        def(field_def(:gang_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gangInfos",
             kind: :unpacked,
             label: :repeated,
             name: :gang_infos,
             tag: 8,
             type: {:message, Soulless.Lq.RecordGangInfo}
           }}
        end

        def(field_def("gangInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gangInfos",
             kind: :unpacked,
             label: :repeated,
             name: :gang_infos,
             tag: 8,
             type: {:message, Soulless.Lq.RecordGangInfo}
           }}
        end

        def(field_def("gang_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gangInfos",
             kind: :unpacked,
             label: :repeated,
             name: :gang_infos,
             tag: 8,
             type: {:message, Soulless.Lq.RecordGangInfo}
           }}
        end
      ),
      (
        def(field_def(:peipai_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "peipaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :peipai_infos,
             tag: 9,
             type: {:message, Soulless.Lq.RecordPeiPaiInfo}
           }}
        end

        def(field_def("peipaiInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "peipaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :peipai_infos,
             tag: 9,
             type: {:message, Soulless.Lq.RecordPeiPaiInfo}
           }}
        end

        def(field_def("peipai_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "peipaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :peipai_infos,
             tag: 9,
             type: {:message, Soulless.Lq.RecordPeiPaiInfo}
           }}
        end
      ),
      (
        def(field_def(:babai_infos)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :babai_infos,
             tag: 10,
             type: {:message, Soulless.Lq.RecordBaBeiInfo}
           }}
        end

        def(field_def("babaiInfos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :babai_infos,
             tag: 10,
             type: {:message, Soulless.Lq.RecordBaBeiInfo}
           }}
        end

        def(field_def("babai_infos")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "babaiInfos",
             kind: :unpacked,
             label: :repeated,
             name: :babai_infos,
             tag: 10,
             type: {:message, Soulless.Lq.RecordBaBeiInfo}
           }}
        end
      ),
      (
        def(field_def(:hules_info)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hules_info,
             tag: 11,
             type: {:message, Soulless.Lq.RecordHulesInfo}
           }}
        end

        def(field_def("hulesInfo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hules_info,
             tag: 11,
             type: {:message, Soulless.Lq.RecordHulesInfo}
           }}
        end

        def(field_def("hules_info")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hules_info,
             tag: 11,
             type: {:message, Soulless.Lq.RecordHulesInfo}
           }}
        end
      ),
      (
        def(field_def(:liuju_info)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujuInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :liuju_info,
             tag: 12,
             type: {:message, Soulless.Lq.RecordLiujuInfo}
           }}
        end

        def(field_def("liujuInfo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujuInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :liuju_info,
             tag: 12,
             type: {:message, Soulless.Lq.RecordLiujuInfo}
           }}
        end

        def(field_def("liuju_info")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujuInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :liuju_info,
             tag: 12,
             type: {:message, Soulless.Lq.RecordLiujuInfo}
           }}
        end
      ),
      (
        def(field_def(:no_tile_info)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "noTileInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :no_tile_info,
             tag: 13,
             type: {:message, Soulless.Lq.RecordNoTileInfo}
           }}
        end

        def(field_def("noTileInfo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "noTileInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :no_tile_info,
             tag: 13,
             type: {:message, Soulless.Lq.RecordNoTileInfo}
           }}
        end

        def(field_def("no_tile_info")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "noTileInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :no_tile_info,
             tag: 13,
             type: {:message, Soulless.Lq.RecordNoTileInfo}
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
      def(default(:name)) do
        {:ok, ""}
      end,
      def(default(:chang)) do
        {:ok, 0}
      end,
      def(default(:ju)) do
        {:ok, 0}
      end,
      def(default(:ben)) do
        {:ok, 0}
      end,
      def(default(:scores)) do
        {:error, :no_default_value}
      end,
      def(default(:liqi_infos)) do
        {:error, :no_default_value}
      end,
      def(default(:gang_infos)) do
        {:error, :no_default_value}
      end,
      def(default(:peipai_infos)) do
        {:error, :no_default_value}
      end,
      def(default(:babai_infos)) do
        {:error, :no_default_value}
      end,
      def(default(:hules_info)) do
        {:ok, nil}
      end,
      def(default(:liuju_info)) do
        {:ok, nil}
      end,
      def(default(:no_tile_info)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end