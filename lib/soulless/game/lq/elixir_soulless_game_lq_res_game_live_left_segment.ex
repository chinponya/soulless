# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResGameLiveLeftSegment do
  @moduledoc false
  defstruct error: nil,
            live_state: 0,
            segments: [],
            now_millisecond: 0,
            segment_end_millisecond: 0,
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
        |> encode_error(msg)
        |> encode_live_state(msg)
        |> encode_segments(msg)
        |> encode_now_millisecond(msg)
        |> encode_segment_end_millisecond(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_live_state(acc, msg) do
        try do
          if msg.live_state == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.live_state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:live_state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_segments(acc, msg) do
        try do
          case msg.segments do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:segments, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_now_millisecond(acc, msg) do
        try do
          if msg.now_millisecond == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.now_millisecond)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:now_millisecond, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_segment_end_millisecond(acc, msg) do
        try do
          if msg.segment_end_millisecond == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.segment_end_millisecond)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:segment_end_millisecond, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResGameLiveLeftSegment))
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

              {[
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[live_state: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 segments:
                   msg.segments ++ [Soulless.Game.Lq.GameLiveSegmentUri.decode!(delimited)]
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[now_millisecond: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[segment_end_millisecond: value], rest}

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
        Soulless.Game.Lq.ResGameLiveLeftSegment,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:live_state, {:scalar, 0}, :uint32},
        4 => {:segments, :unpacked, {:message, Soulless.Game.Lq.GameLiveSegmentUri}},
        5 => {:now_millisecond, {:scalar, 0}, :uint32},
        6 => {:segment_end_millisecond, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        live_state: {2, {:scalar, 0}, :uint32},
        now_millisecond: {5, {:scalar, 0}, :uint32},
        segment_end_millisecond: {6, {:scalar, 0}, :uint32},
        segments: {4, :unpacked, {:message, Soulless.Game.Lq.GameLiveSegmentUri}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Game.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "liveState",
          kind: {:scalar, 0},
          label: :optional,
          name: :live_state,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "segments",
          kind: :unpacked,
          label: :repeated,
          name: :segments,
          tag: 4,
          type: {:message, Soulless.Game.Lq.GameLiveSegmentUri}
        },
        %{
          __struct__: Protox.Field,
          json_name: "nowMillisecond",
          kind: {:scalar, 0},
          label: :optional,
          name: :now_millisecond,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "segmentEndMillisecond",
          kind: {:scalar, 0},
          label: :optional,
          name: :segment_end_millisecond,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:live_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liveState",
             kind: {:scalar, 0},
             label: :optional,
             name: :live_state,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("liveState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liveState",
             kind: {:scalar, 0},
             label: :optional,
             name: :live_state,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("live_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liveState",
             kind: {:scalar, 0},
             label: :optional,
             name: :live_state,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:segments) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "segments",
             kind: :unpacked,
             label: :repeated,
             name: :segments,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameLiveSegmentUri}
           }}
        end

        def field_def("segments") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "segments",
             kind: :unpacked,
             label: :repeated,
             name: :segments,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameLiveSegmentUri}
           }}
        end

        []
      ),
      (
        def field_def(:now_millisecond) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nowMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :now_millisecond,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("nowMillisecond") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nowMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :now_millisecond,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("now_millisecond") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nowMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :now_millisecond,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:segment_end_millisecond) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "segmentEndMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :segment_end_millisecond,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("segmentEndMillisecond") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "segmentEndMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :segment_end_millisecond,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("segment_end_millisecond") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "segmentEndMillisecond",
             kind: {:scalar, 0},
             label: :optional,
             name: :segment_end_millisecond,
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
    def default(:error) do
      {:ok, nil}
    end,
    def default(:live_state) do
      {:ok, 0}
    end,
    def default(:segments) do
      {:error, :no_default_value}
    end,
    def default(:now_millisecond) do
      {:ok, 0}
    end,
    def default(:segment_end_millisecond) do
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
