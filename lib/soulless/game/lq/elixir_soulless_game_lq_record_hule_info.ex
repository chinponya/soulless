# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordHuleInfo do
  @moduledoc false
  defstruct hand: [],
            ming: [],
            hu_tile: "",
            seat: 0,
            zimo: false,
            qinjia: false,
            liqi: false,
            doras: [],
            li_doras: [],
            yiman: false,
            count: 0,
            fans: [],
            fu: 0,
            point_zimo_qin: 0,
            point_zimo_xian: 0,
            title_id: 0,
            point_sum: 0,
            dadian: 0,
            is_jue_zhang: false,
            xun: 0,
            ting_type: 0,
            ting_mian: 0,
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
        |> encode_hand(msg)
        |> encode_ming(msg)
        |> encode_hu_tile(msg)
        |> encode_seat(msg)
        |> encode_zimo(msg)
        |> encode_qinjia(msg)
        |> encode_liqi(msg)
        |> encode_doras(msg)
        |> encode_li_doras(msg)
        |> encode_yiman(msg)
        |> encode_count(msg)
        |> encode_fans(msg)
        |> encode_fu(msg)
        |> encode_point_zimo_qin(msg)
        |> encode_point_zimo_xian(msg)
        |> encode_title_id(msg)
        |> encode_point_sum(msg)
        |> encode_dadian(msg)
        |> encode_is_jue_zhang(msg)
        |> encode_xun(msg)
        |> encode_ting_type(msg)
        |> encode_ting_mian(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_hand(acc, msg) do
        try do
          case msg.hand do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hand, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ming(acc, msg) do
        try do
          case msg.ming do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ming, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hu_tile(acc, msg) do
        try do
          if msg.hu_tile == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.hu_tile)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hu_tile, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_seat(acc, msg) do
        try do
          if msg.seat == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.seat)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_zimo(acc, msg) do
        try do
          if msg.zimo == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.zimo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:zimo, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_qinjia(acc, msg) do
        try do
          if msg.qinjia == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.qinjia)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:qinjia, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_liqi(acc, msg) do
        try do
          if msg.liqi == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.liqi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:liqi, "invalid field value"), __STACKTRACE__
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
      defp encode_li_doras(acc, msg) do
        try do
          case msg.li_doras do
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
            reraise Protox.EncodingError.new(:li_doras, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_yiman(acc, msg) do
        try do
          if msg.yiman == false do
            acc
          else
            [acc, "P", Protox.Encode.encode_bool(msg.yiman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:yiman, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_count(acc, msg) do
        try do
          if msg.count == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fans(acc, msg) do
        try do
          case msg.fans do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "b", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fans, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fu(acc, msg) do
        try do
          if msg.fu == 0 do
            acc
          else
            [acc, "h", Protox.Encode.encode_uint32(msg.fu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_point_zimo_qin(acc, msg) do
        try do
          if msg.point_zimo_qin == 0 do
            acc
          else
            [acc, "p", Protox.Encode.encode_uint32(msg.point_zimo_qin)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:point_zimo_qin, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_point_zimo_xian(acc, msg) do
        try do
          if msg.point_zimo_xian == 0 do
            acc
          else
            [acc, "x", Protox.Encode.encode_uint32(msg.point_zimo_xian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:point_zimo_xian, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_title_id(acc, msg) do
        try do
          if msg.title_id == 0 do
            acc
          else
            [acc, "\x80\x01", Protox.Encode.encode_uint32(msg.title_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_point_sum(acc, msg) do
        try do
          if msg.point_sum == 0 do
            acc
          else
            [acc, "\x88\x01", Protox.Encode.encode_uint32(msg.point_sum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:point_sum, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dadian(acc, msg) do
        try do
          if msg.dadian == 0 do
            acc
          else
            [acc, "\x90\x01", Protox.Encode.encode_uint32(msg.dadian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dadian, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_jue_zhang(acc, msg) do
        try do
          if msg.is_jue_zhang == false do
            acc
          else
            [acc, "\x98\x01", Protox.Encode.encode_bool(msg.is_jue_zhang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_jue_zhang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_xun(acc, msg) do
        try do
          if msg.xun == 0 do
            acc
          else
            [acc, "\xA0\x01", Protox.Encode.encode_uint32(msg.xun)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:xun, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ting_type(acc, msg) do
        try do
          if msg.ting_type == 0 do
            acc
          else
            [acc, "\xA8\x01", Protox.Encode.encode_uint32(msg.ting_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ting_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ting_mian(acc, msg) do
        try do
          if msg.ting_mian == 0 do
            acc
          else
            [acc, "\xB0\x01", Protox.Encode.encode_uint32(msg.ting_mian)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ting_mian, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordHuleInfo))
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
              {[hand: msg.hand ++ [Protox.Decode.validate_string(delimited)]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ming: msg.ming ++ [Protox.Decode.validate_string(delimited)]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hu_tile: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[seat: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[zimo: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[qinjia: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[liqi: value], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[doras: msg.doras ++ [Protox.Decode.validate_string(delimited)]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[li_doras: msg.li_doras ++ [Protox.Decode.validate_string(delimited)]], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[yiman: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[count: value], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 fans:
                   msg.fans ++ [Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo.decode!(delimited)]
               ], rest}

            {13, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fu: value], rest}

            {14, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[point_zimo_qin: value], rest}

            {15, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[point_zimo_xian: value], rest}

            {16, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[title_id: value], rest}

            {17, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[point_sum: value], rest}

            {18, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[dadian: value], rest}

            {19, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_jue_zhang: value], rest}

            {20, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[xun: value], rest}

            {21, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ting_type: value], rest}

            {22, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ting_mian: value], rest}

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
        Soulless.Game.Lq.RecordHuleInfo,
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
        1 => {:hand, :unpacked, :string},
        2 => {:ming, :unpacked, :string},
        3 => {:hu_tile, {:scalar, ""}, :string},
        4 => {:seat, {:scalar, 0}, :uint32},
        5 => {:zimo, {:scalar, false}, :bool},
        6 => {:qinjia, {:scalar, false}, :bool},
        7 => {:liqi, {:scalar, false}, :bool},
        8 => {:doras, :unpacked, :string},
        9 => {:li_doras, :unpacked, :string},
        10 => {:yiman, {:scalar, false}, :bool},
        11 => {:count, {:scalar, 0}, :uint32},
        12 => {:fans, :unpacked, {:message, Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo}},
        13 => {:fu, {:scalar, 0}, :uint32},
        14 => {:point_zimo_qin, {:scalar, 0}, :uint32},
        15 => {:point_zimo_xian, {:scalar, 0}, :uint32},
        16 => {:title_id, {:scalar, 0}, :uint32},
        17 => {:point_sum, {:scalar, 0}, :uint32},
        18 => {:dadian, {:scalar, 0}, :uint32},
        19 => {:is_jue_zhang, {:scalar, false}, :bool},
        20 => {:xun, {:scalar, 0}, :uint32},
        21 => {:ting_type, {:scalar, 0}, :uint32},
        22 => {:ting_mian, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        count: {11, {:scalar, 0}, :uint32},
        dadian: {18, {:scalar, 0}, :uint32},
        doras: {8, :unpacked, :string},
        fans: {12, :unpacked, {:message, Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo}},
        fu: {13, {:scalar, 0}, :uint32},
        hand: {1, :unpacked, :string},
        hu_tile: {3, {:scalar, ""}, :string},
        is_jue_zhang: {19, {:scalar, false}, :bool},
        li_doras: {9, :unpacked, :string},
        liqi: {7, {:scalar, false}, :bool},
        ming: {2, :unpacked, :string},
        point_sum: {17, {:scalar, 0}, :uint32},
        point_zimo_qin: {14, {:scalar, 0}, :uint32},
        point_zimo_xian: {15, {:scalar, 0}, :uint32},
        qinjia: {6, {:scalar, false}, :bool},
        seat: {4, {:scalar, 0}, :uint32},
        ting_mian: {22, {:scalar, 0}, :uint32},
        ting_type: {21, {:scalar, 0}, :uint32},
        title_id: {16, {:scalar, 0}, :uint32},
        xun: {20, {:scalar, 0}, :uint32},
        yiman: {10, {:scalar, false}, :bool},
        zimo: {5, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "hand",
          kind: :unpacked,
          label: :repeated,
          name: :hand,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ming",
          kind: :unpacked,
          label: :repeated,
          name: :ming,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "huTile",
          kind: {:scalar, ""},
          label: :optional,
          name: :hu_tile,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "zimo",
          kind: {:scalar, false},
          label: :optional,
          name: :zimo,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "qinjia",
          kind: {:scalar, false},
          label: :optional,
          name: :qinjia,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqi",
          kind: {:scalar, false},
          label: :optional,
          name: :liqi,
          tag: 7,
          type: :bool
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
          json_name: "liDoras",
          kind: :unpacked,
          label: :repeated,
          name: :li_doras,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "yiman",
          kind: {:scalar, false},
          label: :optional,
          name: :yiman,
          tag: 10,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "count",
          kind: {:scalar, 0},
          label: :optional,
          name: :count,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fans",
          kind: :unpacked,
          label: :repeated,
          name: :fans,
          tag: 12,
          type: {:message, Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fu",
          kind: {:scalar, 0},
          label: :optional,
          name: :fu,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "pointZimoQin",
          kind: {:scalar, 0},
          label: :optional,
          name: :point_zimo_qin,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "pointZimoXian",
          kind: {:scalar, 0},
          label: :optional,
          name: :point_zimo_xian,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleId",
          kind: {:scalar, 0},
          label: :optional,
          name: :title_id,
          tag: 16,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "pointSum",
          kind: {:scalar, 0},
          label: :optional,
          name: :point_sum,
          tag: 17,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "dadian",
          kind: {:scalar, 0},
          label: :optional,
          name: :dadian,
          tag: 18,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isJueZhang",
          kind: {:scalar, false},
          label: :optional,
          name: :is_jue_zhang,
          tag: 19,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "xun",
          kind: {:scalar, 0},
          label: :optional,
          name: :xun,
          tag: 20,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingType",
          kind: {:scalar, 0},
          label: :optional,
          name: :ting_type,
          tag: 21,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingMian",
          kind: {:scalar, 0},
          label: :optional,
          name: :ting_mian,
          tag: 22,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:hand) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
             tag: 1,
             type: :string
           }}
        end

        def field_def("hand") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:ming) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 2,
             type: :string
           }}
        end

        def field_def("ming") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:hu_tile) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 3,
             type: :string
           }}
        end

        def field_def("huTile") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 3,
             type: :string
           }}
        end

        def field_def("hu_tile") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:seat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 4,
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
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:zimo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zimo",
             kind: {:scalar, false},
             label: :optional,
             name: :zimo,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("zimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zimo",
             kind: {:scalar, false},
             label: :optional,
             name: :zimo,
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:qinjia) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qinjia",
             kind: {:scalar, false},
             label: :optional,
             name: :qinjia,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("qinjia") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qinjia",
             kind: {:scalar, false},
             label: :optional,
             name: :qinjia,
             tag: 6,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:liqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, false},
             label: :optional,
             name: :liqi,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("liqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, false},
             label: :optional,
             name: :liqi,
             tag: 7,
             type: :bool
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
        def field_def(:li_doras) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoras",
             kind: :unpacked,
             label: :repeated,
             name: :li_doras,
             tag: 9,
             type: :string
           }}
        end

        def field_def("liDoras") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoras",
             kind: :unpacked,
             label: :repeated,
             name: :li_doras,
             tag: 9,
             type: :string
           }}
        end

        def field_def("li_doras") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liDoras",
             kind: :unpacked,
             label: :repeated,
             name: :li_doras,
             tag: 9,
             type: :string
           }}
        end
      ),
      (
        def field_def(:yiman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("yiman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 10,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 11,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:fans) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fans",
             kind: :unpacked,
             label: :repeated,
             name: :fans,
             tag: 12,
             type: {:message, Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo}
           }}
        end

        def field_def("fans") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fans",
             kind: :unpacked,
             label: :repeated,
             name: :fans,
             tag: 12,
             type: {:message, Soulless.Game.Lq.RecordHuleInfo.RecordFanInfo}
           }}
        end

        []
      ),
      (
        def field_def(:fu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 13,
             type: :uint32
           }}
        end

        def field_def("fu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 13,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:point_zimo_qin) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoQin",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_qin,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("pointZimoQin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoQin",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_qin,
             tag: 14,
             type: :uint32
           }}
        end

        def field_def("point_zimo_qin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoQin",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_qin,
             tag: 14,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:point_zimo_xian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoXian",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_xian,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("pointZimoXian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoXian",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_xian,
             tag: 15,
             type: :uint32
           }}
        end

        def field_def("point_zimo_xian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointZimoXian",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_zimo_xian,
             tag: 15,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:title_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("titleId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 16,
             type: :uint32
           }}
        end

        def field_def("title_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 16,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:point_sum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_sum,
             tag: 17,
             type: :uint32
           }}
        end

        def field_def("pointSum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_sum,
             tag: 17,
             type: :uint32
           }}
        end

        def field_def("point_sum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "pointSum",
             kind: {:scalar, 0},
             label: :optional,
             name: :point_sum,
             tag: 17,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:dadian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dadian",
             kind: {:scalar, 0},
             label: :optional,
             name: :dadian,
             tag: 18,
             type: :uint32
           }}
        end

        def field_def("dadian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dadian",
             kind: {:scalar, 0},
             label: :optional,
             name: :dadian,
             tag: 18,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:is_jue_zhang) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isJueZhang",
             kind: {:scalar, false},
             label: :optional,
             name: :is_jue_zhang,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("isJueZhang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isJueZhang",
             kind: {:scalar, false},
             label: :optional,
             name: :is_jue_zhang,
             tag: 19,
             type: :bool
           }}
        end

        def field_def("is_jue_zhang") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isJueZhang",
             kind: {:scalar, false},
             label: :optional,
             name: :is_jue_zhang,
             tag: 19,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:xun) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xun",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun,
             tag: 20,
             type: :uint32
           }}
        end

        def field_def("xun") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "xun",
             kind: {:scalar, 0},
             label: :optional,
             name: :xun,
             tag: 20,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:ting_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_type,
             tag: 21,
             type: :uint32
           }}
        end

        def field_def("tingType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_type,
             tag: 21,
             type: :uint32
           }}
        end

        def field_def("ting_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_type,
             tag: 21,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:ting_mian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingMian",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_mian,
             tag: 22,
             type: :uint32
           }}
        end

        def field_def("tingMian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingMian",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_mian,
             tag: 22,
             type: :uint32
           }}
        end

        def field_def("ting_mian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingMian",
             kind: {:scalar, 0},
             label: :optional,
             name: :ting_mian,
             tag: 22,
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
    def default(:hand) do
      {:error, :no_default_value}
    end,
    def default(:ming) do
      {:error, :no_default_value}
    end,
    def default(:hu_tile) do
      {:ok, ""}
    end,
    def default(:seat) do
      {:ok, 0}
    end,
    def default(:zimo) do
      {:ok, false}
    end,
    def default(:qinjia) do
      {:ok, false}
    end,
    def default(:liqi) do
      {:ok, false}
    end,
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:li_doras) do
      {:error, :no_default_value}
    end,
    def default(:yiman) do
      {:ok, false}
    end,
    def default(:count) do
      {:ok, 0}
    end,
    def default(:fans) do
      {:error, :no_default_value}
    end,
    def default(:fu) do
      {:ok, 0}
    end,
    def default(:point_zimo_qin) do
      {:ok, 0}
    end,
    def default(:point_zimo_xian) do
      {:ok, 0}
    end,
    def default(:title_id) do
      {:ok, 0}
    end,
    def default(:point_sum) do
      {:ok, 0}
    end,
    def default(:dadian) do
      {:ok, 0}
    end,
    def default(:is_jue_zhang) do
      {:ok, false}
    end,
    def default(:xun) do
      {:ok, 0}
    end,
    def default(:ting_type) do
      {:ok, 0}
    end,
    def default(:ting_mian) do
      {:ok, 0}
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
