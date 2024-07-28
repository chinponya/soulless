# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordDiscardTile do
  @moduledoc false
  defstruct seat: 0,
            tile: "",
            is_liqi: false,
            moqie: false,
            zhenting: [],
            tingpais: [],
            doras: [],
            is_wliqi: false,
            operations: [],
            tile_state: 0,
            muyu: nil,
            yongchang: nil,
            hun_zhi_yi_ji_info: nil,
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
        |> encode_seat(msg)
        |> encode_tile(msg)
        |> encode_is_liqi(msg)
        |> encode_moqie(msg)
        |> encode_zhenting(msg)
        |> encode_tingpais(msg)
        |> encode_doras(msg)
        |> encode_is_wliqi(msg)
        |> encode_operations(msg)
        |> encode_tile_state(msg)
        |> encode_muyu(msg)
        |> encode_yongchang(msg)
        |> encode_hun_zhi_yi_ji_info(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_seat(acc, msg) do
        try do
          if msg.seat == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.seat)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tile(acc, msg) do
        try do
          if msg.tile == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.tile)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tile, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_liqi(acc, msg) do
        try do
          if msg.is_liqi == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.is_liqi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_liqi, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_moqie(acc, msg) do
        try do
          if msg.moqie == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.moqie)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:moqie, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_zhenting(acc, msg) do
        try do
          case msg.zhenting do
            [] ->
              acc

            values ->
              [
                acc,
                "2",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_bool(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tingpais(acc, msg) do
        try do
          case msg.tingpais do
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
            reraise Protox.EncodingError.new(:tingpais, "invalid field value"), __STACKTRACE__
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
                  [acc, "B", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_wliqi(acc, msg) do
        try do
          if msg.is_wliqi == false do
            acc
          else
            [acc, "H", Protox.Encode.encode_bool(msg.is_wliqi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_wliqi, "invalid field value"), __STACKTRACE__
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
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operations, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tile_state(acc, msg) do
        try do
          if msg.tile_state == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.tile_state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tile_state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_muyu(acc, msg) do
        try do
          if msg.muyu == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.muyu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_yongchang(acc, msg) do
        try do
          if msg.yongchang == nil do
            acc
          else
            [acc, "j", Protox.Encode.encode_message(msg.yongchang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:yongchang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hun_zhi_yi_ji_info(acc, msg) do
        try do
          if msg.hun_zhi_yi_ji_info == nil do
            acc
          else
            [acc, "r", Protox.Encode.encode_message(msg.hun_zhi_yi_ji_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hun_zhi_yi_ji_info, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordDiscardTile))
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
              {[seat: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tile: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_liqi: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[moqie: value], rest}

            {6, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[zhenting: msg.zhenting ++ Protox.Decode.parse_repeated_bool([], delimited)], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[zhenting: msg.zhenting ++ [value]], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[tingpais: msg.tingpais ++ [Soulless.Game.Lq.TingPaiInfo.decode!(delimited)]],
               rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[doras: msg.doras ++ [delimited]], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_wliqi: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operations:
                   msg.operations ++ [Soulless.Game.Lq.OptionalOperationList.decode!(delimited)]
               ], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tile_state: value], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 muyu:
                   Protox.MergeMessage.merge(
                     msg.muyu,
                     Soulless.Game.Lq.MuyuInfo.decode!(delimited)
                   )
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 yongchang:
                   Protox.MergeMessage.merge(
                     msg.yongchang,
                     Soulless.Game.Lq.YongchangInfo.decode!(delimited)
                   )
               ], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 hun_zhi_yi_ji_info:
                   Protox.MergeMessage.merge(
                     msg.hun_zhi_yi_ji_info,
                     Soulless.Game.Lq.HunZhiYiJiBuffInfo.decode!(delimited)
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
        Soulless.Game.Lq.RecordDiscardTile,
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
        1 => {:seat, {:scalar, 0}, :uint32},
        2 => {:tile, {:scalar, ""}, :string},
        3 => {:is_liqi, {:scalar, false}, :bool},
        5 => {:moqie, {:scalar, false}, :bool},
        6 => {:zhenting, :packed, :bool},
        7 => {:tingpais, :unpacked, {:message, Soulless.Game.Lq.TingPaiInfo}},
        8 => {:doras, :unpacked, :string},
        9 => {:is_wliqi, {:scalar, false}, :bool},
        10 => {:operations, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}},
        11 => {:tile_state, {:scalar, 0}, :uint32},
        12 => {:muyu, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        13 => {:yongchang, {:scalar, nil}, {:message, Soulless.Game.Lq.YongchangInfo}},
        14 =>
          {:hun_zhi_yi_ji_info, {:scalar, nil}, {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        doras: {8, :unpacked, :string},
        hun_zhi_yi_ji_info: {14, {:scalar, nil}, {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}},
        is_liqi: {3, {:scalar, false}, :bool},
        is_wliqi: {9, {:scalar, false}, :bool},
        moqie: {5, {:scalar, false}, :bool},
        muyu: {12, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        operations: {10, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}},
        seat: {1, {:scalar, 0}, :uint32},
        tile: {2, {:scalar, ""}, :string},
        tile_state: {11, {:scalar, 0}, :uint32},
        tingpais: {7, :unpacked, {:message, Soulless.Game.Lq.TingPaiInfo}},
        yongchang: {13, {:scalar, nil}, {:message, Soulless.Game.Lq.YongchangInfo}},
        zhenting: {6, :packed, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tile",
          kind: {:scalar, ""},
          label: :optional,
          name: :tile,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isLiqi",
          kind: {:scalar, false},
          label: :optional,
          name: :is_liqi,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "moqie",
          kind: {:scalar, false},
          label: :optional,
          name: :moqie,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhenting",
          kind: :packed,
          label: :repeated,
          name: :zhenting,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpais",
          kind: :unpacked,
          label: :repeated,
          name: :tingpais,
          tag: 7,
          type: {:message, Soulless.Game.Lq.TingPaiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isWliqi",
          kind: {:scalar, false},
          label: :optional,
          name: :is_wliqi,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "operations",
          kind: :unpacked,
          label: :repeated,
          name: :operations,
          tag: 10,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tileState",
          kind: {:scalar, 0},
          label: :optional,
          name: :tile_state,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 12,
          type: {:message, Soulless.Game.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "yongchang",
          kind: {:scalar, nil},
          label: :optional,
          name: :yongchang,
          tag: 13,
          type: {:message, Soulless.Game.Lq.YongchangInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hunZhiYiJiInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :hun_zhi_yi_ji_info,
          tag: 14,
          type: {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:seat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("seat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:tile) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tile",
             kind: {:scalar, ""},
             label: :optional,
             name: :tile,
             tag: 2,
             type: :string
           }}
        end

        def field_def("tile") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tile",
             kind: {:scalar, ""},
             label: :optional,
             name: :tile,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:is_liqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("isLiqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("is_liqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:moqie) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "moqie",
             kind: {:scalar, false},
             label: :optional,
             name: :moqie,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("moqie") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "moqie",
             kind: {:scalar, false},
             label: :optional,
             name: :moqie,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:zhenting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("zhenting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 6,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:tingpais) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais,
             tag: 7,
             type: {:message, Soulless.Game.Lq.TingPaiInfo}
           }}
        end

        def field_def("tingpais") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais,
             tag: 7,
             type: {:message, Soulless.Game.Lq.TingPaiInfo}
           }}
        end

        []
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
             tag: 8,
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
             tag: 8,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:is_wliqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("isWliqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("is_wliqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 9,
             type: :bool
           }}
        end
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
             tag: 10,
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
             tag: 10,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def field_def(:tile_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileState",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_state,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("tileState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileState",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_state,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("tile_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileState",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_state,
             tag: 11,
             type: :uint32
           }}
        end
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
             tag: 12,
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
             tag: 12,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
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
             tag: 13,
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
             tag: 13,
             type: {:message, Soulless.Game.Lq.YongchangInfo}
           }}
        end

        []
      ),
      (
        def field_def(:hun_zhi_yi_ji_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hunZhiYiJiInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hun_zhi_yi_ji_info,
             tag: 14,
             type: {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}
           }}
        end

        def field_def("hunZhiYiJiInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hunZhiYiJiInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hun_zhi_yi_ji_info,
             tag: 14,
             type: {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}
           }}
        end

        def field_def("hun_zhi_yi_ji_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hunZhiYiJiInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :hun_zhi_yi_ji_info,
             tag: 14,
             type: {:message, Soulless.Game.Lq.HunZhiYiJiBuffInfo}
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
    def default(:seat) do
      {:ok, 0}
    end,
    def default(:tile) do
      {:ok, ""}
    end,
    def default(:is_liqi) do
      {:ok, false}
    end,
    def default(:moqie) do
      {:ok, false}
    end,
    def default(:zhenting) do
      {:error, :no_default_value}
    end,
    def default(:tingpais) do
      {:error, :no_default_value}
    end,
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:is_wliqi) do
      {:ok, false}
    end,
    def default(:operations) do
      {:error, :no_default_value}
    end,
    def default(:tile_state) do
      {:ok, 0}
    end,
    def default(:muyu) do
      {:ok, nil}
    end,
    def default(:yongchang) do
      {:ok, nil}
    end,
    def default(:hun_zhi_yi_ji_info) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end