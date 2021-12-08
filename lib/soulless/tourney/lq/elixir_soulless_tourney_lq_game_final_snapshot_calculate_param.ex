# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam do
  @moduledoc false
  (
    defstruct init_point: 0, jingsuanyuandian: 0, rank_points: [], __uf__: []

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
          |> encode_init_point(msg)
          |> encode_jingsuanyuandian(msg)
          |> encode_rank_points(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_init_point(acc, msg) do
          try do
            if msg.init_point == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.init_point)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:init_point, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_jingsuanyuandian(acc, msg) do
          try do
            if msg.jingsuanyuandian == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.jingsuanyuandian)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:jingsuanyuandian, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_rank_points(acc, msg) do
          try do
            case msg.rank_points do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\x1A",
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
              reraise Protox.EncodingError.new(:rank_points, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam))
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
                {[init_point: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[jingsuanyuandian: value], rest}

              {3, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   rank_points:
                     msg.rank_points ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[rank_points: msg.rank_points ++ [value]], rest}

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
          Soulless.Tourney.Lq.GameFinalSnapshot.CalculateParam,
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
        1 => {:init_point, {:scalar, 0}, :uint32},
        2 => {:jingsuanyuandian, {:scalar, 0}, :uint32},
        3 => {:rank_points, :packed, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        init_point: {1, {:scalar, 0}, :uint32},
        jingsuanyuandian: {2, {:scalar, 0}, :uint32},
        rank_points: {3, :packed, :int32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "initPoint",
          kind: {:scalar, 0},
          label: :optional,
          name: :init_point,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "jingsuanyuandian",
          kind: {:scalar, 0},
          label: :optional,
          name: :jingsuanyuandian,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankPoints",
          kind: :packed,
          label: :repeated,
          name: :rank_points,
          tag: 3,
          type: :int32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:init_point) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("initPoint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("init_point") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "initPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :init_point,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:jingsuanyuandian) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jingsuanyuandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :jingsuanyuandian,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("jingsuanyuandian") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jingsuanyuandian",
             kind: {:scalar, 0},
             label: :optional,
             name: :jingsuanyuandian,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:rank_points) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankPoints",
             kind: :packed,
             label: :repeated,
             name: :rank_points,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("rankPoints") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankPoints",
             kind: :packed,
             label: :repeated,
             name: :rank_points,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("rank_points") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankPoints",
             kind: :packed,
             label: :repeated,
             name: :rank_points,
             tag: 3,
             type: :int32
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
      def default(:init_point) do
        {:ok, 0}
      end,
      def default(:jingsuanyuandian) do
        {:ok, 0}
      end,
      def default(:rank_points) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end