# credo:disable-for-this-file
defmodule(Soulless.Lq.GameSnapshot) do
  @moduledoc false
  (
    defstruct(
      chang: 0,
      ju: 0,
      ben: 0,
      index_player: 0,
      left_tile_count: 0,
      hands: [],
      doras: [],
      liqibang: 0,
      players: [],
      zhenting: false,
      __uf__: []
    )

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_chang(msg)
          |> encode_ju(msg)
          |> encode_ben(msg)
          |> encode_index_player(msg)
          |> encode_left_tile_count(msg)
          |> encode_hands(msg)
          |> encode_doras(msg)
          |> encode_liqibang(msg)
          |> encode_players(msg)
          |> encode_zhenting(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_chang(acc, msg)) do
          try do
            if(msg.chang == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.chang)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:chang, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ju(acc, msg)) do
          try do
            if(msg.ju == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.ju)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ju, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ben(acc, msg)) do
          try do
            if(msg.ben == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.ben)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ben, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_index_player(acc, msg)) do
          try do
            if(msg.index_player == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.index_player)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:index_player, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_left_tile_count(acc, msg)) do
          try do
            if(msg.left_tile_count == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.left_tile_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:left_tile_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_hands(acc, msg)) do
          try do
            case(msg.hands) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "2", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:hands, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_doras(acc, msg)) do
          try do
            case(msg.doras) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, ":", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqibang(acc, msg)) do
          try do
            if(msg.liqibang == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.liqibang)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:liqibang, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_players(acc, msg)) do
          try do
            case(msg.players) do
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
              reraise(Protox.EncodingError.new(:players, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_zhenting(acc, msg)) do
          try do
            if(msg.zhenting == false) do
              acc
            else
              [acc, "P", Protox.Encode.encode_bool(msg.zhenting)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__)
          end
        end
      ]

      defp(encode_unknown_fields(acc, msg)) do
        Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
          case(wire_type) do
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
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(Soulless.Lq.GameSnapshot))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[chang: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ju: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ben: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[index_player: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[left_tile_count: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[hands: msg.hands ++ [delimited]], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[doras: msg.doras ++ [delimited]], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[liqibang: value], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   players:
                     msg.players ++ [Soulless.Lq.GameSnapshot.PlayerSnapshot.decode!(delimited)]
                 ], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[zhenting: value], rest}

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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          Soulless.Lq.GameSnapshot,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:chang, {:scalar, 0}, :uint32},
        2 => {:ju, {:scalar, 0}, :uint32},
        3 => {:ben, {:scalar, 0}, :uint32},
        4 => {:index_player, {:scalar, 0}, :uint32},
        5 => {:left_tile_count, {:scalar, 0}, :uint32},
        6 => {:hands, :unpacked, :string},
        7 => {:doras, :unpacked, :string},
        8 => {:liqibang, {:scalar, 0}, :uint32},
        9 => {:players, :unpacked, {:message, Soulless.Lq.GameSnapshot.PlayerSnapshot}},
        10 => {:zhenting, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        ben: {3, {:scalar, 0}, :uint32},
        chang: {1, {:scalar, 0}, :uint32},
        doras: {7, :unpacked, :string},
        hands: {6, :unpacked, :string},
        index_player: {4, {:scalar, 0}, :uint32},
        ju: {2, {:scalar, 0}, :uint32},
        left_tile_count: {5, {:scalar, 0}, :uint32},
        liqibang: {8, {:scalar, 0}, :uint32},
        players: {9, :unpacked, {:message, Soulless.Lq.GameSnapshot.PlayerSnapshot}},
        zhenting: {10, {:scalar, false}, :bool}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "chang",
          kind: {:scalar, 0},
          label: :optional,
          name: :chang,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ju",
          kind: {:scalar, 0},
          label: :optional,
          name: :ju,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ben",
          kind: {:scalar, 0},
          label: :optional,
          name: :ben,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "indexPlayer",
          kind: {:scalar, 0},
          label: :optional,
          name: :index_player,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "leftTileCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :left_tile_count,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "hands",
          kind: :unpacked,
          label: :repeated,
          name: :hands,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 7,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqibang",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqibang,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "players",
          kind: :unpacked,
          label: :repeated,
          name: :players,
          tag: 9,
          type: {:message, Soulless.Lq.GameSnapshot.PlayerSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhenting",
          kind: {:scalar, false},
          label: :optional,
          name: :zhenting,
          tag: 10,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:chang)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("chang")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chang",
             kind: {:scalar, 0},
             label: :optional,
             name: :chang,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:ju)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("ju")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ju",
             kind: {:scalar, 0},
             label: :optional,
             name: :ju,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:ben)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("ben")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ben",
             kind: {:scalar, 0},
             label: :optional,
             name: :ben,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:index_player)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexPlayer",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_player,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("indexPlayer")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexPlayer",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_player,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("index_player")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "indexPlayer",
             kind: {:scalar, 0},
             label: :optional,
             name: :index_player,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:left_tile_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("leftTileCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("left_tile_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "leftTileCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :left_tile_count,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:hands)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("hands")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hands",
             kind: :unpacked,
             label: :repeated,
             name: :hands,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:doras)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 7,
             type: :string
           }}
        end

        def(field_def("doras")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 7,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:liqibang)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibang",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("liqibang")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqibang",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqibang,
             tag: 8,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:players)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 9,
             type: {:message, Soulless.Lq.GameSnapshot.PlayerSnapshot}
           }}
        end

        def(field_def("players")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "players",
             kind: :unpacked,
             label: :repeated,
             name: :players,
             tag: 9,
             type: {:message, Soulless.Lq.GameSnapshot.PlayerSnapshot}
           }}
        end

        []
      ),
      (
        def(field_def(:zhenting)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: {:scalar, false},
             label: :optional,
             name: :zhenting,
             tag: 10,
             type: :bool
           }}
        end

        def(field_def("zhenting")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: {:scalar, false},
             label: :optional,
             name: :zhenting,
             tag: 10,
             type: :bool
           }}
        end

        []
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    (
      @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
      def(unknown_fields(msg)) do
        msg.__uf__
      end

      @spec unknown_fields_name() :: :__uf__
      def(unknown_fields_name()) do
        :__uf__
      end

      @spec clear_unknown_fields(struct) :: struct
      def(clear_unknown_fields(msg)) do
        struct!(msg, [{unknown_fields_name(), []}])
      end
    )

    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:chang)) do
        {:ok, 0}
      end,
      def(default(:ju)) do
        {:ok, 0}
      end,
      def(default(:ben)) do
        {:ok, 0}
      end,
      def(default(:index_player)) do
        {:ok, 0}
      end,
      def(default(:left_tile_count)) do
        {:ok, 0}
      end,
      def(default(:hands)) do
        {:error, :no_default_value}
      end,
      def(default(:doras)) do
        {:error, :no_default_value}
      end,
      def(default(:liqibang)) do
        {:ok, 0}
      end,
      def(default(:players)) do
        {:error, :no_default_value}
      end,
      def(default(:zhenting)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end