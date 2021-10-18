# credo:disable-for-this-file
defmodule(Soulless.Lq.RecordChiPengGang) do
  @moduledoc false
  (
    defstruct(
      seat: 0,
      type: 0,
      tiles: [],
      froms: [],
      liqi: nil,
      zhenting: [],
      operation: nil,
      tile_states: [],
      muyu: nil,
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
          |> encode_type(msg)
          |> encode_tiles(msg)
          |> encode_froms(msg)
          |> encode_liqi(msg)
          |> encode_zhenting(msg)
          |> encode_operation(msg)
          |> encode_tile_states(msg)
          |> encode_muyu(msg)
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
        defp(encode_type(acc, msg)) do
          try do
            if(msg.type == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.type)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tiles(acc, msg)) do
          try do
            case(msg.tiles) do
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
              reraise(Protox.EncodingError.new(:tiles, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_froms(acc, msg)) do
          try do
            case(msg.froms) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\"",
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
              reraise(Protox.EncodingError.new(:froms, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqi(acc, msg)) do
          try do
            if(msg.liqi == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.liqi)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:liqi, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_zhenting(acc, msg)) do
          try do
            case(msg.zhenting) do
              [] ->
                acc

              values ->
                [
                  acc,
                  ":",
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
              reraise(Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_operation(acc, msg)) do
          try do
            if(msg.operation == nil) do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.operation)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tile_states(acc, msg)) do
          try do
            case(msg.tile_states) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "J",
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
                Protox.EncodingError.new(:tile_states, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_muyu(acc, msg)) do
          try do
            if(msg.muyu == nil) do
              acc
            else
              [acc, "R", Protox.Encode.encode_message(msg.muyu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.RecordChiPengGang))
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
                {[type: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tiles: msg.tiles ++ [delimited]], rest}

              {4, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[froms: msg.froms ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[froms: msg.froms ++ [value]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   liqi:
                     Protox.Message.merge(msg.liqi, Soulless.Lq.LiQiSuccess.decode!(delimited))
                 ], rest}

              {7, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[zhenting: msg.zhenting ++ Protox.Decode.parse_repeated_bool([], delimited)],
                 rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[zhenting: msg.zhenting ++ [value]], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   operation:
                     Protox.Message.merge(
                       msg.operation,
                       Soulless.Lq.OptionalOperationList.decode!(delimited)
                     )
                 ], rest}

              {9, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   tile_states:
                     msg.tile_states ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[tile_states: msg.tile_states ++ [value]], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[muyu: Protox.Message.merge(msg.muyu, Soulless.Lq.MuyuInfo.decode!(delimited))],
                 rest}

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
          Soulless.Lq.RecordChiPengGang,
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
        2 => {:type, {:scalar, 0}, :uint32},
        3 => {:tiles, :unpacked, :string},
        4 => {:froms, :packed, :uint32},
        5 => {:liqi, {:scalar, nil}, {:message, Soulless.Lq.LiQiSuccess}},
        7 => {:zhenting, :packed, :bool},
        8 => {:operation, {:scalar, nil}, {:message, Soulless.Lq.OptionalOperationList}},
        9 => {:tile_states, :packed, :uint32},
        10 => {:muyu, {:scalar, nil}, {:message, Soulless.Lq.MuyuInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        froms: {4, :packed, :uint32},
        liqi: {5, {:scalar, nil}, {:message, Soulless.Lq.LiQiSuccess}},
        muyu: {10, {:scalar, nil}, {:message, Soulless.Lq.MuyuInfo}},
        operation: {8, {:scalar, nil}, {:message, Soulless.Lq.OptionalOperationList}},
        seat: {1, {:scalar, 0}, :uint32},
        tile_states: {9, :packed, :uint32},
        tiles: {3, :unpacked, :string},
        type: {2, {:scalar, 0}, :uint32},
        zhenting: {7, :packed, :bool}
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
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles",
          kind: :unpacked,
          label: :repeated,
          name: :tiles,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "froms",
          kind: :packed,
          label: :repeated,
          name: :froms,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqi",
          kind: {:scalar, nil},
          label: :optional,
          name: :liqi,
          tag: 5,
          type: {:message, Soulless.Lq.LiQiSuccess}
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhenting",
          kind: :packed,
          label: :repeated,
          name: :zhenting,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 8,
          type: {:message, Soulless.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tileStates",
          kind: :packed,
          label: :repeated,
          name: :tile_states,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 10,
          type: {:message, Soulless.Lq.MuyuInfo}
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
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
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
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:tiles)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles",
             kind: :unpacked,
             label: :repeated,
             name: :tiles,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("tiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles",
             kind: :unpacked,
             label: :repeated,
             name: :tiles,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:froms)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "froms",
             kind: :packed,
             label: :repeated,
             name: :froms,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("froms")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "froms",
             kind: :packed,
             label: :repeated,
             name: :froms,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:liqi)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Lq.LiQiSuccess}
           }}
        end

        def(field_def("liqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Lq.LiQiSuccess}
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
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 7,
             type: :bool
           }}
        end

        def(field_def("zhenting")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 7,
             type: :bool
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
             tag: 8,
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
             tag: 8,
             type: {:message, Soulless.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def(field_def(:tile_states)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileStates",
             kind: :packed,
             label: :repeated,
             name: :tile_states,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("tileStates")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileStates",
             kind: :packed,
             label: :repeated,
             name: :tile_states,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("tile_states")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileStates",
             kind: :packed,
             label: :repeated,
             name: :tile_states,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:muyu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 10,
             type: {:message, Soulless.Lq.MuyuInfo}
           }}
        end

        def(field_def("muyu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 10,
             type: {:message, Soulless.Lq.MuyuInfo}
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
      def(default(:type)) do
        {:ok, 0}
      end,
      def(default(:tiles)) do
        {:error, :no_default_value}
      end,
      def(default(:froms)) do
        {:error, :no_default_value}
      end,
      def(default(:liqi)) do
        {:ok, nil}
      end,
      def(default(:zhenting)) do
        {:error, :no_default_value}
      end,
      def(default(:operation)) do
        {:ok, nil}
      end,
      def(default(:tile_states)) do
        {:error, :no_default_value}
      end,
      def(default(:muyu)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end