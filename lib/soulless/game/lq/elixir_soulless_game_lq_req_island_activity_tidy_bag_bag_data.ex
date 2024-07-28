# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData do
  @moduledoc false
  defstruct bag_id: 0, items: [], drops: [], __uf__: []

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
        |> encode_bag_id(msg)
        |> encode_items(msg)
        |> encode_drops(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_bag_id(acc, msg) do
        try do
          if msg.bag_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.bag_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bag_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_items(acc, msg) do
        try do
          case msg.items do
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
            reraise Protox.EncodingError.new(:items, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_drops(acc, msg) do
        try do
          case msg.drops do
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
            reraise Protox.EncodingError.new(:drops, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData))
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

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[bag_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 items:
                   msg.items ++
                     [
                       Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData.decode!(
                         delimited
                       )
                     ]
               ], rest}

            {4, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[drops: msg.drops ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[drops: msg.drops ++ [value]], rest}

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
        Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData,
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
        2 => {:bag_id, {:scalar, 0}, :uint32},
        3 =>
          {:items, :unpacked,
           {:message, Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData}},
        4 => {:drops, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        bag_id: {2, {:scalar, 0}, :uint32},
        drops: {4, :packed, :uint32},
        items:
          {3, :unpacked, {:message, Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "bagId",
          kind: {:scalar, 0},
          label: :optional,
          name: :bag_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "items",
          kind: :unpacked,
          label: :repeated,
          name: :items,
          tag: 3,
          type: {:message, Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "drops",
          kind: :packed,
          label: :repeated,
          name: :drops,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:bag_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("bagId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("bag_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagId",
             kind: {:scalar, 0},
             label: :optional,
             name: :bag_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:items) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "items",
             kind: :unpacked,
             label: :repeated,
             name: :items,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData}
           }}
        end

        def field_def("items") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "items",
             kind: :unpacked,
             label: :repeated,
             name: :items,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ReqIslandActivityTidyBag.BagData.ITemData}
           }}
        end

        []
      ),
      (
        def field_def(:drops) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "drops",
             kind: :packed,
             label: :repeated,
             name: :drops,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("drops") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "drops",
             kind: :packed,
             label: :repeated,
             name: :drops,
             tag: 4,
             type: :uint32
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
    def default(:bag_id) do
      {:ok, 0}
    end,
    def default(:items) do
      {:error, :no_default_value}
    end,
    def default(:drops) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end