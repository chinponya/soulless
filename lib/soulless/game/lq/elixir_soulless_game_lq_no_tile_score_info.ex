# credo:disable-for-this-file
defmodule Soulless.Game.Lq.NoTileScoreInfo do
  @moduledoc false
  defstruct seat: 0,
            old_scores: [],
            delta_scores: [],
            hand: [],
            ming: [],
            doras: [],
            score: 0,
            taxes: [],
            lines: [],
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
        |> encode_old_scores(msg)
        |> encode_delta_scores(msg)
        |> encode_hand(msg)
        |> encode_ming(msg)
        |> encode_doras(msg)
        |> encode_score(msg)
        |> encode_taxes(msg)
        |> encode_lines(msg)
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
      defp encode_old_scores(acc, msg) do
        try do
          case msg.old_scores do
            [] ->
              acc

            values ->
              [
                acc,
                "\x12",
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
            reraise Protox.EncodingError.new(:old_scores, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_delta_scores(acc, msg) do
        try do
          case msg.delta_scores do
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
            reraise Protox.EncodingError.new(:delta_scores, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hand(acc, msg) do
        try do
          case msg.hand do
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
            reraise Protox.EncodingError.new(:hand, "invalid field value"), __STACKTRACE__
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
      defp encode_score(acc, msg) do
        try do
          if msg.score == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.score)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:score, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_taxes(acc, msg) do
        try do
          case msg.taxes do
            [] ->
              acc

            values ->
              [
                acc,
                "B",
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
            reraise Protox.EncodingError.new(:taxes, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_lines(acc, msg) do
        try do
          case msg.lines do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_string(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:lines, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.NoTileScoreInfo))
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

            {2, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[old_scores: msg.old_scores ++ Protox.Decode.parse_repeated_int32([], delimited)],
               rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[old_scores: msg.old_scores ++ [value]], rest}

            {3, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 delta_scores:
                   msg.delta_scores ++ Protox.Decode.parse_repeated_int32([], delimited)
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[delta_scores: msg.delta_scores ++ [value]], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hand: msg.hand ++ [Protox.Decode.validate_string(delimited)]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[ming: msg.ming ++ [Protox.Decode.validate_string(delimited)]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[doras: msg.doras ++ [Protox.Decode.validate_string(delimited)]], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[score: value], rest}

            {8, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[taxes: msg.taxes ++ Protox.Decode.parse_repeated_int32([], delimited)], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[taxes: msg.taxes ++ [value]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[lines: msg.lines ++ [Protox.Decode.validate_string(delimited)]], rest}

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
        Soulless.Game.Lq.NoTileScoreInfo,
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
        2 => {:old_scores, :packed, :int32},
        3 => {:delta_scores, :packed, :int32},
        4 => {:hand, :unpacked, :string},
        5 => {:ming, :unpacked, :string},
        6 => {:doras, :unpacked, :string},
        7 => {:score, {:scalar, 0}, :uint32},
        8 => {:taxes, :packed, :int32},
        9 => {:lines, :unpacked, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        delta_scores: {3, :packed, :int32},
        doras: {6, :unpacked, :string},
        hand: {4, :unpacked, :string},
        lines: {9, :unpacked, :string},
        ming: {5, :unpacked, :string},
        old_scores: {2, :packed, :int32},
        score: {7, {:scalar, 0}, :uint32},
        seat: {1, {:scalar, 0}, :uint32},
        taxes: {8, :packed, :int32}
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
          json_name: "oldScores",
          kind: :packed,
          label: :repeated,
          name: :old_scores,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "deltaScores",
          kind: :packed,
          label: :repeated,
          name: :delta_scores,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hand",
          kind: :unpacked,
          label: :repeated,
          name: :hand,
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
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "score",
          kind: {:scalar, 0},
          label: :optional,
          name: :score,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "taxes",
          kind: :packed,
          label: :repeated,
          name: :taxes,
          tag: 8,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "lines",
          kind: :unpacked,
          label: :repeated,
          name: :lines,
          tag: 9,
          type: :string
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
        def field_def(:old_scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("oldScores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("old_scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:delta_scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("deltaScores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("delta_scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:hand) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
             tag: 4,
             type: :string
           }}
        end

        def field_def("hand") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hand",
             kind: :unpacked,
             label: :repeated,
             name: :hand,
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
        def field_def(:score) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("score") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 7,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:taxes) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "taxes",
             kind: :packed,
             label: :repeated,
             name: :taxes,
             tag: 8,
             type: :int32
           }}
        end

        def field_def("taxes") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "taxes",
             kind: :packed,
             label: :repeated,
             name: :taxes,
             tag: 8,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:lines) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lines",
             kind: :unpacked,
             label: :repeated,
             name: :lines,
             tag: 9,
             type: :string
           }}
        end

        def field_def("lines") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lines",
             kind: :unpacked,
             label: :repeated,
             name: :lines,
             tag: 9,
             type: :string
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
    def default(:old_scores) do
      {:error, :no_default_value}
    end,
    def default(:delta_scores) do
      {:error, :no_default_value}
    end,
    def default(:hand) do
      {:error, :no_default_value}
    end,
    def default(:ming) do
      {:error, :no_default_value}
    end,
    def default(:doras) do
      {:error, :no_default_value}
    end,
    def default(:score) do
      {:ok, 0}
    end,
    def default(:taxes) do
      {:error, :no_default_value}
    end,
    def default(:lines) do
      {:error, :no_default_value}
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
