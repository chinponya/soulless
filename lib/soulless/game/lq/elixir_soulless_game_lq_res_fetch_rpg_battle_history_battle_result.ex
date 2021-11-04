# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.ResFetchRPGBattleHistory.BattleResult) do
  @moduledoc false
  (
    defstruct(
      chang: 0,
      ju: 0,
      ben: 0,
      target: 0,
      damage: 0,
      heal: 0,
      monster_seq: 0,
      chain_atk: 0,
      killed: 0,
      is_luk: 0,
      is_dex: 0,
      is_extra: 0,
      reward: "",
      uuid: "",
      points: 0,
      is_zimo: 0,
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
          |> encode_target(msg)
          |> encode_damage(msg)
          |> encode_heal(msg)
          |> encode_monster_seq(msg)
          |> encode_chain_atk(msg)
          |> encode_killed(msg)
          |> encode_is_luk(msg)
          |> encode_is_dex(msg)
          |> encode_is_extra(msg)
          |> encode_reward(msg)
          |> encode_uuid(msg)
          |> encode_points(msg)
          |> encode_is_zimo(msg)
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
        defp(encode_target(acc, msg)) do
          try do
            if(msg.target == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.target)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:target, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_damage(acc, msg)) do
          try do
            if(msg.damage == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.damage)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:damage, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_heal(acc, msg)) do
          try do
            if(msg.heal == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.heal)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:heal, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_monster_seq(acc, msg)) do
          try do
            if(msg.monster_seq == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.monster_seq)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:monster_seq, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_chain_atk(acc, msg)) do
          try do
            if(msg.chain_atk == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.chain_atk)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:chain_atk, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_killed(acc, msg)) do
          try do
            if(msg.killed == 0) do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.killed)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:killed, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_luk(acc, msg)) do
          try do
            if(msg.is_luk == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.is_luk)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_luk, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_dex(acc, msg)) do
          try do
            if(msg.is_dex == 0) do
              acc
            else
              [acc, "X", Protox.Encode.encode_uint32(msg.is_dex)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_dex, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_extra(acc, msg)) do
          try do
            if(msg.is_extra == 0) do
              acc
            else
              [acc, "`", Protox.Encode.encode_uint32(msg.is_extra)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_extra, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_reward(acc, msg)) do
          try do
            if(msg.reward == "") do
              acc
            else
              [acc, "j", Protox.Encode.encode_string(msg.reward)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:reward, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_uuid(acc, msg)) do
          try do
            if(msg.uuid == "") do
              acc
            else
              [acc, "r", Protox.Encode.encode_string(msg.uuid)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:uuid, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_points(acc, msg)) do
          try do
            if(msg.points == 0) do
              acc
            else
              [acc, "x", Protox.Encode.encode_uint32(msg.points)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:points, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_zimo(acc, msg)) do
          try do
            if(msg.is_zimo == 0) do
              acc
            else
              [acc, <<128, 1>>, Protox.Encode.encode_uint32(msg.is_zimo)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_zimo, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ResFetchRPGBattleHistory.BattleResult))
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
                {[target: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[damage: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[heal: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[monster_seq: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[chain_atk: value], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[killed: value], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[is_luk: value], rest}

              {11, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[is_dex: value], rest}

              {12, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[is_extra: value], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[reward: delimited], rest}

              {14, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[uuid: delimited], rest}

              {15, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[points: value], rest}

              {16, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[is_zimo: value], rest}

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
          Soulless.Game.Lq.ResFetchRPGBattleHistory.BattleResult,
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
        4 => {:target, {:scalar, 0}, :uint32},
        5 => {:damage, {:scalar, 0}, :uint32},
        6 => {:heal, {:scalar, 0}, :uint32},
        7 => {:monster_seq, {:scalar, 0}, :uint32},
        8 => {:chain_atk, {:scalar, 0}, :uint32},
        9 => {:killed, {:scalar, 0}, :uint32},
        10 => {:is_luk, {:scalar, 0}, :uint32},
        11 => {:is_dex, {:scalar, 0}, :uint32},
        12 => {:is_extra, {:scalar, 0}, :uint32},
        13 => {:reward, {:scalar, ""}, :string},
        14 => {:uuid, {:scalar, ""}, :string},
        15 => {:points, {:scalar, 0}, :uint32},
        16 => {:is_zimo, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        ben: {3, {:scalar, 0}, :uint32},
        chain_atk: {8, {:scalar, 0}, :uint32},
        chang: {1, {:scalar, 0}, :uint32},
        damage: {5, {:scalar, 0}, :uint32},
        heal: {6, {:scalar, 0}, :uint32},
        is_dex: {11, {:scalar, 0}, :uint32},
        is_extra: {12, {:scalar, 0}, :uint32},
        is_luk: {10, {:scalar, 0}, :uint32},
        is_zimo: {16, {:scalar, 0}, :uint32},
        ju: {2, {:scalar, 0}, :uint32},
        killed: {9, {:scalar, 0}, :uint32},
        monster_seq: {7, {:scalar, 0}, :uint32},
        points: {15, {:scalar, 0}, :uint32},
        reward: {13, {:scalar, ""}, :string},
        target: {4, {:scalar, 0}, :uint32},
        uuid: {14, {:scalar, ""}, :string}
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
          json_name: "target",
          kind: {:scalar, 0},
          label: :optional,
          name: :target,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "damage",
          kind: {:scalar, 0},
          label: :optional,
          name: :damage,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "heal",
          kind: {:scalar, 0},
          label: :optional,
          name: :heal,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "monsterSeq",
          kind: {:scalar, 0},
          label: :optional,
          name: :monster_seq,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "chainAtk",
          kind: {:scalar, 0},
          label: :optional,
          name: :chain_atk,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "killed",
          kind: {:scalar, 0},
          label: :optional,
          name: :killed,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isLuk",
          kind: {:scalar, 0},
          label: :optional,
          name: :is_luk,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isDex",
          kind: {:scalar, 0},
          label: :optional,
          name: :is_dex,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isExtra",
          kind: {:scalar, 0},
          label: :optional,
          name: :is_extra,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "reward",
          kind: {:scalar, ""},
          label: :optional,
          name: :reward,
          tag: 13,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "uuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :uuid,
          tag: 14,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "points",
          kind: {:scalar, 0},
          label: :optional,
          name: :points,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isZimo",
          kind: {:scalar, 0},
          label: :optional,
          name: :is_zimo,
          tag: 16,
          type: :uint32
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
        def(field_def(:target)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "target",
             kind: {:scalar, 0},
             label: :optional,
             name: :target,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("target")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "target",
             kind: {:scalar, 0},
             label: :optional,
             name: :target,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:damage)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "damage",
             kind: {:scalar, 0},
             label: :optional,
             name: :damage,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("damage")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "damage",
             kind: {:scalar, 0},
             label: :optional,
             name: :damage,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:heal)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "heal",
             kind: {:scalar, 0},
             label: :optional,
             name: :heal,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("heal")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "heal",
             kind: {:scalar, 0},
             label: :optional,
             name: :heal,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:monster_seq)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monsterSeq",
             kind: {:scalar, 0},
             label: :optional,
             name: :monster_seq,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("monsterSeq")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monsterSeq",
             kind: {:scalar, 0},
             label: :optional,
             name: :monster_seq,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("monster_seq")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monsterSeq",
             kind: {:scalar, 0},
             label: :optional,
             name: :monster_seq,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:chain_atk)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chainAtk",
             kind: {:scalar, 0},
             label: :optional,
             name: :chain_atk,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("chainAtk")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chainAtk",
             kind: {:scalar, 0},
             label: :optional,
             name: :chain_atk,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("chain_atk")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chainAtk",
             kind: {:scalar, 0},
             label: :optional,
             name: :chain_atk,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:killed)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "killed",
             kind: {:scalar, 0},
             label: :optional,
             name: :killed,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("killed")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "killed",
             kind: {:scalar, 0},
             label: :optional,
             name: :killed,
             tag: 9,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:is_luk)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLuk",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_luk,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("isLuk")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLuk",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_luk,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("is_luk")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isLuk",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_luk,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_dex)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDex",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_dex,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("isDex")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDex",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_dex,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("is_dex")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isDex",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_dex,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_extra)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isExtra",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_extra,
             tag: 12,
             type: :uint32
           }}
        end

        def(field_def("isExtra")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isExtra",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_extra,
             tag: 12,
             type: :uint32
           }}
        end

        def(field_def("is_extra")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isExtra",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_extra,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:reward)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reward",
             kind: {:scalar, ""},
             label: :optional,
             name: :reward,
             tag: 13,
             type: :string
           }}
        end

        def(field_def("reward")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reward",
             kind: {:scalar, ""},
             label: :optional,
             name: :reward,
             tag: 13,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:uuid)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 14,
             type: :string
           }}
        end

        def(field_def("uuid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :uuid,
             tag: 14,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:points)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: {:scalar, 0},
             label: :optional,
             name: :points,
             tag: 15,
             type: :uint32
           }}
        end

        def(field_def("points")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: {:scalar, 0},
             label: :optional,
             name: :points,
             tag: 15,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:is_zimo)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_zimo,
             tag: 16,
             type: :uint32
           }}
        end

        def(field_def("isZimo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_zimo,
             tag: 16,
             type: :uint32
           }}
        end

        def(field_def("is_zimo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZimo",
             kind: {:scalar, 0},
             label: :optional,
             name: :is_zimo,
             tag: 16,
             type: :uint32
           }}
        end
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
      def(default(:target)) do
        {:ok, 0}
      end,
      def(default(:damage)) do
        {:ok, 0}
      end,
      def(default(:heal)) do
        {:ok, 0}
      end,
      def(default(:monster_seq)) do
        {:ok, 0}
      end,
      def(default(:chain_atk)) do
        {:ok, 0}
      end,
      def(default(:killed)) do
        {:ok, 0}
      end,
      def(default(:is_luk)) do
        {:ok, 0}
      end,
      def(default(:is_dex)) do
        {:ok, 0}
      end,
      def(default(:is_extra)) do
        {:ok, 0}
      end,
      def(default(:reward)) do
        {:ok, ""}
      end,
      def(default(:uuid)) do
        {:ok, ""}
      end,
      def(default(:points)) do
        {:ok, 0}
      end,
      def(default(:is_zimo)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end