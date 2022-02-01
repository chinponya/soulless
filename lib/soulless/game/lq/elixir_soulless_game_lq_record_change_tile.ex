# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordChangeTile do
  @moduledoc false
  defstruct doras: [],
            tingpai: [],
            change_tile_infos: [],
            operation: nil,
            change_type: 0,
            operations: [],
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
        |> encode_doras(msg)
        |> encode_tingpai(msg)
        |> encode_change_tile_infos(msg)
        |> encode_operation(msg)
        |> encode_change_type(msg)
        |> encode_operations(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_doras(acc, msg) do
        try do
          case msg.doras do
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
            reraise Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__
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
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tingpai, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_change_tile_infos(acc, msg) do
        try do
          case msg.change_tile_infos do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:change_tile_infos, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_operation(acc, msg) do
        try do
          if msg.operation == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.operation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_change_type(acc, msg) do
        try do
          if msg.change_type == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.change_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:change_type, "invalid field value"), __STACKTRACE__
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
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operations, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordChangeTile))
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
              {[doras: msg.doras ++ [delimited]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 tingpai:
                   msg.tingpai ++ [Soulless.Game.Lq.RecordChangeTile.TingPai.decode!(delimited)]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 change_tile_infos:
                   msg.change_tile_infos ++
                     [Soulless.Game.Lq.RecordChangeTile.ChangeTile.decode!(delimited)]
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operation:
                   Protox.MergeMessage.merge(
                     msg.operation,
                     Soulless.Game.Lq.OptionalOperationList.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[change_type: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operations:
                   msg.operations ++ [Soulless.Game.Lq.OptionalOperationList.decode!(delimited)]
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
        Soulless.Game.Lq.RecordChangeTile,
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
        1 => {:doras, :unpacked, :string},
        2 => {:tingpai, :unpacked, {:message, Soulless.Game.Lq.RecordChangeTile.TingPai}},
        3 =>
          {:change_tile_infos, :unpacked,
           {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}},
        4 => {:operation, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        5 => {:change_type, {:scalar, 0}, :uint32},
        6 => {:operations, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        change_tile_infos:
          {3, :unpacked, {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}},
        change_type: {5, {:scalar, 0}, :uint32},
        doras: {1, :unpacked, :string},
        operation: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.OptionalOperationList}},
        operations: {6, :unpacked, {:message, Soulless.Game.Lq.OptionalOperationList}},
        tingpai: {2, :unpacked, {:message, Soulless.Game.Lq.RecordChangeTile.TingPai}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tingpai",
          kind: :unpacked,
          label: :repeated,
          name: :tingpai,
          tag: 2,
          type: {:message, Soulless.Game.Lq.RecordChangeTile.TingPai}
        },
        %{
          __struct__: Protox.Field,
          json_name: "changeTileInfos",
          kind: :unpacked,
          label: :repeated,
          name: :change_tile_infos,
          tag: 3,
          type: {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}
        },
        %{
          __struct__: Protox.Field,
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 4,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "changeType",
          kind: {:scalar, 0},
          label: :optional,
          name: :change_type,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "operations",
          kind: :unpacked,
          label: :repeated,
          name: :operations,
          tag: 6,
          type: {:message, Soulless.Game.Lq.OptionalOperationList}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:doras) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 1,
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
             tag: 1,
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
             tag: 2,
             type: {:message, Soulless.Game.Lq.RecordChangeTile.TingPai}
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
             tag: 2,
             type: {:message, Soulless.Game.Lq.RecordChangeTile.TingPai}
           }}
        end

        []
      ),
      (
        def field_def(:change_tile_infos) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileInfos",
             kind: :unpacked,
             label: :repeated,
             name: :change_tile_infos,
             tag: 3,
             type: {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}
           }}
        end

        def field_def("changeTileInfos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileInfos",
             kind: :unpacked,
             label: :repeated,
             name: :change_tile_infos,
             tag: 3,
             type: {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}
           }}
        end

        def field_def("change_tile_infos") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeTileInfos",
             kind: :unpacked,
             label: :repeated,
             name: :change_tile_infos,
             tag: 3,
             type: {:message, Soulless.Game.Lq.RecordChangeTile.ChangeTile}
           }}
        end
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
             tag: 4,
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
             tag: 4,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
           }}
        end

        []
      ),
      (
        def field_def(:change_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("changeType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("change_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "changeType",
             kind: {:scalar, 0},
             label: :optional,
             name: :change_type,
             tag: 5,
             type: :uint32
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
             tag: 6,
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
             tag: 6,
             type: {:message, Soulless.Game.Lq.OptionalOperationList}
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
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:tingpai) do
      {:error, :no_default_value}
    end,
    def default(:change_tile_infos) do
      {:error, :no_default_value}
    end,
    def default(:operation) do
      {:ok, nil}
    end,
    def default(:change_type) do
      {:ok, 0}
    end,
    def default(:operations) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end