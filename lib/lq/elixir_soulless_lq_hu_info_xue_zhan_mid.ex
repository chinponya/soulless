# credo:disable-for-this-file
defmodule(Soulless.Lq.HuInfoXueZhanMid) do
  @moduledoc false
  (
    defstruct(
      seat: 0,
      hand_count: 0,
      hand: [],
      ming: [],
      hu_tile: "",
      zimo: false,
      yiman: false,
      count: 0,
      fans: [],
      fu: 0,
      title_id: 0,
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
          |> encode_seat(msg)
          |> encode_hand_count(msg)
          |> encode_hand(msg)
          |> encode_ming(msg)
          |> encode_hu_tile(msg)
          |> encode_zimo(msg)
          |> encode_yiman(msg)
          |> encode_count(msg)
          |> encode_fans(msg)
          |> encode_fu(msg)
          |> encode_title_id(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_seat(acc, msg)) do
          try do
            if(msg.seat == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.seat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_hand_count(acc, msg)) do
          try do
            if(msg.hand_count == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.hand_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:hand_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_hand(acc, msg)) do
          try do
            case(msg.hand) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hand, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ming(acc, msg)) do
          try do
            case(msg.ming) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ming, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_hu_tile(acc, msg)) do
          try do
            if(msg.hu_tile == "") do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.hu_tile)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hu_tile, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_zimo(acc, msg)) do
          try do
            if(msg.zimo == false) do
              acc
            else
              [acc, "0", Protox.Encode.encode_bool(msg.zimo)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:zimo, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_yiman(acc, msg)) do
          try do
            if(msg.yiman == false) do
              acc
            else
              [acc, "8", Protox.Encode.encode_bool(msg.yiman)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:yiman, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_count(acc, msg)) do
          try do
            if(msg.count == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.count)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:count, "invalid field value"), __STACKTRACE__)
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
                    [acc, "J", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:fans, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_fu(acc, msg)) do
          try do
            if(msg.fu == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.fu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:fu, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_title_id(acc, msg)) do
          try do
            if(msg.title_id == 0) do
              acc
            else
              [acc, "X", Protox.Encode.encode_uint32(msg.title_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:title_id, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.HuInfoXueZhanMid))
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
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seat: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[hand_count: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[hand: msg.hand ++ [delimited]], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[ming: msg.ming ++ [delimited]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[hu_tile: delimited], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[zimo: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[yiman: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[count: value], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[fans: msg.fans ++ [Soulless.Lq.FanInfo.decode!(delimited)]], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[fu: value], rest}

              {11, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[title_id: value], rest}

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
          Soulless.Lq.HuInfoXueZhanMid,
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
        1 => {:seat, {:scalar, 0}, :uint32},
        2 => {:hand_count, {:scalar, 0}, :uint32},
        3 => {:hand, :unpacked, :string},
        4 => {:ming, :unpacked, :string},
        5 => {:hu_tile, {:scalar, ""}, :string},
        6 => {:zimo, {:scalar, false}, :bool},
        7 => {:yiman, {:scalar, false}, :bool},
        8 => {:count, {:scalar, 0}, :uint32},
        9 => {:fans, :unpacked, {:message, Soulless.Lq.FanInfo}},
        10 => {:fu, {:scalar, 0}, :uint32},
        11 => {:title_id, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        count: {8, {:scalar, 0}, :uint32},
        fans: {9, :unpacked, {:message, Soulless.Lq.FanInfo}},
        fu: {10, {:scalar, 0}, :uint32},
        hand: {3, :unpacked, :string},
        hand_count: {2, {:scalar, 0}, :uint32},
        hu_tile: {5, {:scalar, ""}, :string},
        ming: {4, :unpacked, :string},
        seat: {1, {:scalar, 0}, :uint32},
        title_id: {11, {:scalar, 0}, :uint32},
        yiman: {7, {:scalar, false}, :bool},
        zimo: {6, {:scalar, false}, :bool}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
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
          json_name: "handCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :hand_count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hand",
          kind: :unpacked,
          label: :repeated,
          name: :hand,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ming",
          kind: :unpacked,
          label: :repeated,
          name: :ming,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "huTile",
          kind: {:scalar, ""},
          label: :optional,
          name: :hu_tile,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "zimo",
          kind: {:scalar, false},
          label: :optional,
          name: :zimo,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "yiman",
          kind: {:scalar, false},
          label: :optional,
          name: :yiman,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "count",
          kind: {:scalar, 0},
          label: :optional,
          name: :count,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fans",
          kind: :unpacked,
          label: :repeated,
          name: :fans,
          tag: 9,
          type: {:message, Soulless.Lq.FanInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fu",
          kind: {:scalar, 0},
          label: :optional,
          name: :fu,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleId",
          kind: {:scalar, 0},
          label: :optional,
          name: :title_id,
          tag: 11,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:seat)) do
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

        def(field_def("seat")) do
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
        def(field_def(:hand_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :hand_count,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("handCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :hand_count,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("hand_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "handCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :hand_count,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:hand)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("hand")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:ming)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("ming")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:hu_tile)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("huTile")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("hu_tile")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "huTile",
             kind: {:scalar, ""},
             label: :optional,
             name: :hu_tile,
             tag: 5,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:zimo)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zimo",
             kind: {:scalar, false},
             label: :optional,
             name: :zimo,
             tag: 6,
             type: :bool
           }}
        end

        def(field_def("zimo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zimo",
             kind: {:scalar, false},
             label: :optional,
             name: :zimo,
             tag: 6,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:yiman)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 7,
             type: :bool
           }}
        end

        def(field_def("yiman")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 7,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 8,
             type: :uint32
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
             tag: 9,
             type: {:message, Soulless.Lq.FanInfo}
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
             tag: 9,
             type: {:message, Soulless.Lq.FanInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:fu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("fu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 10,
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
             tag: 11,
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
             tag: 11,
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
             tag: 11,
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
      def(default(:seat)) do
        {:ok, 0}
      end,
      def(default(:hand_count)) do
        {:ok, 0}
      end,
      def(default(:hand)) do
        {:error, :no_default_value}
      end,
      def(default(:ming)) do
        {:error, :no_default_value}
      end,
      def(default(:hu_tile)) do
        {:ok, ""}
      end,
      def(default(:zimo)) do
        {:ok, false}
      end,
      def(default(:yiman)) do
        {:ok, false}
      end,
      def(default(:count)) do
        {:ok, 0}
      end,
      def(default(:fans)) do
        {:error, :no_default_value}
      end,
      def(default(:fu)) do
        {:ok, 0}
      end,
      def(default(:title_id)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end