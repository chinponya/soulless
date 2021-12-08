# credo:disable-for-this-file
defmodule Soulless.Game.Lq.OptionalOperation do
  @moduledoc false
  (
    defstruct type: 0,
              combination: [],
              change_tiles: [],
              change_tile_states: [],
              gap_type: 0,
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
          |> encode_type(msg)
          |> encode_combination(msg)
          |> encode_change_tiles(msg)
          |> encode_change_tile_states(msg)
          |> encode_gap_type(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_type(acc, msg) do
          try do
            if msg.type == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.type)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_combination(acc, msg) do
          try do
            case msg.combination do
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
              reraise Protox.EncodingError.new(:combination, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_change_tiles(acc, msg) do
          try do
            case msg.change_tiles do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\x1A", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:change_tiles, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_change_tile_states(acc, msg) do
          try do
            case msg.change_tile_states do
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
              reraise Protox.EncodingError.new(:change_tile_states, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_gap_type(acc, msg) do
          try do
            if msg.gap_type == 0 do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.gap_type)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:gap_type, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.OptionalOperation))
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
                {[type: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[combination: msg.combination ++ [delimited]], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[change_tiles: msg.change_tiles ++ [delimited]], rest}

              {4, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   change_tile_states:
                     msg.change_tile_states ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[change_tile_states: msg.change_tile_states ++ [value]], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[gap_type: value], rest}

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
          Soulless.Game.Lq.OptionalOperation,
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

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:type, {:scalar, 0}, :uint32},
        2 => {:combination, :unpacked, :string},
        3 => {:change_tiles, :unpacked, :string},
        4 => {:change_tile_states, :packed, :int32},
        5 => {:gap_type, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        change_tile_states: {4, :packed, :int32},
        change_tiles: {3, :unpacked, :string},
        combination: {2, :unpacked, :string},
        gap_type: {5, {:scalar, 0}, :uint32},
        type: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
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
          json_name: "combination",
          kind: :unpacked,
          label: :repeated,
          name: :combination,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "changeTiles",
          kind: :unpacked,
          label: :repeated,
          name: :change_tiles,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "changeTileStates",
          kind: :packed,
          label: :repeated,
          name: :change_tile_states,
          tag: 4,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gapType",
          kind: {:scalar, 0},
          label: :optional,
          name: :gap_type,
          tag: 5,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:type) do
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

        def field_def("type") do
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
        def field_def(:combination) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "combination",
             kind: :unpacked,
             label: :repeated,
             name: :combination,
             tag: 2,
             type: :string
           }}
        end

        def field_def("combination") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "combination",
             kind: :unpacked,
             label: :repeated,
             name: :combination,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:change_tiles) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTiles",
             kind: :unpacked,
             label: :repeated,
             name: :change_tiles,
             tag: 3,
             type: :string
           }}
        end

        def field_def("changeTiles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTiles",
             kind: :unpacked,
             label: :repeated,
             name: :change_tiles,
             tag: 3,
             type: :string
           }}
        end

        def field_def("change_tiles") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTiles",
             kind: :unpacked,
             label: :repeated,
             name: :change_tiles,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:change_tile_states) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileStates",
             kind: :packed,
             label: :repeated,
             name: :change_tile_states,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("changeTileStates") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileStates",
             kind: :packed,
             label: :repeated,
             name: :change_tile_states,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("change_tile_states") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileStates",
             kind: :packed,
             label: :repeated,
             name: :change_tile_states,
             tag: 4,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:gap_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gapType",
             kind: {:scalar, 0},
             label: :optional,
             name: :gap_type,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("gapType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gapType",
             kind: {:scalar, 0},
             label: :optional,
             name: :gap_type,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("gap_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gapType",
             kind: {:scalar, 0},
             label: :optional,
             name: :gap_type,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]

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

    @spec required_fields() :: []
    def required_fields() do
      []
    end

    @spec syntax() :: atom
    def syntax() do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def default(:type) do
        {:ok, 0}
      end,
      def default(:combination) do
        {:error, :no_default_value}
      end,
      def default(:change_tiles) do
        {:error, :no_default_value}
      end,
      def default(:change_tile_states) do
        {:error, :no_default_value}
      end,
      def default(:gap_type) do
        {:ok, 0}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end