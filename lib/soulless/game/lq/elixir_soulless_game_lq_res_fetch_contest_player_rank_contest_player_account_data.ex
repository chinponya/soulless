# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData do
  @moduledoc false
  defstruct total_game_count: 0, recent_games: [], highest_series_points: [], __uf__: []

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
        |> encode_total_game_count(msg)
        |> encode_recent_games(msg)
        |> encode_highest_series_points(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_total_game_count(acc, msg) do
        try do
          if msg.total_game_count == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.total_game_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:total_game_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_recent_games(acc, msg) do
        try do
          case msg.recent_games do
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
            reraise Protox.EncodingError.new(:recent_games, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_highest_series_points(acc, msg) do
        try do
          case msg.highest_series_points do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:highest_series_points, "invalid field value"),
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
          parse_key_value(
            bytes,
            struct(Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData)
          )
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
              {[total_game_count: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 recent_games:
                   msg.recent_games ++
                     [
                       Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult.decode!(
                         delimited
                       )
                     ]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 highest_series_points:
                   msg.highest_series_points ++
                     [
                       Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult.decode!(
                         delimited
                       )
                     ]
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
        Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData,
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
        1 => {:total_game_count, {:scalar, 0}, :uint32},
        2 =>
          {:recent_games, :unpacked,
           {:message,
            Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}},
        3 =>
          {:highest_series_points, :unpacked,
           {:message,
            Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        highest_series_points:
          {3, :unpacked,
           {:message,
            Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}},
        recent_games:
          {2, :unpacked,
           {:message,
            Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}},
        total_game_count: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "totalGameCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_game_count,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "recentGames",
          kind: :unpacked,
          label: :repeated,
          name: :recent_games,
          tag: 2,
          type:
            {:message,
             Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}
        },
        %{
          __struct__: Protox.Field,
          json_name: "highestSeriesPoints",
          kind: :unpacked,
          label: :repeated,
          name: :highest_series_points,
          tag: 3,
          type:
            {:message,
             Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:total_game_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalGameCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_game_count,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("totalGameCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalGameCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_game_count,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("total_game_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalGameCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_game_count,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:recent_games) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentGames",
             kind: :unpacked,
             label: :repeated,
             name: :recent_games,
             tag: 2,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}
           }}
        end

        def field_def("recentGames") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentGames",
             kind: :unpacked,
             label: :repeated,
             name: :recent_games,
             tag: 2,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}
           }}
        end

        def field_def("recent_games") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentGames",
             kind: :unpacked,
             label: :repeated,
             name: :recent_games,
             tag: 2,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestGameResult}
           }}
        end
      ),
      (
        def field_def(:highest_series_points) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestSeriesPoints",
             kind: :unpacked,
             label: :repeated,
             name: :highest_series_points,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}
           }}
        end

        def field_def("highestSeriesPoints") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestSeriesPoints",
             kind: :unpacked,
             label: :repeated,
             name: :highest_series_points,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}
           }}
        end

        def field_def("highest_series_points") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "highestSeriesPoints",
             kind: :unpacked,
             label: :repeated,
             name: :highest_series_points,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.ResFetchContestPlayerRank.ContestPlayerAccountData.ContestSeriesGameResult}
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
    def default(:total_game_count) do
      {:ok, 0}
    end,
    def default(:recent_games) do
      {:error, :no_default_value}
    end,
    def default(:highest_series_points) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end