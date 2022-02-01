# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordTingPaiInfo do
  @moduledoc false
  defstruct tile: "",
            haveyi: false,
            yiman: false,
            count: 0,
            fu: 0,
            biao_dora_count: 0,
            yiman_zimo: false,
            count_zimo: 0,
            fu_zimo: 0,
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
        |> encode_tile(msg)
        |> encode_haveyi(msg)
        |> encode_yiman(msg)
        |> encode_count(msg)
        |> encode_fu(msg)
        |> encode_biao_dora_count(msg)
        |> encode_yiman_zimo(msg)
        |> encode_count_zimo(msg)
        |> encode_fu_zimo(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_tile(acc, msg) do
        try do
          if msg.tile == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.tile)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tile, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_haveyi(acc, msg) do
        try do
          if msg.haveyi == false do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_bool(msg.haveyi)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:haveyi, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_yiman(acc, msg) do
        try do
          if msg.yiman == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.yiman)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:yiman, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_count(acc, msg) do
        try do
          if msg.count == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fu(acc, msg) do
        try do
          if msg.fu == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.fu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_biao_dora_count(acc, msg) do
        try do
          if msg.biao_dora_count == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.biao_dora_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:biao_dora_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_yiman_zimo(acc, msg) do
        try do
          if msg.yiman_zimo == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.yiman_zimo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:yiman_zimo, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_count_zimo(acc, msg) do
        try do
          if msg.count_zimo == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.count_zimo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:count_zimo, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_fu_zimo(acc, msg) do
        try do
          if msg.fu_zimo == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.fu_zimo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:fu_zimo, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordTingPaiInfo))
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
              {[tile: delimited], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[haveyi: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[yiman: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[count: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fu: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[biao_dora_count: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[yiman_zimo: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[count_zimo: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[fu_zimo: value], rest}

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
        Soulless.Game.Lq.RecordTingPaiInfo,
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
        1 => {:tile, {:scalar, ""}, :string},
        2 => {:haveyi, {:scalar, false}, :bool},
        3 => {:yiman, {:scalar, false}, :bool},
        4 => {:count, {:scalar, 0}, :uint32},
        5 => {:fu, {:scalar, 0}, :uint32},
        6 => {:biao_dora_count, {:scalar, 0}, :uint32},
        7 => {:yiman_zimo, {:scalar, false}, :bool},
        8 => {:count_zimo, {:scalar, 0}, :uint32},
        9 => {:fu_zimo, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        biao_dora_count: {6, {:scalar, 0}, :uint32},
        count: {4, {:scalar, 0}, :uint32},
        count_zimo: {8, {:scalar, 0}, :uint32},
        fu: {5, {:scalar, 0}, :uint32},
        fu_zimo: {9, {:scalar, 0}, :uint32},
        haveyi: {2, {:scalar, false}, :bool},
        tile: {1, {:scalar, ""}, :string},
        yiman: {3, {:scalar, false}, :bool},
        yiman_zimo: {7, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "tile",
          kind: {:scalar, ""},
          label: :optional,
          name: :tile,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "haveyi",
          kind: {:scalar, false},
          label: :optional,
          name: :haveyi,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "yiman",
          kind: {:scalar, false},
          label: :optional,
          name: :yiman,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "count",
          kind: {:scalar, 0},
          label: :optional,
          name: :count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fu",
          kind: {:scalar, 0},
          label: :optional,
          name: :fu,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "biaoDoraCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :biao_dora_count,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "yimanZimo",
          kind: {:scalar, false},
          label: :optional,
          name: :yiman_zimo,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "countZimo",
          kind: {:scalar, 0},
          label: :optional,
          name: :count_zimo,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fuZimo",
          kind: {:scalar, 0},
          label: :optional,
          name: :fu_zimo,
          tag: 9,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:tile) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tile",
             kind: {:scalar, ""},
             label: :optional,
             name: :tile,
             tag: 1,
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
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:haveyi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveyi",
             kind: {:scalar, false},
             label: :optional,
             name: :haveyi,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("haveyi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "haveyi",
             kind: {:scalar, false},
             label: :optional,
             name: :haveyi,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:yiman) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("yiman") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yiman",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman,
             tag: 3,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:fu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("fu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fu",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:biao_dora_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("biaoDoraCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("biao_dora_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "biaoDoraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :biao_dora_count,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:yiman_zimo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yimanZimo",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman_zimo,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("yimanZimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yimanZimo",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman_zimo,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("yiman_zimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "yimanZimo",
             kind: {:scalar, false},
             label: :optional,
             name: :yiman_zimo,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:count_zimo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "countZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :count_zimo,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("countZimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "countZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :count_zimo,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("count_zimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "countZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :count_zimo,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:fu_zimo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_zimo,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("fuZimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_zimo,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("fu_zimo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fuZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :fu_zimo,
             tag: 9,
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
    def default(:tile) do
      {:ok, ""}
    end,
    def default(:haveyi) do
      {:ok, false}
    end,
    def default(:yiman) do
      {:ok, false}
    end,
    def default(:count) do
      {:ok, 0}
    end,
    def default(:fu) do
      {:ok, 0}
    end,
    def default(:biao_dora_count) do
      {:ok, 0}
    end,
    def default(:yiman_zimo) do
      {:ok, false}
    end,
    def default(:count_zimo) do
      {:ok, 0}
    end,
    def default(:fu_zimo) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end