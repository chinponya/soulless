# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordNewRound do
  @moduledoc false
  defstruct chang: 0,
            ju: 0,
            ben: 0,
            dora: "",
            scores: [],
            liqibang: 0,
            tiles0: [],
            tiles1: [],
            tiles2: [],
            tiles3: [],
            tingpai: [],
            operation: nil,
            md5: "",
            paishan: "",
            left_tile_count: 0,
            doras: [],
            opens: [],
            muyu: nil,
            operations: [],
            ju_count: 0,
            field_spell: 0,
            sha256: "",
            yongchang: nil,
            saltSha256: "",
            salt: "",
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
        |> encode_chang(msg)
        |> encode_ju(msg)
        |> encode_ben(msg)
        |> encode_dora(msg)
        |> encode_scores(msg)
        |> encode_liqibang(msg)
        |> encode_tiles0(msg)
        |> encode_tiles1(msg)
        |> encode_tiles2(msg)
        |> encode_tiles3(msg)
        |> encode_tingpai(msg)
        |> encode_operation(msg)
        |> encode_md5(msg)
        |> encode_paishan(msg)
        |> encode_left_tile_count(msg)
        |> encode_doras(msg)
        |> encode_opens(msg)
        |> encode_muyu(msg)
        |> encode_operations(msg)
        |> encode_ju_count(msg)
        |> encode_field_spell(msg)
        |> encode_sha256(msg)
        |> encode_yongchang(msg)
        |> encode_saltSha256(msg)
        |> encode_salt(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_chang(acc, msg) do
        try do
          if msg.chang == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.chang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ju(acc, msg) do
        try do
          if msg.ju == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.ju)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ju, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ben(acc, msg) do
        try do
          if msg.ben == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.ben)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ben, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dora(acc, msg) do
        try do
          if msg.dora == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.dora)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dora, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_scores(acc, msg) do
        try do
          case msg.scores do
            [] ->
              acc

            values ->
              [
                acc,
                "*",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_int32(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:scores, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_liqibang(acc, msg) do
        try do
          if msg.liqibang == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.liqibang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:liqibang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tiles0(acc, msg) do
        try do
          case msg.tiles0 do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, ":", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tiles0, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tiles1(acc, msg) do
        try do
          case msg.tiles1 do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "B", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tiles1, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tiles2(acc, msg) do
        try do
          case msg.tiles2 do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tiles2, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tiles3(acc, msg) do
        try do
          case msg.tiles3 do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tiles3, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tingpai(acc, msg) do
        try do
          case msg.tingpai do
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
            reraise Protox.EncodingError.new(:tingpai, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_operation(acc, msg) do
        try do
          if msg.operation == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.operation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_md5(acc, msg) do
        try do
          if msg.md5 == "" do
            acc
          else
            [acc, "j", Protox.Encode.encode_string(msg.md5)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:md5, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_paishan(acc, msg) do
        try do
          if msg.paishan == "" do
            acc
          else
            [acc, "r", Protox.Encode.encode_string(msg.paishan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paishan, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_left_tile_count(acc, msg) do
        try do
          if msg.left_tile_count == 0 do
            acc
          else
            [acc, "x", Protox.Encode.encode_uint32(msg.left_tile_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:left_tile_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_doras(acc, msg) do
        try do
          case msg.doras do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x82\x01", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_opens(acc, msg) do
        try do
          case msg.opens do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x8A\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:opens, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_muyu(acc, msg) do
        try do
          if msg.muyu == nil do
            acc
          else
            [acc, "\x92\x01", Protox.Encode.encode_message(msg.muyu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_operations(acc, msg) do
        try do
          case msg.operations do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x9A\x01", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operations, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ju_count(acc, msg) do
        try do
          if msg.ju_count == 0 do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_uint32(msg.ju_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ju_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_field_spell(acc, msg) do
        try do
          if msg.field_spell == 0 do
            acc
          else
            [acc, "\xA8\x01", Protox.Encode.encode_uint32(msg.field_spell)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:field_spell, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sha256(acc, msg) do
        try do
          if msg.sha256 == "" do
            acc
          else
            [acc, "\xB2\x01", Protox.Encode.encode_string(msg.sha256)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sha256, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_yongchang(acc, msg) do
        try do
          if msg.yongchang == nil do
            acc
          else
            [acc, "\xBA\x01", Protox.Encode.encode_message(msg.yongchang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:yongchang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_saltSha256(acc, msg) do
        try do
          if msg.saltSha256 == "" do
            acc
          else
            [acc, "\xC2\x01", Protox.Encode.encode_string(msg.saltSha256)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:saltSha256, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_salt(acc, msg) do
        try do
          if msg.salt == "" do
            acc
          else
            [acc, "\xCA\x01", Protox.Encode.encode_string(msg.salt)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:salt, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordNewRound))
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
              {[chang: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ju: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ben: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[dora: Protox.Decode.validate_string(delimited)], rest}

            {5, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[scores: msg.scores ++ Protox.Decode.parse_repeated_int32([], delimited)], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[scores: msg.scores ++ [value]], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[liqibang: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tiles0: msg.tiles0 ++ [Protox.Decode.validate_string(delimited)]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tiles1: msg.tiles1 ++ [Protox.Decode.validate_string(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tiles2: msg.tiles2 ++ [Protox.Decode.validate_string(delimited)]], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tiles3: msg.tiles3 ++ [Protox.Decode.validate_string(delimited)]], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 tingpai:
                   msg.tingpai ++ [Soulless.Game.Lq.RecordNewRound.TingPai.decode!(delimited)]
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operation:
                   Protox.MergeMessage.merge(
                     msg.operation,
                     Soulless.Game.Lq.OptionalOperationList.decode!(delimited)
                   )
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[md5: Protox.Decode.validate_string(delimited)], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[paishan: Protox.Decode.validate_string(delimited)], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[left_tile_count: value], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[doras: msg.doras ++ [Protox.Decode.validate_string(delimited)]], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[opens: msg.opens ++ [Soulless.Game.Lq.NewRoundOpenedTiles.decode!(delimited)]],
               rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 muyu:
                   Protox.MergeMessage.merge(
                     msg.muyu,
                     Soulless.Game.Lq.MuyuInfo.decode!(delimited)
                   )
               ], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operations:
                   msg.operations ++ [Soulless.Game.Lq.OptionalOperationList.decode!(delimited)]
               ], rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ju_count: value], rest}

            {21, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[field_spell: value], rest}

            {22, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[sha256: Protox.Decode.validate_string(delimited)], rest}

            {23, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 yongchang:
                   Protox.MergeMessage.merge(
                     msg.yongchang,
                     Soulless.Game.Lq.YongchangInfo.decode!(delimited)
                   )
               ], rest}

            {24, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[saltSha256: Protox.Decode.validate_string(delimited)], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[salt: Protox.Decode.validate_string(delimited)], rest}

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
        Soulless.Game.Lq.RecordNewRound,
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
        1 => {:chang, {:scalar, 0}, :uint32},
        2 => {:ju, {:scalar, 0}, :uint32},
        3 => {:ben, {:scalar, 0}, :uint32},
        4 => {:dora, {:scalar, ""}, :string},
        5 => {:scores, :packed, :int32},
        6 => {:liqibang, {:scalar, 0}, :uint32},
        7 => {:tiles0, :unpacked, :string},
        8 => {:tiles1, :unpacked, :string},
        9 => {:tiles2, :unpacked, :string},
        10 => {:tiles3, :unpacked, :string},
        11 => {:tingpai, :unpacked, {:message, Soulless.Game.Lq.RecordNewRound.TingPai}},
        12 => {:operation, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        13 => {:md5, {:scalar, ""}, :string},
        14 => {:paishan, {:scalar, ""}, :string},
        15 => {:left_tile_count, {:scalar, 0}, :uint32},
        16 => {:doras, :unpacked, :string},
        17 => {:opens, :unpacked, {:message, Soulless.Game.Lq.NewRoundOpenedTiles}},
        18 => {:muyu, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        19 => {:operations, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}},
        20 => {:ju_count, {:scalar, 0}, :uint32},
        21 => {:field_spell, {:scalar, 0}, :uint32},
        22 => {:sha256, {:scalar, ""}, :string},
        23 => {:yongchang, {:scalar, nil}, {:message, Soulless.Game.Lq.YongchangInfo}},
        24 => {:saltSha256, {:scalar, ""}, :string},
        25 => {:salt, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        ben: {3, {:scalar, 0}, :uint32},
        chang: {1, {:scalar, 0}, :uint32},
        dora: {4, {:scalar, ""}, :string},
        doras: {16, :unpacked, :string},
        field_spell: {21, {:scalar, 0}, :uint32},
        ju: {2, {:scalar, 0}, :uint32},
        ju_count: {20, {:scalar, 0}, :uint32},
        left_tile_count: {15, {:scalar, 0}, :uint32},
        liqibang: {6, {:scalar, 0}, :uint32},
        md5: {13, {:scalar, ""}, :string},
        muyu: {18, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        opens: {17, :unpacked, {:message, Soulless.Game.Lq.NewRoundOpenedTiles}},
        operation: {12, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        operations: {19, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}},
        paishan: {14, {:scalar, ""}, :string},
        salt: {25, {:scalar, ""}, :string},
        saltSha256: {24, {:scalar, ""}, :string},
        scores: {5, :packed, :int32},
        sha256: {22, {:scalar, ""}, :string},
        tiles0: {7, :unpacked, :string},
        tiles1: {8, :unpacked, :string},
        tiles2: {9, :unpacked, :string},
        tiles3: {10, :unpacked, :string},
        tingpai: {11, :unpacked, {:message, Soulless.Game.Lq.RecordNewRound.TingPai}},
        yongchang: {23, {:scalar, nil}, {:message, Soulless.Game.Lq.YongchangInfo}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "chang",
          kind: {:scalar, 0},
          label: :optional,
          name: :chang,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ju",
          kind: {:scalar, 0},
          label: :optional,
          name: :ju,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ben",
          kind: {:scalar, 0},
          label: :optional,
          name: :ben,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "dora",
          kind: {:scalar, ""},
          label: :optional,
          name: :dora,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "scores",
          kind: :packed,
          label: :repeated,
          name: :scores,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqibang",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqibang,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles0",
          kind: :unpacked,
          label: :repeated,
          name: :tiles0,
          tag: 7,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles1",
          kind: :unpacked,
          label: :repeated,
          name: :tiles1,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles2",
          kind: :unpacked,
          label: :repeated,
          name: :tiles2,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles3",
          kind: :unpacked,
          label: :repeated,
          name: :tiles3,
          tag: 10,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpai",
          kind: :unpacked,
          label: :repeated,
          name: :tingpai,
          tag: 11,
          type: {:message, Soulless.Game.Lq.RecordNewRound.TingPai}
        },
        %{
          __struct__: Protox.Field,
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 12,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "md5",
          kind: {:scalar, ""},
          label: :optional,
          name: :md5,
          tag: 13,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "paishan",
          kind: {:scalar, ""},
          label: :optional,
          name: :paishan,
          tag: 14,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "leftTileCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :left_tile_count,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 16,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "opens",
          kind: :unpacked,
          label: :repeated,
          name: :opens,
          tag: 17,
          type: {:message, Soulless.Game.Lq.NewRoundOpenedTiles}
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 18,
          type: {:message, Soulless.Game.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "operations",
          kind: :unpacked,
          label: :repeated,
          name: :operations,
          tag: 19,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "juCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :ju_count,
          tag: 20,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fieldSpell",
          kind: {:scalar, 0},
          label: :optional,
          name: :field_spell,
          tag: 21,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "sha256",
          kind: {:scalar, ""},
          label: :optional,
          name: :sha256,
          tag: 22,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "yongchang",
          kind: {:scalar, nil},
          label: :optional,
          name: :yongchang,
          tag: 23,
          type: {:message, Soulless.Game.Lq.YongchangInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "saltSha256",
          kind: {:scalar, ""},
          label: :optional,
          name: :saltSha256,
          tag: 24,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "salt",
          kind: {:scalar, ""},
          label: :optional,
          name: :salt,
          tag: 25,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:chang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("chang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:ju) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("ju") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:ben) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("ben") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:dora) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dora",
             kind: {:scalar, ""},
             label: :optional,
             name: :dora,
             tag: 4,
             type: :string
           }}
        end

        def field_def("dora") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dora",
             kind: {:scalar, ""},
             label: :optional,
             name: :dora,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:liqibang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibang",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("liqibang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibang",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:tiles0) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles0",
             kind: :unpacked,
             label: :repeated,
             name: :tiles0,
             tag: 7,
             type: :string
           }}
        end

        def field_def("tiles0") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles0",
             kind: :unpacked,
             label: :repeated,
             name: :tiles0,
             tag: 7,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:tiles1) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles1",
             kind: :unpacked,
             label: :repeated,
             name: :tiles1,
             tag: 8,
             type: :string
           }}
        end

        def field_def("tiles1") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles1",
             kind: :unpacked,
             label: :repeated,
             name: :tiles1,
             tag: 8,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:tiles2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles2",
             kind: :unpacked,
             label: :repeated,
             name: :tiles2,
             tag: 9,
             type: :string
           }}
        end

        def field_def("tiles2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles2",
             kind: :unpacked,
             label: :repeated,
             name: :tiles2,
             tag: 9,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:tiles3) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles3",
             kind: :unpacked,
             label: :repeated,
             name: :tiles3,
             tag: 10,
             type: :string
           }}
        end

        def field_def("tiles3") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles3",
             kind: :unpacked,
             label: :repeated,
             name: :tiles3,
             tag: 10,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:tingpai) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpai",
             kind: :unpacked,
             label: :repeated,
             name: :tingpai,
             tag: 11,
             type: {:message, Soulless.Game.Lq.RecordNewRound.TingPai}
           }}
        end

        def field_def("tingpai") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpai",
             kind: :unpacked,
             label: :repeated,
             name: :tingpai,
             tag: 11,
             type: {:message, Soulless.Game.Lq.RecordNewRound.TingPai}
           }}
        end

        []
      ),
      (
        def field_def(:operation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 12,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        def field_def("operation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 12,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def field_def(:md5) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "md5",
             kind: {:scalar, ""},
             label: :optional,
             name: :md5,
             tag: 13,
             type: :string
           }}
        end

        def field_def("md5") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "md5",
             kind: {:scalar, ""},
             label: :optional,
             name: :md5,
             tag: 13,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:paishan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paishan",
             kind: {:scalar, ""},
             label: :optional,
             name: :paishan,
             tag: 14,
             type: :string
           }}
        end

        def field_def("paishan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paishan",
             kind: {:scalar, ""},
             label: :optional,
             name: :paishan,
             tag: 14,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:left_tile_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("leftTileCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("left_tile_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 15,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:doras) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 16,
             type: :string
           }}
        end

        def field_def("doras") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 16,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:opens) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opens",
             kind: :unpacked,
             label: :repeated,
             name: :opens,
             tag: 17,
             type: {:message, Soulless.Game.Lq.NewRoundOpenedTiles}
           }}
        end

        def field_def("opens") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "opens",
             kind: :unpacked,
             label: :repeated,
             name: :opens,
             tag: 17,
             type: {:message, Soulless.Game.Lq.NewRoundOpenedTiles}
           }}
        end

        []
      ),
      (
        def field_def(:muyu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 18,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        def field_def("muyu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 18,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        []
      ),
      (
        def field_def(:operations) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operations",
             kind: :unpacked,
             label: :repeated,
             name: :operations,
             tag: 19,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        def field_def("operations") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operations",
             kind: :unpacked,
             label: :repeated,
             name: :operations,
             tag: 19,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def field_def(:ju_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "juCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju_count,
             tag: 20,
             type: :uint32
           }}
        end

        def field_def("juCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "juCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju_count,
             tag: 20,
             type: :uint32
           }}
        end

        def field_def("ju_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "juCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju_count,
             tag: 20,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:field_spell) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSpell",
             kind: {:scalar, 0},
             label: :optional,
             name: :field_spell,
             tag: 21,
             type: :uint32
           }}
        end

        def field_def("fieldSpell") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSpell",
             kind: {:scalar, 0},
             label: :optional,
             name: :field_spell,
             tag: 21,
             type: :uint32
           }}
        end

        def field_def("field_spell") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fieldSpell",
             kind: {:scalar, 0},
             label: :optional,
             name: :field_spell,
             tag: 21,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:sha256) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sha256",
             kind: {:scalar, ""},
             label: :optional,
             name: :sha256,
             tag: 22,
             type: :string
           }}
        end

        def field_def("sha256") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sha256",
             kind: {:scalar, ""},
             label: :optional,
             name: :sha256,
             tag: 22,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:yongchang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yongchang",
             kind: {:scalar, nil},
             label: :optional,
             name: :yongchang,
             tag: 23,
             type: {:message, Soulless.Game.Lq.YongchangInfo}
           }}
        end

        def field_def("yongchang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yongchang",
             kind: {:scalar, nil},
             label: :optional,
             name: :yongchang,
             tag: 23,
             type: {:message, Soulless.Game.Lq.YongchangInfo}
           }}
        end

        []
      ),
      (
        def field_def(:saltSha256) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "saltSha256",
             kind: {:scalar, ""},
             label: :optional,
             name: :saltSha256,
             tag: 24,
             type: :string
           }}
        end

        def field_def("saltSha256") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "saltSha256",
             kind: {:scalar, ""},
             label: :optional,
             name: :saltSha256,
             tag: 24,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:salt) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "salt",
             kind: {:scalar, ""},
             label: :optional,
             name: :salt,
             tag: 25,
             type: :string
           }}
        end

        def field_def("salt") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "salt",
             kind: {:scalar, ""},
             label: :optional,
             name: :salt,
             tag: 25,
             type: :string
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
    def default(:chang) do
      {:ok, 0}
    end,
    def default(:ju) do
      {:ok, 0}
    end,
    def default(:ben) do
      {:ok, 0}
    end,
    def default(:dora) do
      {:ok, ""}
    end,
    def default(:scores) do
      {:error, :no_default_value}
    end,
    def default(:liqibang) do
      {:ok, 0}
    end,
    def default(:tiles0) do
      {:error, :no_default_value}
    end,
    def default(:tiles1) do
      {:error, :no_default_value}
    end,
    def default(:tiles2) do
      {:error, :no_default_value}
    end,
    def default(:tiles3) do
      {:error, :no_default_value}
    end,
    def default(:tingpai) do
      {:error, :no_default_value}
    end,
    def default(:operation) do
      {:ok, nil}
    end,
    def default(:md5) do
      {:ok, ""}
    end,
    def default(:paishan) do
      {:ok, ""}
    end,
    def default(:left_tile_count) do
      {:ok, 0}
    end,
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:opens) do
      {:error, :no_default_value}
    end,
    def default(:muyu) do
      {:ok, nil}
    end,
    def default(:operations) do
      {:error, :no_default_value}
    end,
    def default(:ju_count) do
      {:ok, 0}
    end,
    def default(:field_spell) do
      {:ok, 0}
    end,
    def default(:sha256) do
      {:ok, ""}
    end,
    def default(:yongchang) do
      {:ok, nil}
    end,
    def default(:saltSha256) do
      {:ok, ""}
    end,
    def default(:salt) do
      {:ok, ""}
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
