# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResAuthGame do
  @moduledoc false
  (
    defstruct error: nil,
              players: [],
              seat_list: [],
              is_game_start: false,
              game_config: nil,
              ready_id_list: [],
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
          |> encode_players(msg)
          |> encode_seat_list(msg)
          |> encode_is_game_start(msg)
          |> encode_game_config(msg)
          |> encode_ready_id_list(msg)
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
        defp encode_players(acc, msg) do
          try do
            case msg.players do
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
              reraise Protox.EncodingError.new(:players, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_seat_list(acc, msg) do
          try do
            case msg.seat_list do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\x1A",
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
              reraise Protox.EncodingError.new(:seat_list, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_is_game_start(acc, msg) do
          try do
            if msg.is_game_start == false do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.is_game_start)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:is_game_start, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_game_config(acc, msg) do
          try do
            if msg.game_config == nil do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.game_config)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_config, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_ready_id_list(acc, msg) do
          try do
            case msg.ready_id_list do
              [] ->
                acc

              values ->
                [
                  acc,
                  "2",
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
              reraise Protox.EncodingError.new(:ready_id_list, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ResAuthGame))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[players: msg.players ++ [Soulless.Game.Lq.PlayerGameView.decode!(delimited)]],
                 rest}

              {3, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[seat_list: msg.seat_list ++ Protox.Decode.parse_repeated_uint32([], delimited)],
                 rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seat_list: msg.seat_list ++ [value]], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_game_start: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_config:
                     Protox.MergeMessage.merge(
                       msg.game_config,
                       Soulless.Game.Lq.GameConfig.decode!(delimited)
                     )
                 ], rest}

              {6, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   ready_id_list:
                     msg.ready_id_list ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ready_id_list: msg.ready_id_list ++ [value]], rest}

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
          Soulless.Game.Lq.ResAuthGame,
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
        2 => {:players, :unpacked, {:message, Soulless.Game.Lq.PlayerGameView}},
        3 => {:seat_list, :packed, :uint32},
        4 => {:is_game_start, {:scalar, false}, :bool},
        5 => {:game_config, {:scalar, nil}, {:message, Soulless.Game.Lq.GameConfig}},
        6 => {:ready_id_list, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        game_config: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.GameConfig}},
        is_game_start: {4, {:scalar, false}, :bool},
        players: {2, :unpacked, {:message, Soulless.Game.Lq.PlayerGameView}},
        ready_id_list: {6, :packed, :uint32},
        seat_list: {3, :packed, :uint32}
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
          json_name: "players",
          kind: :unpacked,
          label: :repeated,
          name: :players,
          tag: 2,
          type: {:message, Soulless.Game.Lq.PlayerGameView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "seatList",
          kind: :packed,
          label: :repeated,
          name: :seat_list,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isGameStart",
          kind: {:scalar, false},
          label: :optional,
          name: :is_game_start,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameConfig",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_config,
          tag: 5,
          type: {:message, Soulless.Game.Lq.GameConfig}
        },
        %{
          __struct__: Protox.Field,
          json_name: "readyIdList",
          kind: :packed,
          label: :repeated,
          name: :ready_id_list,
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
        def field_def(:players) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 2,
             type: {:message, Soulless.Game.Lq.PlayerGameView}
           }}
        end

        def field_def("players") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 2,
             type: {:message, Soulless.Game.Lq.PlayerGameView}
           }}
        end

        []
      ),
      (
        def field_def(:seat_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seatList",
             kind: :packed,
             label: :repeated,
             name: :seat_list,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("seatList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seatList",
             kind: :packed,
             label: :repeated,
             name: :seat_list,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("seat_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seatList",
             kind: :packed,
             label: :repeated,
             name: :seat_list,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:is_game_start) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGameStart",
             kind: {:scalar, false},
             label: :optional,
             name: :is_game_start,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("isGameStart") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGameStart",
             kind: {:scalar, false},
             label: :optional,
             name: :is_game_start,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("is_game_start") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isGameStart",
             kind: {:scalar, false},
             label: :optional,
             name: :is_game_start,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:game_config) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_config,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameConfig}
           }}
        end

        def field_def("gameConfig") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_config,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameConfig}
           }}
        end

        def field_def("game_config") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameConfig",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_config,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameConfig}
           }}
        end
      ),
      (
        def field_def(:ready_id_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyIdList",
             kind: :packed,
             label: :repeated,
             name: :ready_id_list,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("readyIdList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyIdList",
             kind: :packed,
             label: :repeated,
             name: :ready_id_list,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("ready_id_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "readyIdList",
             kind: :packed,
             label: :repeated,
             name: :ready_id_list,
             tag: 6,
             type: :uint32
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
      def default(:players) do
        {:error, :no_default_value}
      end,
      def default(:seat_list) do
        {:error, :no_default_value}
      end,
      def default(:is_game_start) do
        {:ok, false}
      end,
      def default(:game_config) do
        {:ok, nil}
      end,
      def default(:ready_id_list) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end