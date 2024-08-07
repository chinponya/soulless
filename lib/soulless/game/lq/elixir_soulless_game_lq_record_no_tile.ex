# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordNoTile do
  @moduledoc false
  defstruct liujumanguan: false,
            players: [],
            scores: [],
            gameend: false,
            muyu: nil,
            hules_history: [],
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
        |> encode_liujumanguan(msg)
        |> encode_players(msg)
        |> encode_scores(msg)
        |> encode_gameend(msg)
        |> encode_muyu(msg)
        |> encode_hules_history(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_liujumanguan(acc, msg) do
        try do
          if msg.liujumanguan == false do
            acc
          else
            [acc, "\b", Protox.Encode.encode_bool(msg.liujumanguan)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:liujumanguan, "invalid field value"), __STACKTRACE__
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
      defp encode_scores(acc, msg) do
        try do
          case msg.scores do
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
            reraise Protox.EncodingError.new(:scores, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_gameend(acc, msg) do
        try do
          if msg.gameend == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.gameend)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gameend, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_muyu(acc, msg) do
        try do
          if msg.muyu == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.muyu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hules_history(acc, msg) do
        try do
          case msg.hules_history do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hules_history, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.RecordNoTile))
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
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[liujumanguan: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[players: msg.players ++ [Soulless.Game.Lq.NoTilePlayerInfo.decode!(delimited)]],
               rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[scores: msg.scores ++ [Soulless.Game.Lq.NoTileScoreInfo.decode!(delimited)]],
               rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[gameend: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 muyu:
                   Protox.MergeMessage.merge(
                     msg.muyu,
                     Soulless.Game.Lq.MuyuInfo.decode!(delimited)
                   )
               ], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 hules_history:
                   msg.hules_history ++ [Soulless.Game.Lq.HuleInfo.decode!(delimited)]
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
        Soulless.Game.Lq.RecordNoTile,
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
        1 => {:liujumanguan, {:scalar, false}, :bool},
        2 => {:players, :unpacked, {:message, Soulless.Game.Lq.NoTilePlayerInfo}},
        3 => {:scores, :unpacked, {:message, Soulless.Game.Lq.NoTileScoreInfo}},
        4 => {:gameend, {:scalar, false}, :bool},
        5 => {:muyu, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        9 => {:hules_history, :unpacked, {:message, Soulless.Game.Lq.HuleInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        gameend: {4, {:scalar, false}, :bool},
        hules_history: {9, :unpacked, {:message, Soulless.Game.Lq.HuleInfo}},
        liujumanguan: {1, {:scalar, false}, :bool},
        muyu: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        players: {2, :unpacked, {:message, Soulless.Game.Lq.NoTilePlayerInfo}},
        scores: {3, :unpacked, {:message, Soulless.Game.Lq.NoTileScoreInfo}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "liujumanguan",
          kind: {:scalar, false},
          label: :optional,
          name: :liujumanguan,
          tag: 1,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "players",
          kind: :unpacked,
          label: :repeated,
          name: :players,
          tag: 2,
          type: {:message, Soulless.Game.Lq.NoTilePlayerInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "scores",
          kind: :unpacked,
          label: :repeated,
          name: :scores,
          tag: 3,
          type: {:message, Soulless.Game.Lq.NoTileScoreInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameend",
          kind: {:scalar, false},
          label: :optional,
          name: :gameend,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 5,
          type: {:message, Soulless.Game.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hulesHistory",
          kind: :unpacked,
          label: :repeated,
          name: :hules_history,
          tag: 9,
          type: {:message, Soulless.Game.Lq.HuleInfo}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:liujumanguan) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :liujumanguan,
             tag: 1,
             type: :bool
           }}
        end

        def field_def("liujumanguan") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujumanguan",
             kind: {:scalar, false},
             label: :optional,
             name: :liujumanguan,
             tag: 1,
             type: :bool
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
             type: {:message, Soulless.Game.Lq.NoTilePlayerInfo}
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
             type: {:message, Soulless.Game.Lq.NoTilePlayerInfo}
           }}
        end

        []
      ),
      (
        def field_def(:scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :unpacked,
             label: :repeated,
             name: :scores,
             tag: 3,
             type: {:message, Soulless.Game.Lq.NoTileScoreInfo}
           }}
        end

        def field_def("scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :unpacked,
             label: :repeated,
             name: :scores,
             tag: 3,
             type: {:message, Soulless.Game.Lq.NoTileScoreInfo}
           }}
        end

        []
      ),
      (
        def field_def(:gameend) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameend",
             kind: {:scalar, false},
             label: :optional,
             name: :gameend,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("gameend") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameend",
             kind: {:scalar, false},
             label: :optional,
             name: :gameend,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:muyu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 5,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        def field_def("muyu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 5,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        []
      ),
      (
        def field_def(:hules_history) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Game.Lq.HuleInfo}
           }}
        end

        def field_def("hulesHistory") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Game.Lq.HuleInfo}
           }}
        end

        def field_def("hules_history") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Game.Lq.HuleInfo}
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
    def default(:liujumanguan) do
      {:ok, false}
    end,
    def default(:players) do
      {:error, :no_default_value}
    end,
    def default(:scores) do
      {:error, :no_default_value}
    end,
    def default(:gameend) do
      {:ok, false}
    end,
    def default(:muyu) do
      {:ok, nil}
    end,
    def default(:hules_history) do
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
