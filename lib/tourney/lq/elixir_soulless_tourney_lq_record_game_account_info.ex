# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.RecordGame.AccountInfo) do
  @moduledoc false
  (
    defstruct(
      account_id: 0,
      seat: 0,
      nickname: "",
      avatar_id: 0,
      character: nil,
      title: 0,
      level: nil,
      level3: nil,
      avatar_frame: 0,
      verified: 0,
      views: [],
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
          |> encode_account_id(msg)
          |> encode_seat(msg)
          |> encode_nickname(msg)
          |> encode_avatar_id(msg)
          |> encode_character(msg)
          |> encode_title(msg)
          |> encode_level(msg)
          |> encode_level3(msg)
          |> encode_avatar_frame(msg)
          |> encode_verified(msg)
          |> encode_views(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_account_id(acc, msg)) do
          try do
            if(msg.account_id == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.account_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:account_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_seat(acc, msg)) do
          try do
            if(msg.seat == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.seat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_nickname(acc, msg)) do
          try do
            if(msg.nickname == "") do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_string(msg.nickname)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:nickname, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_avatar_id(acc, msg)) do
          try do
            if(msg.avatar_id == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.avatar_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:avatar_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_character(acc, msg)) do
          try do
            if(msg.character == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.character)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:character, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_title(acc, msg)) do
          try do
            if(msg.title == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.title)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_level(acc, msg)) do
          try do
            if(msg.level == nil) do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.level)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:level, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_level3(acc, msg)) do
          try do
            if(msg.level3 == nil) do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.level3)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:level3, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_avatar_frame(acc, msg)) do
          try do
            if(msg.avatar_frame == 0) do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.avatar_frame)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:avatar_frame, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_verified(acc, msg)) do
          try do
            if(msg.verified == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.verified)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:verified, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_views(acc, msg)) do
          try do
            case(msg.views) do
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
              reraise(Protox.EncodingError.new(:views, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.RecordGame.AccountInfo))
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
                {[account_id: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seat: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[nickname: delimited], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_id: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   character:
                     Protox.Message.merge(
                       msg.character,
                       Soulless.Tourney.Lq.Character.decode!(delimited)
                     )
                 ], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[title: value], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level:
                     Protox.Message.merge(
                       msg.level,
                       Soulless.Tourney.Lq.AccountLevel.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level3:
                     Protox.Message.merge(
                       msg.level3,
                       Soulless.Tourney.Lq.AccountLevel.decode!(delimited)
                     )
                 ], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_frame: value], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[verified: value], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[views: msg.views ++ [Soulless.Tourney.Lq.ViewSlot.decode!(delimited)]], rest}

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
          Soulless.Tourney.Lq.RecordGame.AccountInfo,
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
        1 => {:account_id, {:scalar, 0}, :uint32},
        2 => {:seat, {:scalar, 0}, :uint32},
        3 => {:nickname, {:scalar, ""}, :string},
        4 => {:avatar_id, {:scalar, 0}, :uint32},
        5 => {:character, {:scalar, nil}, {:message, Soulless.Tourney.Lq.Character}},
        6 => {:title, {:scalar, 0}, :uint32},
        7 => {:level, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        8 => {:level3, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        9 => {:avatar_frame, {:scalar, 0}, :uint32},
        10 => {:verified, {:scalar, 0}, :uint32},
        11 => {:views, :unpacked, {:message, Soulless.Tourney.Lq.ViewSlot}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        account_id: {1, {:scalar, 0}, :uint32},
        avatar_frame: {9, {:scalar, 0}, :uint32},
        avatar_id: {4, {:scalar, 0}, :uint32},
        character: {5, {:scalar, nil}, {:message, Soulless.Tourney.Lq.Character}},
        level: {7, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        level3: {8, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        nickname: {3, {:scalar, ""}, :string},
        seat: {2, {:scalar, 0}, :uint32},
        title: {6, {:scalar, 0}, :uint32},
        verified: {10, {:scalar, 0}, :uint32},
        views: {11, :unpacked, {:message, Soulless.Tourney.Lq.ViewSlot}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "nickname",
          kind: {:scalar, ""},
          label: :optional,
          name: :nickname,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarId",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_id,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "character",
          kind: {:scalar, nil},
          label: :optional,
          name: :character,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.Character}
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, 0},
          label: :optional,
          name: :title,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, nil},
          label: :optional,
          name: :level,
          tag: 7,
          type: {:message, Soulless.Tourney.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level3",
          kind: {:scalar, nil},
          label: :optional,
          name: :level3,
          tag: 8,
          type: {:message, Soulless.Tourney.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarFrame",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_frame,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "verified",
          kind: {:scalar, 0},
          label: :optional,
          name: :verified,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "views",
          kind: :unpacked,
          label: :repeated,
          name: :views,
          tag: 11,
          type: {:message, Soulless.Tourney.Lq.ViewSlot}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:account_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("accountId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("account_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:seat)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("seat")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:nickname)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nickname",
             kind: {:scalar, ""},
             label: :optional,
             name: :nickname,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("nickname")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nickname",
             kind: {:scalar, ""},
             label: :optional,
             name: :nickname,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:avatar_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarId",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_id,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("avatarId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarId",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_id,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("avatar_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarId",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_id,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:character)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        def(field_def("character")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "character",
             kind: {:scalar, nil},
             label: :optional,
             name: :character,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.Character}
           }}
        end

        []
      ),
      (
        def(field_def(:title)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, 0},
             label: :optional,
             name: :title,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("title")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, 0},
             label: :optional,
             name: :title,
             tag: 6,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:level)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level",
             kind: {:scalar, nil},
             label: :optional,
             name: :level,
             tag: 7,
             type: {:message, Soulless.Tourney.Lq.AccountLevel}
           }}
        end

        def(field_def("level")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level",
             kind: {:scalar, nil},
             label: :optional,
             name: :level,
             tag: 7,
             type: {:message, Soulless.Tourney.Lq.AccountLevel}
           }}
        end

        []
      ),
      (
        def(field_def(:level3)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level3",
             kind: {:scalar, nil},
             label: :optional,
             name: :level3,
             tag: 8,
             type: {:message, Soulless.Tourney.Lq.AccountLevel}
           }}
        end

        def(field_def("level3")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level3",
             kind: {:scalar, nil},
             label: :optional,
             name: :level3,
             tag: 8,
             type: {:message, Soulless.Tourney.Lq.AccountLevel}
           }}
        end

        []
      ),
      (
        def(field_def(:avatar_frame)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarFrame",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_frame,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("avatarFrame")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarFrame",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_frame,
             tag: 9,
             type: :uint32
           }}
        end

        def(field_def("avatar_frame")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "avatarFrame",
             kind: {:scalar, 0},
             label: :optional,
             name: :avatar_frame,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:verified)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "verified",
             kind: {:scalar, 0},
             label: :optional,
             name: :verified,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("verified")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "verified",
             kind: {:scalar, 0},
             label: :optional,
             name: :verified,
             tag: 10,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:views)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "views",
             kind: :unpacked,
             label: :repeated,
             name: :views,
             tag: 11,
             type: {:message, Soulless.Tourney.Lq.ViewSlot}
           }}
        end

        def(field_def("views")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "views",
             kind: :unpacked,
             label: :repeated,
             name: :views,
             tag: 11,
             type: {:message, Soulless.Tourney.Lq.ViewSlot}
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
      def(default(:account_id)) do
        {:ok, 0}
      end,
      def(default(:seat)) do
        {:ok, 0}
      end,
      def(default(:nickname)) do
        {:ok, ""}
      end,
      def(default(:avatar_id)) do
        {:ok, 0}
      end,
      def(default(:character)) do
        {:ok, nil}
      end,
      def(default(:title)) do
        {:ok, 0}
      end,
      def(default(:level)) do
        {:ok, nil}
      end,
      def(default(:level3)) do
        {:ok, nil}
      end,
      def(default(:avatar_frame)) do
        {:ok, 0}
      end,
      def(default(:verified)) do
        {:ok, 0}
      end,
      def(default(:views)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end