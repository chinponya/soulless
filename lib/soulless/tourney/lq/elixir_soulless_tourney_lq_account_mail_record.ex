# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.AccountMailRecord do
  @moduledoc false
  defstruct created_mails: [], removed_mails: [], modified_mails: [], __uf__: []

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
        |> encode_created_mails(msg)
        |> encode_removed_mails(msg)
        |> encode_modified_mails(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_created_mails(acc, msg) do
        try do
          case msg.created_mails do
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
            reraise Protox.EncodingError.new(:created_mails, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_removed_mails(acc, msg) do
        try do
          case msg.removed_mails do
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
            reraise Protox.EncodingError.new(:removed_mails, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_modified_mails(acc, msg) do
        try do
          case msg.modified_mails do
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
            reraise Protox.EncodingError.new(:modified_mails, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.AccountMailRecord))
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
                 created_mails:
                   msg.created_mails ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {1, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[created_mails: msg.created_mails ++ [value]], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 removed_mails:
                   msg.removed_mails ++
                     [Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot.decode!(delimited)]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 modified_mails:
                   msg.modified_mails ++
                     [Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot.decode!(delimited)]
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
        Soulless.Tourney.Lq.AccountMailRecord,
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
        1 => {:created_mails, :packed, :uint32},
        2 =>
          {:removed_mails, :unpacked,
           {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}},
        3 =>
          {:modified_mails, :unpacked,
           {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        created_mails: {1, :packed, :uint32},
        modified_mails:
          {3, :unpacked, {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}},
        removed_mails:
          {2, :unpacked, {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "createdMails",
          kind: :packed,
          label: :repeated,
          name: :created_mails,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "removedMails",
          kind: :unpacked,
          label: :repeated,
          name: :removed_mails,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "modifiedMails",
          kind: :unpacked,
          label: :repeated,
          name: :modified_mails,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:created_mails) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdMails",
             kind: :packed,
             label: :repeated,
             name: :created_mails,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("createdMails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdMails",
             kind: :packed,
             label: :repeated,
             name: :created_mails,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("created_mails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createdMails",
             kind: :packed,
             label: :repeated,
             name: :created_mails,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:removed_mails) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedMails",
             kind: :unpacked,
             label: :repeated,
             name: :removed_mails,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
           }}
        end

        def field_def("removedMails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedMails",
             kind: :unpacked,
             label: :repeated,
             name: :removed_mails,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
           }}
        end

        def field_def("removed_mails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removedMails",
             kind: :unpacked,
             label: :repeated,
             name: :removed_mails,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
           }}
        end
      ),
      (
        def field_def(:modified_mails) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedMails",
             kind: :unpacked,
             label: :repeated,
             name: :modified_mails,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
           }}
        end

        def field_def("modifiedMails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedMails",
             kind: :unpacked,
             label: :repeated,
             name: :modified_mails,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
           }}
        end

        def field_def("modified_mails") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modifiedMails",
             kind: :unpacked,
             label: :repeated,
             name: :modified_mails,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountMailRecord.MailSnapshot}
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
    def default(:created_mails) do
      {:error, :no_default_value}
    end,
    def default(:removed_mails) do
      {:error, :no_default_value}
    end,
    def default(:modified_mails) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end