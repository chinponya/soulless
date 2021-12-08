# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.AccountStatisticData do
  @moduledoc false
  (
    defstruct mahjong_category: 0, game_category: 0, statistic: nil, game_type: 0, __uf__: []

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
          |> encode_mahjong_category(msg)
          |> encode_game_category(msg)
          |> encode_statistic(msg)
          |> encode_game_type(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_mahjong_category(acc, msg) do
          try do
            if msg.mahjong_category == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.mahjong_category)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:mahjong_category, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_game_category(acc, msg) do
          try do
            if msg.game_category == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.game_category)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_category, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_statistic(acc, msg) do
          try do
            if msg.statistic == nil do
              acc
            else
              [acc, "\x1A", Protox.Encode.encode_message(msg.statistic)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:statistic, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_game_type(acc, msg) do
          try do
            if msg.game_type == 0 do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.game_type)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_type, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.AccountStatisticData))
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
                {[mahjong_category: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[game_category: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   statistic:
                     Protox.MergeMessage.merge(
                       msg.statistic,
                       Soulless.Tourney.Lq.AccountMahjongStatistic.decode!(delimited)
                     )
                 ], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[game_type: value], rest}

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
          Soulless.Tourney.Lq.AccountStatisticData,
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
        1 => {:mahjong_category, {:scalar, 0}, :uint32},
        2 => {:game_category, {:scalar, 0}, :uint32},
        3 =>
          {:statistic, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountMahjongStatistic}},
        4 => {:game_type, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        game_category: {2, {:scalar, 0}, :uint32},
        game_type: {4, {:scalar, 0}, :uint32},
        mahjong_category: {1, {:scalar, 0}, :uint32},
        statistic: {3, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountMahjongStatistic}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mahjongCategory",
          kind: {:scalar, 0},
          label: :optional,
          name: :mahjong_category,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameCategory",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_category,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "statistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :statistic,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.AccountMahjongStatistic}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameType",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_type,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:mahjong_category) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mahjongCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :mahjong_category,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mahjongCategory") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mahjongCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :mahjong_category,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mahjong_category") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mahjongCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :mahjong_category,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_category) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_category,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("gameCategory") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_category,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("game_category") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameCategory",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_category,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:statistic) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :statistic,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountMahjongStatistic}
           }}
        end

        def field_def("statistic") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "statistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :statistic,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountMahjongStatistic}
           }}
        end

        []
      ),
      (
        def field_def(:game_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameType",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_type,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("gameType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameType",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_type,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("game_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameType",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_type,
             tag: 4,
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
      def default(:mahjong_category) do
        {:ok, 0}
      end,
      def default(:game_category) do
        {:ok, 0}
      end,
      def default(:statistic) do
        {:ok, nil}
      end,
      def default(:game_type) do
        {:ok, 0}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end