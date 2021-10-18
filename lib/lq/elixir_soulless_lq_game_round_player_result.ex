# credo:disable-for-this-file
defmodule(Soulless.Lq.GameRoundPlayerResult) do
  @moduledoc false
  (
    defstruct(
      type: 0,
      hands: [],
      ming: [],
      liqi_type: 0,
      is_fulu: false,
      is_liujumanguan: false,
      lian_zhuang: 0,
      hu: nil,
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
          |> encode_type(msg)
          |> encode_hands(msg)
          |> encode_ming(msg)
          |> encode_liqi_type(msg)
          |> encode_is_fulu(msg)
          |> encode_is_liujumanguan(msg)
          |> encode_lian_zhuang(msg)
          |> encode_hu(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_type(acc, msg)) do
          try do
            if(msg.type == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.type)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_hands(acc, msg)) do
          try do
            case(msg.hands) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hands, "invalid field value"), __STACKTRACE__)
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
                    [acc, <<26>>, Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ming, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqi_type(acc, msg)) do
          try do
            if(msg.liqi_type == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.liqi_type)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:liqi_type, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_fulu(acc, msg)) do
          try do
            if(msg.is_fulu == false) do
              acc
            else
              [acc, "(", Protox.Encode.encode_bool(msg.is_fulu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_fulu, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_liujumanguan(acc, msg)) do
          try do
            if(msg.is_liujumanguan == false) do
              acc
            else
              [acc, "0", Protox.Encode.encode_bool(msg.is_liujumanguan)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:is_liujumanguan, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_lian_zhuang(acc, msg)) do
          try do
            if(msg.lian_zhuang == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.lian_zhuang)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:lian_zhuang, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_hu(acc, msg)) do
          try do
            if(msg.hu == nil) do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.hu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hu, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.GameRoundPlayerResult))
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
                {[type: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[hands: msg.hands ++ [delimited]], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[ming: msg.ming ++ [delimited]], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[liqi_type: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_fulu: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_liujumanguan: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[lian_zhuang: value], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   hu:
                     Protox.Message.merge(msg.hu, Soulless.Lq.GameRoundHuData.decode!(delimited))
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
          Soulless.Lq.GameRoundPlayerResult,
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
        1 => {:type, {:scalar, 0}, :uint32},
        2 => {:hands, :unpacked, :string},
        3 => {:ming, :unpacked, :string},
        4 => {:liqi_type, {:scalar, 0}, :uint32},
        5 => {:is_fulu, {:scalar, false}, :bool},
        6 => {:is_liujumanguan, {:scalar, false}, :bool},
        7 => {:lian_zhuang, {:scalar, 0}, :uint32},
        8 => {:hu, {:scalar, nil}, {:message, Soulless.Lq.GameRoundHuData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        hands: {2, :unpacked, :string},
        hu: {8, {:scalar, nil}, {:message, Soulless.Lq.GameRoundHuData}},
        is_fulu: {5, {:scalar, false}, :bool},
        is_liujumanguan: {6, {:scalar, false}, :bool},
        lian_zhuang: {7, {:scalar, 0}, :uint32},
        liqi_type: {4, {:scalar, 0}, :uint32},
        ming: {3, :unpacked, :string},
        type: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hands",
          kind: :unpacked,
          label: :repeated,
          name: :hands,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ming",
          kind: :unpacked,
          label: :repeated,
          name: :ming,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqiType",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqi_type,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isFulu",
          kind: {:scalar, false},
          label: :optional,
          name: :is_fulu,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isLiujumanguan",
          kind: {:scalar, false},
          label: :optional,
          name: :is_liujumanguan,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "lianZhuang",
          kind: {:scalar, 0},
          label: :optional,
          name: :lian_zhuang,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hu",
          kind: {:scalar, nil},
          label: :optional,
          name: :hu,
          tag: 8,
          type: {:message, Soulless.Lq.GameRoundHuData}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:hands)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("hands")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 2,
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
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:liqi_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiType",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_type,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("liqiType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiType",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_type,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("liqi_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiType",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqi_type,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_fulu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFulu",
             kind: {:scalar, false},
             label: :optional,
             name: :is_fulu,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("isFulu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFulu",
             kind: {:scalar, false},
             label: :optional,
             name: :is_fulu,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("is_fulu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isFulu",
             kind: {:scalar, false},
             label: :optional,
             name: :is_fulu,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:is_liujumanguan)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liujumanguan,
             tag: 6,
             type: :bool
           }}
        end

        def(field_def("isLiujumanguan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liujumanguan,
             tag: 6,
             type: :bool
           }}
        end

        def(field_def("is_liujumanguan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liujumanguan,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:lian_zhuang)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lianZhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :lian_zhuang,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("lianZhuang")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lianZhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :lian_zhuang,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("lian_zhuang")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lianZhuang",
             kind: {:scalar, 0},
             label: :optional,
             name: :lian_zhuang,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:hu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hu",
             kind: {:scalar, nil},
             label: :optional,
             name: :hu,
             tag: 8,
             type: {:message, Soulless.Lq.GameRoundHuData}
           }}
        end

        def(field_def("hu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hu",
             kind: {:scalar, nil},
             label: :optional,
             name: :hu,
             tag: 8,
             type: {:message, Soulless.Lq.GameRoundHuData}
           }}
        end

        []
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
      def(default(:type)) do
        {:ok, 0}
      end,
      def(default(:hands)) do
        {:error, :no_default_value}
      end,
      def(default(:ming)) do
        {:error, :no_default_value}
      end,
      def(default(:liqi_type)) do
        {:ok, 0}
      end,
      def(default(:is_fulu)) do
        {:ok, false}
      end,
      def(default(:is_liujumanguan)) do
        {:ok, false}
      end,
      def(default(:lian_zhuang)) do
        {:ok, 0}
      end,
      def(default(:hu)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end