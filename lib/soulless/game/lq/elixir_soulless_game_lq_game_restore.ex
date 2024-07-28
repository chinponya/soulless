# credo:disable-for-this-file
defmodule Soulless.Game.Lq.GameRestore do
  @moduledoc false
  defstruct snapshot: nil,
            actions: [],
            passed_waiting_time: 0,
            game_state: 0,
            start_time: 0,
            last_pause_time_ms: 0,
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
        |> encode_snapshot(msg)
        |> encode_actions(msg)
        |> encode_passed_waiting_time(msg)
        |> encode_game_state(msg)
        |> encode_start_time(msg)
        |> encode_last_pause_time_ms(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_snapshot(acc, msg) do
        try do
          if msg.snapshot == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.snapshot)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:snapshot, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_actions(acc, msg) do
        try do
          case msg.actions do
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
            reraise Protox.EncodingError.new(:actions, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_passed_waiting_time(acc, msg) do
        try do
          if msg.passed_waiting_time == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.passed_waiting_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:passed_waiting_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_game_state(acc, msg) do
        try do
          if msg.game_state == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.game_state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_start_time(acc, msg) do
        try do
          if msg.start_time == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_last_pause_time_ms(acc, msg) do
        try do
          if msg.last_pause_time_ms == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.last_pause_time_ms)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:last_pause_time_ms, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.GameRestore))
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
                 snapshot:
                   Protox.MergeMessage.merge(
                     msg.snapshot,
                     Soulless.Game.Lq.GameSnapshot.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[actions: msg.actions ++ [Soulless.Game.Lq.ActionPrototype.decode!(delimited)]],
               rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[passed_waiting_time: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[game_state: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[last_pause_time_ms: value], rest}

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
        Soulless.Game.Lq.GameRestore,
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
        1 => {:snapshot, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSnapshot}},
        2 => {:actions, :unpacked, {:message, Soulless.Game.Lq.ActionPrototype}},
        3 => {:passed_waiting_time, {:scalar, 0}, :uint32},
        4 => {:game_state, {:scalar, 0}, :uint32},
        5 => {:start_time, {:scalar, 0}, :uint32},
        6 => {:last_pause_time_ms, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        actions: {2, :unpacked, {:message, Soulless.Game.Lq.ActionPrototype}},
        game_state: {4, {:scalar, 0}, :uint32},
        last_pause_time_ms: {6, {:scalar, 0}, :uint32},
        passed_waiting_time: {3, {:scalar, 0}, :uint32},
        snapshot: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSnapshot}},
        start_time: {5, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "snapshot",
          kind: {:scalar, nil},
          label: :optional,
          name: :snapshot,
          tag: 1,
          type: {:message, Soulless.Game.Lq.GameSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "actions",
          kind: :unpacked,
          label: :repeated,
          name: :actions,
          tag: 2,
          type: {:message, Soulless.Game.Lq.ActionPrototype}
        },
        %{
          __struct__: Protox.Field,
          json_name: "passedWaitingTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :passed_waiting_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameState",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_state,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastPauseTimeMs",
          kind: {:scalar, 0},
          label: :optional,
          name: :last_pause_time_ms,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:snapshot) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "snapshot",
             kind: {:scalar, nil},
             label: :optional,
             name: :snapshot,
             tag: 1,
             type: {:message, Soulless.Game.Lq.GameSnapshot}
           }}
        end

        def field_def("snapshot") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "snapshot",
             kind: {:scalar, nil},
             label: :optional,
             name: :snapshot,
             tag: 1,
             type: {:message, Soulless.Game.Lq.GameSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:actions) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "actions",
             kind: :unpacked,
             label: :repeated,
             name: :actions,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ActionPrototype}
           }}
        end

        def field_def("actions") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "actions",
             kind: :unpacked,
             label: :repeated,
             name: :actions,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ActionPrototype}
           }}
        end

        []
      ),
      (
        def field_def(:passed_waiting_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passedWaitingTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :passed_waiting_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("passedWaitingTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passedWaitingTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :passed_waiting_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("passed_waiting_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passedWaitingTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :passed_waiting_time,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameState",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_state,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("gameState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameState",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_state,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("game_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameState",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_state,
             tag: 4,
             type: :uint32
           }}
        end
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
             tag: 5,
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
             tag: 5,
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
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:last_pause_time_ms) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPauseTimeMs",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_pause_time_ms,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("lastPauseTimeMs") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPauseTimeMs",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_pause_time_ms,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("last_pause_time_ms") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPauseTimeMs",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_pause_time_ms,
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
    def default(:snapshot) do
      {:ok, nil}
    end,
    def default(:actions) do
      {:error, :no_default_value}
    end,
    def default(:passed_waiting_time) do
      {:ok, 0}
    end,
    def default(:game_state) do
      {:ok, 0}
    end,
    def default(:start_time) do
      {:ok, 0}
    end,
    def default(:last_pause_time_ms) do
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
