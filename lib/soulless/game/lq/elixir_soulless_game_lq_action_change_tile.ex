# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.ActionChangeTile) do
  @moduledoc false
  (
    defstruct(
      in_tiles: [],
      in_tile_states: [],
      out_tiles: [],
      out_tile_states: [],
      doras: [],
      tingpais0: [],
      tingpais1: [],
      operation: nil,
      change_type: 0,
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
          |> encode_in_tiles(msg)
          |> encode_in_tile_states(msg)
          |> encode_out_tiles(msg)
          |> encode_out_tile_states(msg)
          |> encode_doras(msg)
          |> encode_tingpais0(msg)
          |> encode_tingpais1(msg)
          |> encode_operation(msg)
          |> encode_change_type(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_in_tiles(acc, msg)) do
          try do
            case(msg.in_tiles) do
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
              reraise(Protox.EncodingError.new(:in_tiles, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_in_tile_states(acc, msg)) do
          try do
            case(msg.in_tile_states) do
              [] ->
                acc

              values ->
                [
                  acc,
                  <<18>>,
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
              reraise(
                Protox.EncodingError.new(:in_tile_states, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_out_tiles(acc, msg)) do
          try do
            case(msg.out_tiles) do
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
              reraise(Protox.EncodingError.new(:out_tiles, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_out_tile_states(acc, msg)) do
          try do
            case(msg.out_tile_states) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\"",
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
              reraise(
                Protox.EncodingError.new(:out_tile_states, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_doras(acc, msg)) do
          try do
            case(msg.doras) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "*", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tingpais0(acc, msg)) do
          try do
            case(msg.tingpais0) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "2", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tingpais0, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tingpais1(acc, msg)) do
          try do
            case(msg.tingpais1) do
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
              reraise(Protox.EncodingError.new(:tingpais1, "invalid field value"), __STACKTRACE__)
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
        defp(encode_change_type(acc, msg)) do
          try do
            if(msg.change_type == 0) do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.change_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:change_type, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ActionChangeTile))
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
                {[in_tiles: msg.in_tiles ++ [delimited]], rest}

              {2, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   in_tile_states:
                     msg.in_tile_states ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[in_tile_states: msg.in_tile_states ++ [value]], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[out_tiles: msg.out_tiles ++ [delimited]], rest}

              {4, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   out_tile_states:
                     msg.out_tile_states ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[out_tile_states: msg.out_tile_states ++ [value]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[doras: msg.doras ++ [delimited]], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   tingpais0:
                     msg.tingpais0 ++ [Soulless.Game.Lq.TingPaiDiscardInfo.decode!(delimited)]
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[tingpais1: msg.tingpais1 ++ [Soulless.Game.Lq.TingPaiInfo.decode!(delimited)]],
                 rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   operation:
                     Protox.Message.merge(
                       msg.operation,
                       Soulless.Game.Lq.OptionalOperationList.decode!(delimited)
                     )
                 ], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[change_type: value], rest}

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
          Soulless.Game.Lq.ActionChangeTile,
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
        1 => {:in_tiles, :unpacked, :string},
        2 => {:in_tile_states, :packed, :int32},
        3 => {:out_tiles, :unpacked, :string},
        4 => {:out_tile_states, :packed, :int32},
        5 => {:doras, :unpacked, :string},
        6 => {:tingpais0, :unpacked, {:message, Soulless.Game.Lq.TingPaiDiscardInfo}},
        7 => {:tingpais1, :unpacked, {:message, Soulless.Game.Lq.TingPaiInfo}},
        8 => {:operation, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        9 => {:change_type, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        change_type: {9, {:scalar, 0}, :uint32},
        doras: {5, :unpacked, :string},
        in_tile_states: {2, :packed, :int32},
        in_tiles: {1, :unpacked, :string},
        operation: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        out_tile_states: {4, :packed, :int32},
        out_tiles: {3, :unpacked, :string},
        tingpais0: {6, :unpacked, {:message, Soulless.Game.Lq.TingPaiDiscardInfo}},
        tingpais1: {7, :unpacked, {:message, Soulless.Game.Lq.TingPaiInfo}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "inTiles",
          kind: :unpacked,
          label: :repeated,
          name: :in_tiles,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "inTileStates",
          kind: :packed,
          label: :repeated,
          name: :in_tile_states,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "outTiles",
          kind: :unpacked,
          label: :repeated,
          name: :out_tiles,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "outTileStates",
          kind: :packed,
          label: :repeated,
          name: :out_tile_states,
          tag: 4,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpais0",
          kind: :unpacked,
          label: :repeated,
          name: :tingpais0,
          tag: 6,
          type: {:message, Soulless.Game.Lq.TingPaiDiscardInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpais1",
          kind: :unpacked,
          label: :repeated,
          name: :tingpais1,
          tag: 7,
          type: {:message, Soulless.Game.Lq.TingPaiInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 8,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "changeType",
          kind: {:scalar, 0},
          label: :optional,
          name: :change_type,
          tag: 9,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:in_tiles)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTiles",
             kind: :unpacked,
             label: :repeated,
             name: :in_tiles,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("inTiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTiles",
             kind: :unpacked,
             label: :repeated,
             name: :in_tiles,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("in_tiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTiles",
             kind: :unpacked,
             label: :repeated,
             name: :in_tiles,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:in_tile_states)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTileStates",
             kind: :packed,
             label: :repeated,
             name: :in_tile_states,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("inTileStates")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTileStates",
             kind: :packed,
             label: :repeated,
             name: :in_tile_states,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("in_tile_states")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "inTileStates",
             kind: :packed,
             label: :repeated,
             name: :in_tile_states,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:out_tiles)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTiles",
             kind: :unpacked,
             label: :repeated,
             name: :out_tiles,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("outTiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTiles",
             kind: :unpacked,
             label: :repeated,
             name: :out_tiles,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("out_tiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTiles",
             kind: :unpacked,
             label: :repeated,
             name: :out_tiles,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:out_tile_states)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTileStates",
             kind: :packed,
             label: :repeated,
             name: :out_tile_states,
             tag: 4,
             type: :int32
           }}
        end

        def(field_def("outTileStates")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTileStates",
             kind: :packed,
             label: :repeated,
             name: :out_tile_states,
             tag: 4,
             type: :int32
           }}
        end

        def(field_def("out_tile_states")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "outTileStates",
             kind: :packed,
             label: :repeated,
             name: :out_tile_states,
             tag: 4,
             type: :int32
           }}
        end
      ),
      (
        def(field_def(:doras)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("doras")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:tingpais0)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais0",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais0,
             tag: 6,
             type: {:message, Soulless.Game.Lq.TingPaiDiscardInfo}
           }}
        end

        def(field_def("tingpais0")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais0",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais0,
             tag: 6,
             type: {:message, Soulless.Game.Lq.TingPaiDiscardInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:tingpais1)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais1",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais1,
             tag: 7,
             type: {:message, Soulless.Game.Lq.TingPaiInfo}
           }}
        end

        def(field_def("tingpais1")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tingpais1",
             kind: :unpacked,
             label: :repeated,
             name: :tingpais1,
             tag: 7,
             type: {:message, Soulless.Game.Lq.TingPaiInfo}
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
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
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
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def(field_def(:change_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("changeType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("change_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 9,
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
      def(default(:in_tiles)) do
        {:error, :no_default_value}
      end,
      def(default(:in_tile_states)) do
        {:error, :no_default_value}
      end,
      def(default(:out_tiles)) do
        {:error, :no_default_value}
      end,
      def(default(:out_tile_states)) do
        {:error, :no_default_value}
      end,
      def(default(:doras)) do
        {:error, :no_default_value}
      end,
      def(default(:tingpais0)) do
        {:error, :no_default_value}
      end,
      def(default(:tingpais1)) do
        {:error, :no_default_value}
      end,
      def(default(:operation)) do
        {:ok, nil}
      end,
      def(default(:change_type)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end