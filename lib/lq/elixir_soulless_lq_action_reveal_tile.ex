# credo:disable-for-this-file
defmodule(Soulless.Lq.ActionRevealTile) do
  @moduledoc false
  (
    defstruct(
      seat: 0,
      is_liqi: false,
      is_wliqi: false,
      moqie: false,
      scores: [],
      liqibang: 0,
      operation: nil,
      tingpais: [],
      tile: "",
      zhenting: false,
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
          |> encode_is_liqi(msg)
          |> encode_is_wliqi(msg)
          |> encode_moqie(msg)
          |> encode_scores(msg)
          |> encode_liqibang(msg)
          |> encode_operation(msg)
          |> encode_tingpais(msg)
          |> encode_tile(msg)
          |> encode_zhenting(msg)
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
        defp(encode_is_liqi(acc, msg)) do
          try do
            if(msg.is_liqi == false) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_bool(msg.is_liqi)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_liqi, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_wliqi(acc, msg)) do
          try do
            if(msg.is_wliqi == false) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_bool(msg.is_wliqi)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_wliqi, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_moqie(acc, msg)) do
          try do
            if(msg.moqie == false) do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.moqie)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:moqie, "invalid field value"), __STACKTRACE__)
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
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_int32(value)])
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
        defp(encode_liqibang(acc, msg)) do
          try do
            if(msg.liqibang == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.liqibang)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:liqibang, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_operation(acc, msg)) do
          try do
            if(msg.operation == nil) do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.operation)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tingpais(acc, msg)) do
          try do
            case(msg.tingpais) do
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
              reraise(Protox.EncodingError.new(:tingpais, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tile(acc, msg)) do
          try do
            if(msg.tile == "") do
              acc
            else
              [acc, "J", Protox.Encode.encode_string(msg.tile)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tile, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_zhenting(acc, msg)) do
          try do
            if(msg.zhenting == false) do
              acc
            else
              [acc, "P", Protox.Encode.encode_bool(msg.zhenting)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.ActionRevealTile))
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
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_liqi: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_wliqi: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[moqie: value], rest}

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

                {[
                   operation:
                     Protox.Message.merge(
                       msg.operation,
                       Soulless.Lq.OptionalOperationList.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tingpais: msg.tingpais ++ [Soulless.Lq.TingPaiInfo.decode!(delimited)]], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tile: delimited], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[zhenting: value], rest}

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
          Soulless.Lq.ActionRevealTile,
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
        2 => {:is_liqi, {:scalar, false}, :bool},
        3 => {:is_wliqi, {:scalar, false}, :bool},
        4 => {:moqie, {:scalar, false}, :bool},
        5 => {:scores, :packed, :int32},
        6 => {:liqibang, {:scalar, 0}, :uint32},
        7 => {:operation, {:scalar, nil}, {:message, Soulless.Lq.OptionalOperationList}},
        8 => {:tingpais, :unpacked, {:message, Soulless.Lq.TingPaiInfo}},
        9 => {:tile, {:scalar, ""}, :string},
        10 => {:zhenting, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        is_liqi: {2, {:scalar, false}, :bool},
        is_wliqi: {3, {:scalar, false}, :bool},
        liqibang: {6, {:scalar, 0}, :uint32},
        moqie: {4, {:scalar, false}, :bool},
        operation: {7, {:scalar, nil}, {:message, Soulless.Lq.OptionalOperationList}},
        scores: {5, :packed, :int32},
        seat: {1, {:scalar, 0}, :uint32},
        tile: {9, {:scalar, ""}, :string},
        tingpais: {8, :unpacked, {:message, Soulless.Lq.TingPaiInfo}},
        zhenting: {10, {:scalar, false}, :bool}
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
          json_name: "isLiqi",
          kind: {:scalar, false},
          label: :optional,
          name: :is_liqi,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isWliqi",
          kind: {:scalar, false},
          label: :optional,
          name: :is_wliqi,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "moqie",
          kind: {:scalar, false},
          label: :optional,
          name: :moqie,
          tag: 4,
          type: :bool
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
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 7,
          type: {:message, Soulless.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpais",
          kind: :unpacked,
          label: :repeated,
          name: :tingpais,
          tag: 8,
          type: {:message, Soulless.Lq.TingPaiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tile",
          kind: {:scalar, ""},
          label: :optional,
          name: :tile,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhenting",
          kind: {:scalar, false},
          label: :optional,
          name: :zhenting,
          tag: 10,
          type: :bool
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
        def(field_def(:is_liqi)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("isLiqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("is_liqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLiqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_liqi,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:is_wliqi)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("isWliqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("is_wliqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isWliqi",
             kind: {:scalar, false},
             label: :optional,
             name: :is_wliqi,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:moqie)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "moqie",
             kind: {:scalar, false},
             label: :optional,
             name: :moqie,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("moqie")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "moqie",
             kind: {:scalar, false},
             label: :optional,
             name: :moqie,
             tag: 4,
             type: :bool
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
             type: :int32
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
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:liqibang)) do
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

        def(field_def("liqibang")) do
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
        def(field_def(:operation)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 7,
             type: {:message, Soulless.Lq.OptionalOperationList}
           }}
        end

        def(field_def("operation")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 7,
             type: {:message, Soulless.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def(field_def(:tingpais)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais,
             tag: 8,
             type: {:message, Soulless.Lq.TingPaiInfo}
           }}
        end

        def(field_def("tingpais")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais,
             tag: 8,
             type: {:message, Soulless.Lq.TingPaiInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:tile)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tile",
             kind: {:scalar, ""},
             label: :optional,
             name: :tile,
             tag: 9,
             type: :string
           }}
        end

        def(field_def("tile")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tile",
             kind: {:scalar, ""},
             label: :optional,
             name: :tile,
             tag: 9,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:zhenting)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: {:scalar, false},
             label: :optional,
             name: :zhenting,
             tag: 10,
             type: :bool
           }}
        end

        def(field_def("zhenting")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: {:scalar, false},
             label: :optional,
             name: :zhenting,
             tag: 10,
             type: :bool
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
      def(default(:seat)) do
        {:ok, 0}
      end,
      def(default(:is_liqi)) do
        {:ok, false}
      end,
      def(default(:is_wliqi)) do
        {:ok, false}
      end,
      def(default(:moqie)) do
        {:ok, false}
      end,
      def(default(:scores)) do
        {:error, :no_default_value}
      end,
      def(default(:liqibang)) do
        {:ok, 0}
      end,
      def(default(:operation)) do
        {:ok, nil}
      end,
      def(default(:tingpais)) do
        {:error, :no_default_value}
      end,
      def(default(:tile)) do
        {:ok, ""}
      end,
      def(default(:zhenting)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end