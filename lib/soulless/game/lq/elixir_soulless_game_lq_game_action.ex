# credo:disable-for-this-file
defmodule Soulless.Game.Lq.GameAction do
  @moduledoc false
  defstruct passed: 0,
            type: 0,
            result: nil,
            user_input: nil,
            user_event: nil,
            game_event: 0,
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
        |> encode_passed(msg)
        |> encode_type(msg)
        |> encode_result(msg)
        |> encode_user_input(msg)
        |> encode_user_event(msg)
        |> encode_game_event(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_passed(acc, msg) do
        try do
          if msg.passed == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.passed)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:passed, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type(acc, msg) do
        try do
          if msg.type == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_result(acc, msg) do
        try do
          if msg.result == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.result)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:result, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_user_input(acc, msg) do
        try do
          if msg.user_input == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.user_input)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:user_input, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_user_event(acc, msg) do
        try do
          if msg.user_event == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.user_event)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:user_event, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_event(acc, msg) do
        try do
          if msg.game_event == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.game_event)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_event, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.GameAction))
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
              {[passed: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 result:
                   Protox.MergeMessage.merge(
                     msg.result,
                     Soulless.Game.Lq.Wrapper.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 user_input:
                   Protox.MergeMessage.merge(
                     msg.user_input,
                     Soulless.Game.Lq.GameUserInput.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 user_event:
                   Protox.MergeMessage.merge(
                     msg.user_event,
                     Soulless.Game.Lq.GameUserEvent.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[game_event: value], rest}

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
        Soulless.Game.Lq.GameAction,
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
        1 => {:passed, {:scalar, 0}, :uint32},
        2 => {:type, {:scalar, 0}, :uint32},
        3 => {:result, {:scalar, nil}, {:message, Soulless.Game.Lq.Wrapper}},
        4 => {:user_input, {:scalar, nil}, {:message, Soulless.Game.Lq.GameUserInput}},
        5 => {:user_event, {:scalar, nil}, {:message, Soulless.Game.Lq.GameUserEvent}},
        6 => {:game_event, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        game_event: {6, {:scalar, 0}, :uint32},
        passed: {1, {:scalar, 0}, :uint32},
        result: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.Wrapper}},
        type: {2, {:scalar, 0}, :uint32},
        user_event: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.GameUserEvent}},
        user_input: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.GameUserInput}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "passed",
          kind: {:scalar, 0},
          label: :optional,
          name: :passed,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "result",
          kind: {:scalar, nil},
          label: :optional,
          name: :result,
          tag: 3,
          type: {:message, Soulless.Game.Lq.Wrapper}
        },
        %{
          __struct__: Protox.Field,
          json_name: "userInput",
          kind: {:scalar, nil},
          label: :optional,
          name: :user_input,
          tag: 4,
          type: {:message, Soulless.Game.Lq.GameUserInput}
        },
        %{
          __struct__: Protox.Field,
          json_name: "userEvent",
          kind: {:scalar, nil},
          label: :optional,
          name: :user_event,
          tag: 5,
          type: {:message, Soulless.Game.Lq.GameUserEvent}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameEvent",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_event,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:passed) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passed",
             kind: {:scalar, 0},
             label: :optional,
             name: :passed,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("passed") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "passed",
             kind: {:scalar, 0},
             label: :optional,
             name: :passed,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:result) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, nil},
             label: :optional,
             name: :result,
             tag: 3,
             type: {:message, Soulless.Game.Lq.Wrapper}
           }}
        end

        def field_def("result") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, nil},
             label: :optional,
             name: :result,
             tag: 3,
             type: {:message, Soulless.Game.Lq.Wrapper}
           }}
        end

        []
      ),
      (
        def field_def(:user_input) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userInput",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_input,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameUserInput}
           }}
        end

        def field_def("userInput") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userInput",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_input,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameUserInput}
           }}
        end

        def field_def("user_input") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userInput",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_input,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameUserInput}
           }}
        end
      ),
      (
        def field_def(:user_event) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userEvent",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_event,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameUserEvent}
           }}
        end

        def field_def("userEvent") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userEvent",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_event,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameUserEvent}
           }}
        end

        def field_def("user_event") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "userEvent",
             kind: {:scalar, nil},
             label: :optional,
             name: :user_event,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameUserEvent}
           }}
        end
      ),
      (
        def field_def(:game_event) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEvent",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_event,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("gameEvent") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEvent",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_event,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("game_event") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameEvent",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_event,
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
    def default(:passed) do
      {:ok, 0}
    end,
    def default(:type) do
      {:ok, 0}
    end,
    def default(:result) do
      {:ok, nil}
    end,
    def default(:user_input) do
      {:ok, nil}
    end,
    def default(:user_event) do
      {:ok, nil}
    end,
    def default(:game_event) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end