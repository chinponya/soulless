# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer do
  @moduledoc false
  defstruct seat: 0,
            total_point: 0,
            part_point_1: 0,
            part_point_2: 0,
            grading_score: 0,
            gold: 0,
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
        |> encode_total_point(msg)
        |> encode_part_point_1(msg)
        |> encode_part_point_2(msg)
        |> encode_grading_score(msg)
        |> encode_gold(msg)
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
      defp encode_total_point(acc, msg) do
        try do
          if msg.total_point == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_int32(msg.total_point)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:total_point, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_part_point_1(acc, msg) do
        try do
          if msg.part_point_1 == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_int32(msg.part_point_1)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:part_point_1, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_part_point_2(acc, msg) do
        try do
          if msg.part_point_2 == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_int32(msg.part_point_2)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:part_point_2, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_grading_score(acc, msg) do
        try do
          if msg.grading_score == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_int32(msg.grading_score)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:grading_score, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_gold(acc, msg) do
        try do
          if msg.gold == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_int32(msg.gold)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gold, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer))
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
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[total_point: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[part_point_1: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[part_point_2: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[grading_score: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[gold: value], rest}

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
        Soulless.Tourney.Lq.GameFinalSnapshot.FinalPlayer,
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
        2 => {:total_point, {:scalar, 0}, :int32},
        3 => {:part_point_1, {:scalar, 0}, :int32},
        4 => {:part_point_2, {:scalar, 0}, :int32},
        5 => {:grading_score, {:scalar, 0}, :int32},
        6 => {:gold, {:scalar, 0}, :int32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        gold: {6, {:scalar, 0}, :int32},
        grading_score: {5, {:scalar, 0}, :int32},
        part_point_1: {3, {:scalar, 0}, :int32},
        part_point_2: {4, {:scalar, 0}, :int32},
        seat: {1, {:scalar, 0}, :uint32},
        total_point: {2, {:scalar, 0}, :int32}
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
          json_name: "totalPoint",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_point,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "partPoint1",
          kind: {:scalar, 0},
          label: :optional,
          name: :part_point_1,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "partPoint2",
          kind: {:scalar, 0},
          label: :optional,
          name: :part_point_2,
          tag: 4,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gradingScore",
          kind: {:scalar, 0},
          label: :optional,
          name: :grading_score,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gold",
          kind: {:scalar, 0},
          label: :optional,
          name: :gold,
          tag: 6,
          type: :int32
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
        def field_def(:total_point) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_point,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("totalPoint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_point,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("total_point") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalPoint",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_point,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:part_point_1) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint1",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_1,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("partPoint1") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint1",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_1,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("part_point_1") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint1",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_1,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:part_point_2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint2",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_2,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("partPoint2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint2",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_2,
             tag: 4,
             type: :int32
           }}
        end

        def field_def("part_point_2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partPoint2",
             kind: {:scalar, 0},
             label: :optional,
             name: :part_point_2,
             tag: 4,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:grading_score) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gradingScore",
             kind: {:scalar, 0},
             label: :optional,
             name: :grading_score,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("gradingScore") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gradingScore",
             kind: {:scalar, 0},
             label: :optional,
             name: :grading_score,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("grading_score") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gradingScore",
             kind: {:scalar, 0},
             label: :optional,
             name: :grading_score,
             tag: 5,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:gold) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gold",
             kind: {:scalar, 0},
             label: :optional,
             name: :gold,
             tag: 6,
             type: :int32
           }}
        end

        def field_def("gold") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gold",
             kind: {:scalar, 0},
             label: :optional,
             name: :gold,
             tag: 6,
             type: :int32
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
    def default(:seat) do
      {:ok, 0}
    end,
    def default(:total_point) do
      {:ok, 0}
    end,
    def default(:part_point_1) do
      {:ok, 0}
    end,
    def default(:part_point_2) do
      {:ok, 0}
    end,
    def default(:grading_score) do
      {:ok, 0}
    end,
    def default(:gold) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end