# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ActivitySimulationGameRecord do
  @moduledoc false
  defstruct round: 0, seats: [], uuid: "", start_time: 0, scores: [], messages: [], __uf__: []

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
        |> encode_round(msg)
        |> encode_seats(msg)
        |> encode_uuid(msg)
        |> encode_start_time(msg)
        |> encode_scores(msg)
        |> encode_messages(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_round(acc, msg) do
        try do
          if msg.round == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.round)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:round, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_seats(acc, msg) do
        try do
          case msg.seats do
            [] ->
              acc

            values ->
              [
                acc,
                "\x12",
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
            reraise Protox.EncodingError.new(:seats, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_uuid(acc, msg) do
        try do
          if msg.uuid == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.uuid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:uuid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_start_time(acc, msg) do
        try do
          if msg.start_time == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_scores(acc, msg) do
        try do
          case msg.scores do
            [] ->
              acc

            values ->
              [
                acc,
                "*",
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
            reraise Protox.EncodingError.new(:scores, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_messages(acc, msg) do
        try do
          case msg.messages do
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
            reraise Protox.EncodingError.new(:messages, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ActivitySimulationGameRecord))
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
              {[round: value], rest}

            {2, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[seats: msg.seats ++ Protox.Decode.parse_repeated_uint32([], delimited)], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[seats: msg.seats ++ [value]], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[uuid: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {5, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[scores: msg.scores ++ Protox.Decode.parse_repeated_int32([], delimited)], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_int32(bytes)
              {[scores: msg.scores ++ [value]], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 messages:
                   msg.messages ++
                     [Soulless.Game.Lq.ActivitySimulationGameRecordMessage.decode!(delimited)]
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
        Soulless.Game.Lq.ActivitySimulationGameRecord,
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
        1 => {:round, {:scalar, 0}, :uint32},
        2 => {:seats, :packed, :uint32},
        3 => {:uuid, {:scalar, ""}, :string},
        4 => {:start_time, {:scalar, 0}, :uint32},
        5 => {:scores, :packed, :int32},
        6 =>
          {:messages, :unpacked, {:message, Soulless.Game.Lq.ActivitySimulationGameRecordMessage}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        messages:
          {6, :unpacked, {:message, Soulless.Game.Lq.ActivitySimulationGameRecordMessage}},
        round: {1, {:scalar, 0}, :uint32},
        scores: {5, :packed, :int32},
        seats: {2, :packed, :uint32},
        start_time: {4, {:scalar, 0}, :uint32},
        uuid: {3, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "round",
          kind: {:scalar, 0},
          label: :optional,
          name: :round,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "seats",
          kind: :packed,
          label: :repeated,
          name: :seats,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "uuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :uuid,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "scores",
          kind: :packed,
          label: :repeated,
          name: :scores,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "messages",
          kind: :unpacked,
          label: :repeated,
          name: :messages,
          tag: 6,
          type: {:message, Soulless.Game.Lq.ActivitySimulationGameRecordMessage}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:round) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "round",
             kind: {:scalar, 0},
             label: :optional,
             name: :round,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("round") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "round",
             kind: {:scalar, 0},
             label: :optional,
             name: :round,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:seats) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seats",
             kind: :packed,
             label: :repeated,
             name: :seats,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("seats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seats",
             kind: :packed,
             label: :repeated,
             name: :seats,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 3,
             type: :string
           }}
        end

        def field_def("uuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("startTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:messages) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "messages",
             kind: :unpacked,
             label: :repeated,
             name: :messages,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ActivitySimulationGameRecordMessage}
           }}
        end

        def field_def("messages") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "messages",
             kind: :unpacked,
             label: :repeated,
             name: :messages,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ActivitySimulationGameRecordMessage}
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
    def default(:round) do
      {:ok, 0}
    end,
    def default(:seats) do
      {:error, :no_default_value}
    end,
    def default(:uuid) do
      {:ok, ""}
    end,
    def default(:start_time) do
      {:ok, 0}
    end,
    def default(:scores) do
      {:error, :no_default_value}
    end,
    def default(:messages) do
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
