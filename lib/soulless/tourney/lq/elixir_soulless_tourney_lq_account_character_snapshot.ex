# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.AccountCharacterSnapshot do
  @moduledoc false
  defstruct created_characters: [],
            removed_characters: [],
            modified_characters: [],
            main_character: nil,
            skins: nil,
            hidden_characters: nil,
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
        |> encode_created_characters(msg)
        |> encode_removed_characters(msg)
        |> encode_modified_characters(msg)
        |> encode_main_character(msg)
        |> encode_skins(msg)
        |> encode_hidden_characters(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_created_characters(acc, msg) do
        try do
          case msg.created_characters do
            [] ->
              acc

            values ->
              [
                acc,
                "\n",
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
            reraise Protox.EncodingError.new(:created_characters, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_removed_characters(acc, msg) do
        try do
          case msg.removed_characters do
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
            reraise Protox.EncodingError.new(:removed_characters, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_modified_characters(acc, msg) do
        try do
          case msg.modified_characters do
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
            reraise Protox.EncodingError.new(:modified_characters, "invalid field value"),
                    __STACKTRACE__
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
      defp encode_skins(acc, msg) do
        try do
          if msg.skins == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.skins)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skins, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hidden_characters(acc, msg) do
        try do
          if msg.hidden_characters == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.hidden_characters)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hidden_characters, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.AccountCharacterSnapshot))
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

            {1, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 created_characters:
                   msg.created_characters ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[created_characters: msg.created_characters ++ [value]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 removed_characters:
                   msg.removed_characters ++ [Soulless.Tourney.Lq.Character.decode!(delimited)]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 modified_characters:
                   msg.modified_characters ++ [Soulless.Tourney.Lq.Character.decode!(delimited)]
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 main_character:
                   Protox.MergeMessage.merge(
                     msg.main_character,
                     Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot.decode!(
                       delimited
                     )
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 skins:
                   Protox.MergeMessage.merge(
                     msg.skins,
                     Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 hidden_characters:
                   Protox.MergeMessage.merge(
                     msg.hidden_characters,
                     Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter.decode!(
                       delimited
                     )
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
        Soulless.Tourney.Lq.AccountCharacterSnapshot,
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
        1 => {:created_characters, :packed, :uint32},
        2 => {:removed_characters, :unpacked, {:message, Soulless.Tourney.Lq.Character}},
        3 => {:modified_characters, :unpacked, {:message, Soulless.Tourney.Lq.Character}},
        4 =>
          {:main_character, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}},
        5 =>
          {:skins, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot}},
        6 =>
          {:hidden_characters, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        created_characters: {1, :packed, :uint32},
        hidden_characters:
          {6, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}},
        main_character:
          {4, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}},
        modified_characters: {3, :unpacked, {:message, Soulless.Tourney.Lq.Character}},
        removed_characters: {2, :unpacked, {:message, Soulless.Tourney.Lq.Character}},
        skins:
          {5, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "createdCharacters",
          kind: :packed,
          label: :repeated,
          name: :created_characters,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "removedCharacters",
          kind: :unpacked,
          label: :repeated,
          name: :removed_characters,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.Character}
        },
        %{
          __struct__: Protox.Field,
          json_name: "modifiedCharacters",
          kind: :unpacked,
          label: :repeated,
          name: :modified_characters,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.Character}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mainCharacter",
          kind: {:scalar, nil},
          label: :optional,
          name: :main_character,
          tag: 4,
          type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "skins",
          kind: {:scalar, nil},
          label: :optional,
          name: :skins,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hiddenCharacters",
          kind: {:scalar, nil},
          label: :optional,
          name: :hidden_characters,
          tag: 6,
          type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:created_characters) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdCharacters",
             kind: :packed,
             label: :repeated,
             name: :created_characters,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("createdCharacters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdCharacters",
             kind: :packed,
             label: :repeated,
             name: :created_characters,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("created_characters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdCharacters",
             kind: :packed,
             label: :repeated,
             name: :created_characters,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:removed_characters) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :removed_characters,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        def field_def("removedCharacters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :removed_characters,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        def field_def("removed_characters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :removed_characters,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end
      ),
      (
        def field_def(:modified_characters) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :modified_characters,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        def field_def("modifiedCharacters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :modified_characters,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        def field_def("modified_characters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedCharacters",
             kind: :unpacked,
             label: :repeated,
             name: :modified_characters,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.Character}
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
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}
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
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}
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
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.MainCharacterSnapshot}
           }}
        end
      ),
      (
        def field_def(:skins) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skins",
             kind: {:scalar, nil},
             label: :optional,
             name: :skins,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot}
           }}
        end

        def field_def("skins") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skins",
             kind: {:scalar, nil},
             label: :optional,
             name: :skins,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.SkinsSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:hidden_characters) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenCharacters",
             kind: {:scalar, nil},
             label: :optional,
             name: :hidden_characters,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}
           }}
        end

        def field_def("hiddenCharacters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenCharacters",
             kind: {:scalar, nil},
             label: :optional,
             name: :hidden_characters,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}
           }}
        end

        def field_def("hidden_characters") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hiddenCharacters",
             kind: {:scalar, nil},
             label: :optional,
             name: :hidden_characters,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AccountCharacterSnapshot.HiddenCharacter}
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
    def default(:created_characters) do
      {:error, :no_default_value}
    end,
    def default(:removed_characters) do
      {:error, :no_default_value}
    end,
    def default(:modified_characters) do
      {:error, :no_default_value}
    end,
    def default(:main_character) do
      {:ok, nil}
    end,
    def default(:skins) do
      {:ok, nil}
    end,
    def default(:hidden_characters) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end