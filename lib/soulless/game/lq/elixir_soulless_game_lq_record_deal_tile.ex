# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordDealTile do
  @moduledoc false
  defstruct seat: 0,
            tile: "",
            left_tile_count: 0,
            liqi: nil,
            doras: [],
            zhenting: [],
            operation: nil,
            tile_state: 0,
            muyu: nil,
            tile_index: 0,
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
        |> encode_left_tile_count(msg)
        |> encode_liqi(msg)
        |> encode_doras(msg)
        |> encode_zhenting(msg)
        |> encode_operation(msg)
        |> encode_tile_state(msg)
        |> encode_muyu(msg)
        |> encode_tile_index(msg)
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
      defp encode_left_tile_count(acc, msg) do
        try do
          if msg.left_tile_count == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.left_tile_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:left_tile_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_liqi(acc, msg) do
        try do
          if msg.liqi == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.liqi)]
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
                  [acc, "2", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__
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
            reraise Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_operation(acc, msg) do
        try do
          if msg.operation == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.operation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tile_state(acc, msg) do
        try do
          if msg.tile_state == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.tile_state)]
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
            [acc, "Z", Protox.Encode.encode_message(msg.muyu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_tile_index(acc, msg) do
        try do
          if msg.tile_index == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.tile_index)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tile_index, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordDealTile))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[left_tile_count: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 liqi:
                   Protox.MergeMessage.merge(
                     msg.liqi,
                     Soulless.Game.Lq.LiQiSuccess.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[doras: msg.doras ++ [delimited]], rest}

            {7, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[zhenting: msg.zhenting ++ Protox.Decode.parse_repeated_bool([], delimited)], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[zhenting: msg.zhenting ++ [value]], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operation:
                   Protox.MergeMessage.merge(
                     msg.operation,
                     Soulless.Game.Lq.OptionalOperationList.decode!(delimited)
                   )
               ], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tile_state: value], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 muyu:
                   Protox.MergeMessage.merge(
                     msg.muyu,
                     Soulless.Game.Lq.MuyuInfo.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[tile_index: value], rest}

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
        Soulless.Game.Lq.RecordDealTile,
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
        3 => {:left_tile_count, {:scalar, 0}, :uint32},
        5 => {:liqi, {:scalar, nil}, {:message, Soulless.Game.Lq.LiQiSuccess}},
        6 => {:doras, :unpacked, :string},
        7 => {:zhenting, :packed, :bool},
        8 => {:operation, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        9 => {:tile_state, {:scalar, 0}, :uint32},
        11 => {:muyu, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        12 => {:tile_index, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        doras: {6, :unpacked, :string},
        left_tile_count: {3, {:scalar, 0}, :uint32},
        liqi: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.LiQiSuccess}},
        muyu: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        operation: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        seat: {1, {:scalar, 0}, :uint32},
        tile: {2, {:scalar, ""}, :string},
        tile_index: {12, {:scalar, 0}, :uint32},
        tile_state: {9, {:scalar, 0}, :uint32},
        zhenting: {7, :packed, :bool}
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
          json_name: "leftTileCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :left_tile_count,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqi",
          kind: {:scalar, nil},
          label: :optional,
          name: :liqi,
          tag: 5,
          type: {:message, Soulless.Game.Lq.LiQiSuccess}
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 6,
          type: :string
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
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tileState",
          kind: {:scalar, 0},
          label: :optional,
          name: :tile_state,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 11,
          type: {:message, Soulless.Game.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tileIndex",
          kind: {:scalar, 0},
          label: :optional,
          name: :tile_index,
          tag: 12,
          type: :uint32
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
        def field_def(:left_tile_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:liqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Game.Lq.LiQiSuccess}
           }}
        end

        def field_def("liqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Game.Lq.LiQiSuccess}
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
             tag: 6,
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
             tag: 6,
             type: :string
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
             tag: 7,
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
             tag: 7,
             type: :bool
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
             tag: 8,
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
             tag: 8,
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
             tag: 9,
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
             tag: 9,
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
             tag: 9,
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
             tag: 11,
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
             tag: 11,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        []
      ),
      (
        def field_def(:tile_index) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_index,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("tileIndex") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_index,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("tile_index") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tileIndex",
             kind: {:scalar, 0},
             label: :optional,
             name: :tile_index,
             tag: 12,
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
    def default(:seat) do
      {:ok, 0}
    end,
    def default(:tile) do
      {:ok, ""}
    end,
    def default(:left_tile_count) do
      {:ok, 0}
    end,
    def default(:liqi) do
      {:ok, nil}
    end,
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:zhenting) do
      {:error, :no_default_value}
    end,
    def default(:operation) do
      {:ok, nil}
    end,
    def default(:tile_state) do
      {:ok, 0}
    end,
    def default(:muyu) do
      {:ok, nil}
    end,
    def default(:tile_index) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end