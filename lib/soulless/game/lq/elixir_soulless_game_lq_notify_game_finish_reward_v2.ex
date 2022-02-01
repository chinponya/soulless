# credo:disable-for-this-file
defmodule Soulless.Game.Lq.NotifyGameFinishRewardV2 do
  @moduledoc false
  defstruct mode_id: 0,
            level_change: nil,
            match_chest: nil,
            main_character: nil,
            character_gift: nil,
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
        |> encode_mode_id(msg)
        |> encode_level_change(msg)
        |> encode_match_chest(msg)
        |> encode_main_character(msg)
        |> encode_character_gift(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_mode_id(acc, msg) do
        try do
          if msg.mode_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.mode_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mode_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_level_change(acc, msg) do
        try do
          if msg.level_change == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.level_change)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:level_change, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_match_chest(acc, msg) do
        try do
          if msg.match_chest == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.match_chest)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:match_chest, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_main_character(acc, msg) do
        try do
          if msg.main_character == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.main_character)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:main_character, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_character_gift(acc, msg) do
        try do
          if msg.character_gift == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.character_gift)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:character_gift, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.NotifyGameFinishRewardV2))
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
              {[mode_id: value], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 level_change:
                   Protox.MergeMessage.merge(
                     msg.level_change,
                     Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 match_chest:
                   Protox.MergeMessage.merge(
                     msg.match_chest,
                     Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 main_character:
                   Protox.MergeMessage.merge(
                     msg.main_character,
                     Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 character_gift:
                   Protox.MergeMessage.merge(
                     msg.character_gift,
                     Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift.decode!(delimited)
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
        Soulless.Game.Lq.NotifyGameFinishRewardV2,
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
        1 => {:mode_id, {:scalar, 0}, :uint32},
        2 =>
          {:level_change, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}},
        3 =>
          {:match_chest, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}},
        4 =>
          {:main_character, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}},
        5 =>
          {:character_gift, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        character_gift:
          {5, {:scalar, nil}, {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}},
        level_change:
          {2, {:scalar, nil}, {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}},
        main_character:
          {4, {:scalar, nil}, {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}},
        match_chest:
          {3, {:scalar, nil}, {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}},
        mode_id: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "modeId",
          kind: {:scalar, 0},
          label: :optional,
          name: :mode_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "levelChange",
          kind: {:scalar, nil},
          label: :optional,
          name: :level_change,
          tag: 2,
          type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}
        },
        %{
          __struct__: Protox.Field,
          json_name: "matchChest",
          kind: {:scalar, nil},
          label: :optional,
          name: :match_chest,
          tag: 3,
          type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mainCharacter",
          kind: {:scalar, nil},
          label: :optional,
          name: :main_character,
          tag: 4,
          type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}
        },
        %{
          __struct__: Protox.Field,
          json_name: "characterGift",
          kind: {:scalar, nil},
          label: :optional,
          name: :character_gift,
          tag: 5,
          type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:mode_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("modeId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mode_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:level_change) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "levelChange",
             kind: {:scalar, nil},
             label: :optional,
             name: :level_change,
             tag: 2,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}
           }}
        end

        def field_def("levelChange") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "levelChange",
             kind: {:scalar, nil},
             label: :optional,
             name: :level_change,
             tag: 2,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}
           }}
        end

        def field_def("level_change") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "levelChange",
             kind: {:scalar, nil},
             label: :optional,
             name: :level_change,
             tag: 2,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.LevelChange}
           }}
        end
      ),
      (
        def field_def(:match_chest) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchChest",
             kind: {:scalar, nil},
             label: :optional,
             name: :match_chest,
             tag: 3,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}
           }}
        end

        def field_def("matchChest") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchChest",
             kind: {:scalar, nil},
             label: :optional,
             name: :match_chest,
             tag: 3,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}
           }}
        end

        def field_def("match_chest") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchChest",
             kind: {:scalar, nil},
             label: :optional,
             name: :match_chest,
             tag: 3,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MatchChest}
           }}
        end
      ),
      (
        def field_def(:main_character) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainCharacter",
             kind: {:scalar, nil},
             label: :optional,
             name: :main_character,
             tag: 4,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}
           }}
        end

        def field_def("mainCharacter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainCharacter",
             kind: {:scalar, nil},
             label: :optional,
             name: :main_character,
             tag: 4,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}
           }}
        end

        def field_def("main_character") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mainCharacter",
             kind: {:scalar, nil},
             label: :optional,
             name: :main_character,
             tag: 4,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.MainCharacter}
           }}
        end
      ),
      (
        def field_def(:character_gift) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterGift",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_gift,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}
           }}
        end

        def field_def("characterGift") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterGift",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_gift,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}
           }}
        end

        def field_def("character_gift") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterGift",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_gift,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyGameFinishRewardV2.CharacterGift}
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
    def default(:mode_id) do
      {:ok, 0}
    end,
    def default(:level_change) do
      {:ok, nil}
    end,
    def default(:match_chest) do
      {:ok, nil}
    end,
    def default(:main_character) do
      {:ok, nil}
    end,
    def default(:character_gift) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end