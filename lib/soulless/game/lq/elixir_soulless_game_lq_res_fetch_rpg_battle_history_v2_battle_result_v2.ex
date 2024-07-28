# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchRPGBattleHistoryV2.BattleResultV2 do
  @moduledoc false
  defstruct chang: 0,
            ju: 0,
            ben: 0,
            damage: 0,
            monster_seq: 0,
            killed: 0,
            buff: [],
            points: 0,
            uuid: "",
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
        |> encode_chang(msg)
        |> encode_ju(msg)
        |> encode_ben(msg)
        |> encode_damage(msg)
        |> encode_monster_seq(msg)
        |> encode_killed(msg)
        |> encode_buff(msg)
        |> encode_points(msg)
        |> encode_uuid(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_chang(acc, msg) do
        try do
          if msg.chang == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.chang)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chang, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ju(acc, msg) do
        try do
          if msg.ju == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.ju)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ju, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_ben(acc, msg) do
        try do
          if msg.ben == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.ben)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ben, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_damage(acc, msg) do
        try do
          if msg.damage == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.damage)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:damage, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_monster_seq(acc, msg) do
        try do
          if msg.monster_seq == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.monster_seq)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:monster_seq, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_killed(acc, msg) do
        try do
          if msg.killed == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.killed)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:killed, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_buff(acc, msg) do
        try do
          case msg.buff do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:buff, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_points(acc, msg) do
        try do
          if msg.points == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.points)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:points, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_uuid(acc, msg) do
        try do
          if msg.uuid == "" do
            acc
          else
            [acc, "r", Protox.Encode.encode_string(msg.uuid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:uuid, "invalid field value"), __STACKTRACE__
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
            struct(Soulless.Game.Lq.ResFetchRPGBattleHistoryV2.BattleResultV2)
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
              {[chang: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ju: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ben: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[damage: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[monster_seq: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[killed: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[buff: msg.buff ++ [Soulless.Game.Lq.ActivityBuffData.decode!(delimited)]], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[points: value], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[uuid: Protox.Decode.validate_string(delimited)], rest}

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
        Soulless.Game.Lq.ResFetchRPGBattleHistoryV2.BattleResultV2,
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
        1 => {:chang, {:scalar, 0}, :uint32},
        2 => {:ju, {:scalar, 0}, :uint32},
        3 => {:ben, {:scalar, 0}, :uint32},
        5 => {:damage, {:scalar, 0}, :uint32},
        7 => {:monster_seq, {:scalar, 0}, :uint32},
        9 => {:killed, {:scalar, 0}, :uint32},
        10 => {:buff, :unpacked, {:message, Soulless.Game.Lq.ActivityBuffData}},
        11 => {:points, {:scalar, 0}, :uint32},
        14 => {:uuid, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        ben: {3, {:scalar, 0}, :uint32},
        buff: {10, :unpacked, {:message, Soulless.Game.Lq.ActivityBuffData}},
        chang: {1, {:scalar, 0}, :uint32},
        damage: {5, {:scalar, 0}, :uint32},
        ju: {2, {:scalar, 0}, :uint32},
        killed: {9, {:scalar, 0}, :uint32},
        monster_seq: {7, {:scalar, 0}, :uint32},
        points: {11, {:scalar, 0}, :uint32},
        uuid: {14, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
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
          json_name: "damage",
          kind: {:scalar, 0},
          label: :optional,
          name: :damage,
          tag: 5,
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
          json_name: "killed",
          kind: {:scalar, 0},
          label: :optional,
          name: :killed,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buff",
          kind: :unpacked,
          label: :repeated,
          name: :buff,
          tag: 10,
          type: {:message, Soulless.Game.Lq.ActivityBuffData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "points",
          kind: {:scalar, 0},
          label: :optional,
          name: :points,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "uuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :uuid,
          tag: 14,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:chang) do
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

        def field_def("chang") do
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
        def field_def(:ju) do
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

        def field_def("ju") do
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
        def field_def(:ben) do
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

        def field_def("ben") do
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
        def field_def(:damage) do
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

        def field_def("damage") do
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
        def field_def(:monster_seq) do
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

        def field_def("monsterSeq") do
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

        def field_def("monster_seq") do
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
        def field_def(:killed) do
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

        def field_def("killed") do
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
        def field_def(:buff) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buff",
             kind: :unpacked,
             label: :repeated,
             name: :buff,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ActivityBuffData}
           }}
        end

        def field_def("buff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buff",
             kind: :unpacked,
             label: :repeated,
             name: :buff,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ActivityBuffData}
           }}
        end

        []
      ),
      (
        def field_def(:points) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: {:scalar, 0},
             label: :optional,
             name: :points,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("points") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "points",
             kind: {:scalar, 0},
             label: :optional,
             name: :points,
             tag: 11,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:uuid) do
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

        def field_def("uuid") do
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
    def default(:chang) do
      {:ok, 0}
    end,
    def default(:ju) do
      {:ok, 0}
    end,
    def default(:ben) do
      {:ok, 0}
    end,
    def default(:damage) do
      {:ok, 0}
    end,
    def default(:monster_seq) do
      {:ok, 0}
    end,
    def default(:killed) do
      {:ok, 0}
    end,
    def default(:buff) do
      {:error, :no_default_value}
    end,
    def default(:points) do
      {:ok, 0}
    end,
    def default(:uuid) do
      {:ok, ""}
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
