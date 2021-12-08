# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResSyncGame do
  @moduledoc false
  (
    defstruct error: nil, is_end: false, step: 0, game_restore: nil, __uf__: []

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
          |> encode_is_end(msg)
          |> encode_step(msg)
          |> encode_game_restore(msg)
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
        defp encode_is_end(acc, msg) do
          try do
            if msg.is_end == false do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_bool(msg.is_end)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:is_end, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_step(acc, msg) do
          try do
            if msg.step == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.step)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:step, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_game_restore(acc, msg) do
          try do
            if msg.game_restore == nil do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.game_restore)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_restore, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ResSyncGame))
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
                     Protox.MergeMessage.merge(
                       msg.error,
                       Soulless.Game.Lq.Error.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_end: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[step: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_restore:
                     Protox.MergeMessage.merge(
                       msg.game_restore,
                       Soulless.Game.Lq.GameRestore.decode!(delimited)
                     )
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
          Soulless.Game.Lq.ResSyncGame,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:is_end, {:scalar, false}, :bool},
        3 => {:step, {:scalar, 0}, :uint32},
        4 => {:game_restore, {:scalar, nil}, {:message, Soulless.Game.Lq.GameRestore}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        game_restore: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.GameRestore}},
        is_end: {2, {:scalar, false}, :bool},
        step: {3, {:scalar, 0}, :uint32}
      }
    end

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
          json_name: "isEnd",
          kind: {:scalar, false},
          label: :optional,
          name: :is_end,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "step",
          kind: {:scalar, 0},
          label: :optional,
          name: :step,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameRestore",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_restore,
          tag: 4,
          type: {:message, Soulless.Game.Lq.GameRestore}
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
        def field_def(:is_end) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :is_end,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("isEnd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :is_end,
             tag: 2,
             type: :bool
           }}
        end

        def field_def("is_end") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :is_end,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:step) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "step",
             kind: {:scalar, 0},
             label: :optional,
             name: :step,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("step") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "step",
             kind: {:scalar, 0},
             label: :optional,
             name: :step,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:game_restore) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRestore",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_restore,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameRestore}
           }}
        end

        def field_def("gameRestore") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRestore",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_restore,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameRestore}
           }}
        end

        def field_def("game_restore") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRestore",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_restore,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameRestore}
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
      def default(:error) do
        {:ok, nil}
      end,
      def default(:is_end) do
        {:ok, false}
      end,
      def default(:step) do
        {:ok, 0}
      end,
      def default(:game_restore) do
        {:ok, nil}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end