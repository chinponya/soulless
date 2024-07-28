# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchContestPlayerRank do
  @moduledoc false
  defstruct error: nil, total: 0, rank: [], player_data: nil, __uf__: []

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
        |> encode_total(msg)
        |> encode_rank(msg)
        |> encode_player_data(msg)
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
      defp encode_total(acc, msg) do
        try do
          if msg.total == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.total)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:total, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rank(acc, msg) do
        try do
          case msg.rank do
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
            reraise Protox.EncodingError.new(:rank, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_player_data(acc, msg) do
        try do
          if msg.player_data == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.player_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:player_data, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResFetchContestPlayerRank))
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
              {[total: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 rank:
                   msg.rank ++
                     [Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank.decode!(delimited)]
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 player_data:
                   Protox.MergeMessage.merge(
                     msg.player_data,
                     Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData.decode!(delimited)
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
        Soulless.Game.Lq.ResFetchContestPlayerRank,
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
        2 => {:total, {:scalar, 0}, :uint32},
        3 =>
          {:rank, :unpacked, {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank}},
        4 =>
          {:player_data, {:scalar, nil},
           {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        player_data:
          {4, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}},
        rank: {3, :unpacked, {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank}},
        total: {2, {:scalar, 0}, :uint32}
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
          json_name: "total",
          kind: {:scalar, 0},
          label: :optional,
          name: :total,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rank",
          kind: :unpacked,
          label: :repeated,
          name: :rank,
          tag: 3,
          type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank}
        },
        %{
          __struct__: Protox.Field,
          json_name: "playerData",
          kind: {:scalar, nil},
          label: :optional,
          name: :player_data,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}
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
        def field_def(:total) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "total",
             kind: {:scalar, 0},
             label: :optional,
             name: :total,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("total") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "total",
             kind: {:scalar, 0},
             label: :optional,
             name: :total,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:rank) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rank",
             kind: :unpacked,
             label: :repeated,
             name: :rank,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank}
           }}
        end

        def field_def("rank") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rank",
             kind: :unpacked,
             label: :repeated,
             name: :rank,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.SeasonRank}
           }}
        end

        []
      ),
      (
        def field_def(:player_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerData",
             kind: {:scalar, nil},
             label: :optional,
             name: :player_data,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}
           }}
        end

        def field_def("playerData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerData",
             kind: {:scalar, nil},
             label: :optional,
             name: :player_data,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}
           }}
        end

        def field_def("player_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerData",
             kind: {:scalar, nil},
             label: :optional,
             name: :player_data,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResFetchContestPlayerRank.PlayerData}
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
    def default(:total) do
      {:ok, 0}
    end,
    def default(:rank) do
      {:error, :no_default_value}
    end,
    def default(:player_data) do
      {:ok, nil}
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
