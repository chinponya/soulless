# credo:disable-for-this-file
defmodule Soulless.Game.Lq.BillingGoods do
  @moduledoc false
  defstruct id: "", name: "", desc: "", icon: "", resource_id: 0, resource_count: 0, __uf__: []

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
        |> encode_id(msg)
        |> encode_name(msg)
        |> encode_desc(msg)
        |> encode_icon(msg)
        |> encode_resource_id(msg)
        |> encode_resource_count(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_id(acc, msg) do
        try do
          if msg.id == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_desc(acc, msg) do
        try do
          if msg.desc == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.desc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:desc, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_icon(acc, msg) do
        try do
          if msg.icon == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.icon)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:icon, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resource_id(acc, msg) do
        try do
          if msg.resource_id == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.resource_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resource_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_resource_count(acc, msg) do
        try do
          if msg.resource_count == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.resource_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resource_count, "invalid field value"),
                    __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.BillingGoods))
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
              {[id: delimited], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[desc: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[icon: delimited], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[resource_id: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[resource_count: value], rest}

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
        Soulless.Game.Lq.BillingGoods,
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
        1 => {:id, {:scalar, ""}, :string},
        2 => {:name, {:scalar, ""}, :string},
        3 => {:desc, {:scalar, ""}, :string},
        4 => {:icon, {:scalar, ""}, :string},
        5 => {:resource_id, {:scalar, 0}, :uint32},
        6 => {:resource_count, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        desc: {3, {:scalar, ""}, :string},
        icon: {4, {:scalar, ""}, :string},
        id: {1, {:scalar, ""}, :string},
        name: {2, {:scalar, ""}, :string},
        resource_count: {6, {:scalar, 0}, :uint32},
        resource_id: {5, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "id",
          kind: {:scalar, ""},
          label: :optional,
          name: :id,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "desc",
          kind: {:scalar, ""},
          label: :optional,
          name: :desc,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "icon",
          kind: {:scalar, ""},
          label: :optional,
          name: :icon,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "resourceId",
          kind: {:scalar, 0},
          label: :optional,
          name: :resource_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "resourceCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :resource_count,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "id",
             kind: {:scalar, ""},
             label: :optional,
             name: :id,
             tag: 1,
             type: :string
           }}
        end

        def field_def("id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "id",
             kind: {:scalar, ""},
             label: :optional,
             name: :id,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:desc) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "desc",
             kind: {:scalar, ""},
             label: :optional,
             name: :desc,
             tag: 3,
             type: :string
           }}
        end

        def field_def("desc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "desc",
             kind: {:scalar, ""},
             label: :optional,
             name: :desc,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:icon) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "icon",
             kind: {:scalar, ""},
             label: :optional,
             name: :icon,
             tag: 4,
             type: :string
           }}
        end

        def field_def("icon") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "icon",
             kind: {:scalar, ""},
             label: :optional,
             name: :icon,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:resource_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("resourceId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("resource_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_id,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:resource_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_count,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("resourceCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_count,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("resource_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resourceCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :resource_count,
             tag: 6,
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
    def default(:id) do
      {:ok, ""}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:desc) do
      {:ok, ""}
    end,
    def default(:icon) do
      {:ok, ""}
    end,
    def default(:resource_id) do
      {:ok, 0}
    end,
    def default(:resource_count) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end