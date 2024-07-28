# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountMahjongStatistic.HighestHuRecord do
  @moduledoc false
  defstruct fanshu: 0,
            doranum: 0,
            title: "",
            hands: [],
            ming: [],
            hupai: "",
            title_id: 0,
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
        |> encode_fanshu(msg)
        |> encode_doranum(msg)
        |> encode_title(msg)
        |> encode_hands(msg)
        |> encode_ming(msg)
        |> encode_hupai(msg)
        |> encode_title_id(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_fanshu(acc, msg) do
        try do
          if msg.fanshu == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.fanshu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fanshu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_doranum(acc, msg) do
        try do
          if msg.doranum == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.doranum)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:doranum, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_title(acc, msg) do
        try do
          if msg.title == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.title)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hands(acc, msg) do
        try do
          case msg.hands do
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
            reraise Protox.EncodingError.new(:hands, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ming(acc, msg) do
        try do
          case msg.ming do
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
            reraise Protox.EncodingError.new(:ming, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hupai(acc, msg) do
        try do
          if msg.hupai == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.hupai)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hupai, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_title_id(acc, msg) do
        try do
          if msg.title_id == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.title_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title_id, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountMahjongStatistic.HighestHuRecord))
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
              {[fanshu: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[doranum: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[title: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hands: msg.hands ++ [Protox.Decode.validate_string(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ming: msg.ming ++ [Protox.Decode.validate_string(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hupai: Protox.Decode.validate_string(delimited)], rest}

            {7, _, bytes} ->
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
        Soulless.Game.Lq.AccountMahjongStatistic.HighestHuRecord,
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
        1 => {:fanshu, {:scalar, 0}, :uint32},
        2 => {:doranum, {:scalar, 0}, :uint32},
        3 => {:title, {:scalar, ""}, :string},
        4 => {:hands, :unpacked, :string},
        5 => {:ming, :unpacked, :string},
        6 => {:hupai, {:scalar, ""}, :string},
        7 => {:title_id, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        doranum: {2, {:scalar, 0}, :uint32},
        fanshu: {1, {:scalar, 0}, :uint32},
        hands: {4, :unpacked, :string},
        hupai: {6, {:scalar, ""}, :string},
        ming: {5, :unpacked, :string},
        title: {3, {:scalar, ""}, :string},
        title_id: {7, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "fanshu",
          kind: {:scalar, 0},
          label: :optional,
          name: :fanshu,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "doranum",
          kind: {:scalar, 0},
          label: :optional,
          name: :doranum,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, ""},
          label: :optional,
          name: :title,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "hands",
          kind: :unpacked,
          label: :repeated,
          name: :hands,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "ming",
          kind: :unpacked,
          label: :repeated,
          name: :ming,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "hupai",
          kind: {:scalar, ""},
          label: :optional,
          name: :hupai,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleId",
          kind: {:scalar, 0},
          label: :optional,
          name: :title_id,
          tag: 7,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:fanshu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanshu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fanshu,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("fanshu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanshu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fanshu,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:doranum) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doranum",
             kind: {:scalar, 0},
             label: :optional,
             name: :doranum,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("doranum") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doranum",
             kind: {:scalar, 0},
             label: :optional,
             name: :doranum,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:title) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, ""},
             label: :optional,
             name: :title,
             tag: 3,
             type: :string
           }}
        end

        def field_def("title") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, ""},
             label: :optional,
             name: :title,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:hands) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 4,
             type: :string
           }}
        end

        def field_def("hands") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:ming) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 5,
             type: :string
           }}
        end

        def field_def("ming") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ming",
             kind: :unpacked,
             label: :repeated,
             name: :ming,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:hupai) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hupai",
             kind: {:scalar, ""},
             label: :optional,
             name: :hupai,
             tag: 6,
             type: :string
           }}
        end

        def field_def("hupai") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hupai",
             kind: {:scalar, ""},
             label: :optional,
             name: :hupai,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:title_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("titleId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("title_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleId",
             kind: {:scalar, 0},
             label: :optional,
             name: :title_id,
             tag: 7,
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
    def default(:fanshu) do
      {:ok, 0}
    end,
    def default(:doranum) do
      {:ok, 0}
    end,
    def default(:title) do
      {:ok, ""}
    end,
    def default(:hands) do
      {:error, :no_default_value}
    end,
    def default(:ming) do
      {:error, :no_default_value}
    end,
    def default(:hupai) do
      {:ok, ""}
    end,
    def default(:title_id) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
