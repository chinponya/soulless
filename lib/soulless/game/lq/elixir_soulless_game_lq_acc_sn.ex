# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccSn do
  @moduledoc false
  defstruct resource: nil,
            character: nil,
            mail: nil,
            achievement: nil,
            misc: nil,
            gift_code: nil,
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
        |> encode_resource(msg)
        |> encode_character(msg)
        |> encode_mail(msg)
        |> encode_achievement(msg)
        |> encode_misc(msg)
        |> encode_gift_code(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_resource(acc, msg) do
        try do
          if msg.resource == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.resource)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:resource, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_character(acc, msg) do
        try do
          if msg.character == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.character)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:character, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_mail(acc, msg) do
        try do
          if msg.mail == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.mail)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mail, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_achievement(acc, msg) do
        try do
          if msg.achievement == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.achievement)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:achievement, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_misc(acc, msg) do
        try do
          if msg.misc == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.misc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:misc, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_gift_code(acc, msg) do
        try do
          if msg.gift_code == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.gift_code)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gift_code, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccSn))
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
                 resource:
                   Protox.MergeMessage.merge(
                     msg.resource,
                     Soulless.Game.Lq.AccountResourceSnapshot.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 character:
                   Protox.MergeMessage.merge(
                     msg.character,
                     Soulless.Game.Lq.AccountCharacterSnapshot.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 mail:
                   Protox.MergeMessage.merge(
                     msg.mail,
                     Soulless.Game.Lq.AccountMailRecord.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 achievement:
                   Protox.MergeMessage.merge(
                     msg.achievement,
                     Soulless.Game.Lq.AccountAchievementSnapshot.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 misc:
                   Protox.MergeMessage.merge(
                     msg.misc,
                     Soulless.Game.Lq.AccountMiscSnapshot.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 gift_code:
                   Protox.MergeMessage.merge(
                     msg.gift_code,
                     Soulless.Game.Lq.AccountGiftCodeRecord.decode!(delimited)
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
        Soulless.Game.Lq.AccSn,
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
        1 => {:resource, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountResourceSnapshot}},
        2 => {:character, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountCharacterSnapshot}},
        3 => {:mail, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMailRecord}},
        4 =>
          {:achievement, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountAchievementSnapshot}},
        5 => {:misc, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMiscSnapshot}},
        6 => {:gift_code, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountGiftCodeRecord}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        achievement: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountAchievementSnapshot}},
        character: {2, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountCharacterSnapshot}},
        gift_code: {6, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountGiftCodeRecord}},
        mail: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMailRecord}},
        misc: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMiscSnapshot}},
        resource: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountResourceSnapshot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "resource",
          kind: {:scalar, nil},
          label: :optional,
          name: :resource,
          tag: 1,
          type: {:message, Soulless.Game.Lq.AccountResourceSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "character",
          kind: {:scalar, nil},
          label: :optional,
          name: :character,
          tag: 2,
          type: {:message, Soulless.Game.Lq.AccountCharacterSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mail",
          kind: {:scalar, nil},
          label: :optional,
          name: :mail,
          tag: 3,
          type: {:message, Soulless.Game.Lq.AccountMailRecord}
        },
        %{
          __struct__: Protox.Field,
          json_name: "achievement",
          kind: {:scalar, nil},
          label: :optional,
          name: :achievement,
          tag: 4,
          type: {:message, Soulless.Game.Lq.AccountAchievementSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "misc",
          kind: {:scalar, nil},
          label: :optional,
          name: :misc,
          tag: 5,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "giftCode",
          kind: {:scalar, nil},
          label: :optional,
          name: :gift_code,
          tag: 6,
          type: {:message, Soulless.Game.Lq.AccountGiftCodeRecord}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:resource) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resource",
             kind: {:scalar, nil},
             label: :optional,
             name: :resource,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot}
           }}
        end

        def field_def("resource") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "resource",
             kind: {:scalar, nil},
             label: :optional,
             name: :resource,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:character) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountCharacterSnapshot}
           }}
        end

        def field_def("character") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountCharacterSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:mail) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mail",
             kind: {:scalar, nil},
             label: :optional,
             name: :mail,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountMailRecord}
           }}
        end

        def field_def("mail") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mail",
             kind: {:scalar, nil},
             label: :optional,
             name: :mail,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountMailRecord}
           }}
        end

        []
      ),
      (
        def field_def(:achievement) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievement",
             kind: {:scalar, nil},
             label: :optional,
             name: :achievement,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountAchievementSnapshot}
           }}
        end

        def field_def("achievement") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievement",
             kind: {:scalar, nil},
             label: :optional,
             name: :achievement,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountAchievementSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:misc) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "misc",
             kind: {:scalar, nil},
             label: :optional,
             name: :misc,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot}
           }}
        end

        def field_def("misc") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "misc",
             kind: {:scalar, nil},
             label: :optional,
             name: :misc,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:gift_code) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftCode",
             kind: {:scalar, nil},
             label: :optional,
             name: :gift_code,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountGiftCodeRecord}
           }}
        end

        def field_def("giftCode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftCode",
             kind: {:scalar, nil},
             label: :optional,
             name: :gift_code,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountGiftCodeRecord}
           }}
        end

        def field_def("gift_code") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftCode",
             kind: {:scalar, nil},
             label: :optional,
             name: :gift_code,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountGiftCodeRecord}
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
    def default(:resource) do
      {:ok, nil}
    end,
    def default(:character) do
      {:ok, nil}
    end,
    def default(:mail) do
      {:ok, nil}
    end,
    def default(:achievement) do
      {:ok, nil}
    end,
    def default(:misc) do
      {:ok, nil}
    end,
    def default(:gift_code) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end