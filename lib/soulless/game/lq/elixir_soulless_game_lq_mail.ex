# credo:disable-for-this-file
defmodule Soulless.Game.Lq.Mail do
  @moduledoc false
  defstruct mail_id: 0,
            state: 0,
            take_attachment: false,
            title: "",
            content: "",
            attachments: [],
            create_time: 0,
            expire_time: 0,
            reference_id: 0,
            title_i18n: [],
            content_i18n: [],
            template_id: 0,
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
        |> encode_mail_id(msg)
        |> encode_state(msg)
        |> encode_take_attachment(msg)
        |> encode_title(msg)
        |> encode_content(msg)
        |> encode_attachments(msg)
        |> encode_create_time(msg)
        |> encode_expire_time(msg)
        |> encode_reference_id(msg)
        |> encode_title_i18n(msg)
        |> encode_content_i18n(msg)
        |> encode_template_id(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_mail_id(acc, msg) do
        try do
          if msg.mail_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.mail_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mail_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_state(acc, msg) do
        try do
          if msg.state == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_take_attachment(acc, msg) do
        try do
          if msg.take_attachment == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.take_attachment)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:take_attachment, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_title(acc, msg) do
        try do
          if msg.title == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.title)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_content(acc, msg) do
        try do
          if msg.content == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.content)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:content, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_attachments(acc, msg) do
        try do
          case msg.attachments do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:attachments, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_time(acc, msg) do
        try do
          if msg.create_time == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.create_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_expire_time(acc, msg) do
        try do
          if msg.expire_time == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.expire_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:expire_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reference_id(acc, msg) do
        try do
          if msg.reference_id == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.reference_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reference_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_title_i18n(acc, msg) do
        try do
          case msg.title_i18n do
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
            reraise Protox.EncodingError.new(:title_i18n, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_content_i18n(acc, msg) do
        try do
          case msg.content_i18n do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "Z", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:content_i18n, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_template_id(acc, msg) do
        try do
          if msg.template_id == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.template_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:template_id, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.Mail))
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
              {[mail_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[state: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[take_attachment: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[title: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[content: delimited], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[attachments: msg.attachments ++ [Soulless.Game.Lq.RewardSlot.decode!(delimited)]],
               rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[create_time: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[expire_time: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[reference_id: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[title_i18n: msg.title_i18n ++ [Soulless.Game.Lq.I18nContext.decode!(delimited)]],
               rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 content_i18n:
                   msg.content_i18n ++ [Soulless.Game.Lq.I18nContext.decode!(delimited)]
               ], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[template_id: value], rest}

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
        Soulless.Game.Lq.Mail,
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
        1 => {:mail_id, {:scalar, 0}, :uint32},
        2 => {:state, {:scalar, 0}, :uint32},
        3 => {:take_attachment, {:scalar, false}, :bool},
        4 => {:title, {:scalar, ""}, :string},
        5 => {:content, {:scalar, ""}, :string},
        6 => {:attachments, :unpacked, {:message, Soulless.Game.Lq.RewardSlot}},
        7 => {:create_time, {:scalar, 0}, :uint32},
        8 => {:expire_time, {:scalar, 0}, :uint32},
        9 => {:reference_id, {:scalar, 0}, :uint32},
        10 => {:title_i18n, :unpacked, {:message, Soulless.Game.Lq.I18nContext}},
        11 => {:content_i18n, :unpacked, {:message, Soulless.Game.Lq.I18nContext}},
        12 => {:template_id, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        attachments: {6, :unpacked, {:message, Soulless.Game.Lq.RewardSlot}},
        content: {5, {:scalar, ""}, :string},
        content_i18n: {11, :unpacked, {:message, Soulless.Game.Lq.I18nContext}},
        create_time: {7, {:scalar, 0}, :uint32},
        expire_time: {8, {:scalar, 0}, :uint32},
        mail_id: {1, {:scalar, 0}, :uint32},
        reference_id: {9, {:scalar, 0}, :uint32},
        state: {2, {:scalar, 0}, :uint32},
        take_attachment: {3, {:scalar, false}, :bool},
        template_id: {12, {:scalar, 0}, :uint32},
        title: {4, {:scalar, ""}, :string},
        title_i18n: {10, :unpacked, {:message, Soulless.Game.Lq.I18nContext}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mailId",
          kind: {:scalar, 0},
          label: :optional,
          name: :mail_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "state",
          kind: {:scalar, 0},
          label: :optional,
          name: :state,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "takeAttachment",
          kind: {:scalar, false},
          label: :optional,
          name: :take_attachment,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, ""},
          label: :optional,
          name: :title,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "content",
          kind: {:scalar, ""},
          label: :optional,
          name: :content,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "attachments",
          kind: :unpacked,
          label: :repeated,
          name: :attachments,
          tag: 6,
          type: {:message, Soulless.Game.Lq.RewardSlot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :create_time,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "expireTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :expire_time,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "referenceId",
          kind: {:scalar, 0},
          label: :optional,
          name: :reference_id,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleI18n",
          kind: :unpacked,
          label: :repeated,
          name: :title_i18n,
          tag: 10,
          type: {:message, Soulless.Game.Lq.I18nContext}
        },
        %{
          __struct__: Protox.Field,
          json_name: "contentI18n",
          kind: :unpacked,
          label: :repeated,
          name: :content_i18n,
          tag: 11,
          type: {:message, Soulless.Game.Lq.I18nContext}
        },
        %{
          __struct__: Protox.Field,
          json_name: "templateId",
          kind: {:scalar, 0},
          label: :optional,
          name: :template_id,
          tag: 12,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:mail_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mail_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mailId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mail_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mail_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailId",
             kind: {:scalar, 0},
             label: :optional,
             name: :mail_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:take_attachment) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "takeAttachment",
             kind: {:scalar, false},
             label: :optional,
             name: :take_attachment,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("takeAttachment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "takeAttachment",
             kind: {:scalar, false},
             label: :optional,
             name: :take_attachment,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("take_attachment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "takeAttachment",
             kind: {:scalar, false},
             label: :optional,
             name: :take_attachment,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:title) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, ""},
             label: :optional,
             name: :title,
             tag: 4,
             type: :string
           }}
        end

        def field_def("title") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, ""},
             label: :optional,
             name: :title,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:content) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "content",
             kind: {:scalar, ""},
             label: :optional,
             name: :content,
             tag: 5,
             type: :string
           }}
        end

        def field_def("content") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "content",
             kind: {:scalar, ""},
             label: :optional,
             name: :content,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:attachments) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "attachments",
             kind: :unpacked,
             label: :repeated,
             name: :attachments,
             tag: 6,
             type: {:message, Soulless.Game.Lq.RewardSlot}
           }}
        end

        def field_def("attachments") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "attachments",
             kind: :unpacked,
             label: :repeated,
             name: :attachments,
             tag: 6,
             type: {:message, Soulless.Game.Lq.RewardSlot}
           }}
        end

        []
      ),
      (
        def field_def(:create_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("createTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("create_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:expire_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expireTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :expire_time,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("expireTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expireTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :expire_time,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("expire_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "expireTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :expire_time,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:reference_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "referenceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :reference_id,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("referenceId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "referenceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :reference_id,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("reference_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "referenceId",
             kind: {:scalar, 0},
             label: :optional,
             name: :reference_id,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:title_i18n) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleI18n",
             kind: :unpacked,
             label: :repeated,
             name: :title_i18n,
             tag: 10,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end

        def field_def("titleI18n") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleI18n",
             kind: :unpacked,
             label: :repeated,
             name: :title_i18n,
             tag: 10,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end

        def field_def("title_i18n") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleI18n",
             kind: :unpacked,
             label: :repeated,
             name: :title_i18n,
             tag: 10,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end
      ),
      (
        def field_def(:content_i18n) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contentI18n",
             kind: :unpacked,
             label: :repeated,
             name: :content_i18n,
             tag: 11,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end

        def field_def("contentI18n") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contentI18n",
             kind: :unpacked,
             label: :repeated,
             name: :content_i18n,
             tag: 11,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end

        def field_def("content_i18n") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contentI18n",
             kind: :unpacked,
             label: :repeated,
             name: :content_i18n,
             tag: 11,
             type: {:message, Soulless.Game.Lq.I18nContext}
           }}
        end
      ),
      (
        def field_def(:template_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "templateId",
             kind: {:scalar, 0},
             label: :optional,
             name: :template_id,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("templateId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "templateId",
             kind: {:scalar, 0},
             label: :optional,
             name: :template_id,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("template_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "templateId",
             kind: {:scalar, 0},
             label: :optional,
             name: :template_id,
             tag: 12,
             type: :uint32
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
    def default(:mail_id) do
      {:ok, 0}
    end,
    def default(:state) do
      {:ok, 0}
    end,
    def default(:take_attachment) do
      {:ok, false}
    end,
    def default(:title) do
      {:ok, ""}
    end,
    def default(:content) do
      {:ok, ""}
    end,
    def default(:attachments) do
      {:error, :no_default_value}
    end,
    def default(:create_time) do
      {:ok, 0}
    end,
    def default(:expire_time) do
      {:ok, 0}
    end,
    def default(:reference_id) do
      {:ok, 0}
    end,
    def default(:title_i18n) do
      {:error, :no_default_value}
    end,
    def default(:content_i18n) do
      {:error, :no_default_value}
    end,
    def default(:template_id) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end