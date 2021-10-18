# credo:disable-for-this-file
defmodule(Soulless.Lq.AccountCacheView) do
  @moduledoc false
  (
    defstruct(
      cache_version: 0,
      account_id: 0,
      nickname: "",
      login_time: 0,
      logout_time: 0,
      is_online: false,
      room_id: 0,
      title: 0,
      avatar_id: 0,
      vip: 0,
      level: nil,
      playing_game: nil,
      level3: nil,
      avatar_frame: 0,
      verified: 0,
      ban_deadline: 0,
      comment_ban: 0,
      ban_state: 0,
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
          |> encode_cache_version(msg)
          |> encode_account_id(msg)
          |> encode_nickname(msg)
          |> encode_login_time(msg)
          |> encode_logout_time(msg)
          |> encode_is_online(msg)
          |> encode_room_id(msg)
          |> encode_title(msg)
          |> encode_avatar_id(msg)
          |> encode_vip(msg)
          |> encode_level(msg)
          |> encode_playing_game(msg)
          |> encode_level3(msg)
          |> encode_avatar_frame(msg)
          |> encode_verified(msg)
          |> encode_ban_deadline(msg)
          |> encode_comment_ban(msg)
          |> encode_ban_state(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_cache_version(acc, msg)) do
          try do
            if(msg.cache_version == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.cache_version)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:cache_version, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_account_id(acc, msg)) do
          try do
            if(msg.account_id == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.account_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:account_id, "invalid field value"),
                __STACKTRACE__
              )
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
        defp(encode_login_time(acc, msg)) do
          try do
            if(msg.login_time == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.login_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:login_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_logout_time(acc, msg)) do
          try do
            if(msg.logout_time == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.logout_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:logout_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_is_online(acc, msg)) do
          try do
            if(msg.is_online == false) do
              acc
            else
              [acc, "0", Protox.Encode.encode_bool(msg.is_online)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_online, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_room_id(acc, msg)) do
          try do
            if(msg.room_id == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.room_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:room_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_title(acc, msg)) do
          try do
            if(msg.title == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.title)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_avatar_id(acc, msg)) do
          try do
            if(msg.avatar_id == 0) do
              acc
            else
              [acc, "H", Protox.Encode.encode_uint32(msg.avatar_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:avatar_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_vip(acc, msg)) do
          try do
            if(msg.vip == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.vip)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:vip, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_level(acc, msg)) do
          try do
            if(msg.level == nil) do
              acc
            else
              [acc, "Z", Protox.Encode.encode_message(msg.level)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:level, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_playing_game(acc, msg)) do
          try do
            if(msg.playing_game == nil) do
              acc
            else
              [acc, "b", Protox.Encode.encode_message(msg.playing_game)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:playing_game, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_level3(acc, msg)) do
          try do
            if(msg.level3 == nil) do
              acc
            else
              [acc, "j", Protox.Encode.encode_message(msg.level3)]
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
              [acc, "p", Protox.Encode.encode_uint32(msg.avatar_frame)]
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
              [acc, "x", Protox.Encode.encode_uint32(msg.verified)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:verified, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_ban_deadline(acc, msg)) do
          try do
            if(msg.ban_deadline == 0) do
              acc
            else
              [acc, <<128, 1>>, Protox.Encode.encode_uint32(msg.ban_deadline)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:ban_deadline, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_comment_ban(acc, msg)) do
          try do
            if(msg.comment_ban == 0) do
              acc
            else
              [acc, <<136, 1>>, Protox.Encode.encode_uint32(msg.comment_ban)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:comment_ban, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_ban_state(acc, msg)) do
          try do
            if(msg.ban_state == 0) do
              acc
            else
              [acc, <<144, 1>>, Protox.Encode.encode_uint32(msg.ban_state)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ban_state, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.AccountCacheView))
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
                {[cache_version: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[account_id: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[nickname: delimited], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[login_time: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[logout_time: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_online: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[room_id: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[title: value], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_id: value], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[vip: value], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level:
                     Protox.Message.merge(msg.level, Soulless.Lq.AccountLevel.decode!(delimited))
                 ], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   playing_game:
                     Protox.Message.merge(
                       msg.playing_game,
                       Soulless.Lq.AccountPlayingGame.decode!(delimited)
                     )
                 ], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level3:
                     Protox.Message.merge(msg.level3, Soulless.Lq.AccountLevel.decode!(delimited))
                 ], rest}

              {14, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_frame: value], rest}

              {15, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[verified: value], rest}

              {16, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ban_deadline: value], rest}

              {17, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[comment_ban: value], rest}

              {18, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ban_state: value], rest}

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
          Soulless.Lq.AccountCacheView,
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
        1 => {:cache_version, {:scalar, 0}, :uint32},
        2 => {:account_id, {:scalar, 0}, :uint32},
        3 => {:nickname, {:scalar, ""}, :string},
        4 => {:login_time, {:scalar, 0}, :uint32},
        5 => {:logout_time, {:scalar, 0}, :uint32},
        6 => {:is_online, {:scalar, false}, :bool},
        7 => {:room_id, {:scalar, 0}, :uint32},
        8 => {:title, {:scalar, 0}, :uint32},
        9 => {:avatar_id, {:scalar, 0}, :uint32},
        10 => {:vip, {:scalar, 0}, :uint32},
        11 => {:level, {:scalar, nil}, {:message, Soulless.Lq.AccountLevel}},
        12 => {:playing_game, {:scalar, nil}, {:message, Soulless.Lq.AccountPlayingGame}},
        13 => {:level3, {:scalar, nil}, {:message, Soulless.Lq.AccountLevel}},
        14 => {:avatar_frame, {:scalar, 0}, :uint32},
        15 => {:verified, {:scalar, 0}, :uint32},
        16 => {:ban_deadline, {:scalar, 0}, :uint32},
        17 => {:comment_ban, {:scalar, 0}, :uint32},
        18 => {:ban_state, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        account_id: {2, {:scalar, 0}, :uint32},
        avatar_frame: {14, {:scalar, 0}, :uint32},
        avatar_id: {9, {:scalar, 0}, :uint32},
        ban_deadline: {16, {:scalar, 0}, :uint32},
        ban_state: {18, {:scalar, 0}, :uint32},
        cache_version: {1, {:scalar, 0}, :uint32},
        comment_ban: {17, {:scalar, 0}, :uint32},
        is_online: {6, {:scalar, false}, :bool},
        level: {11, {:scalar, nil}, {:message, Soulless.Lq.AccountLevel}},
        level3: {13, {:scalar, nil}, {:message, Soulless.Lq.AccountLevel}},
        login_time: {4, {:scalar, 0}, :uint32},
        logout_time: {5, {:scalar, 0}, :uint32},
        nickname: {3, {:scalar, ""}, :string},
        playing_game: {12, {:scalar, nil}, {:message, Soulless.Lq.AccountPlayingGame}},
        room_id: {7, {:scalar, 0}, :uint32},
        title: {8, {:scalar, 0}, :uint32},
        verified: {15, {:scalar, 0}, :uint32},
        vip: {10, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "cacheVersion",
          kind: {:scalar, 0},
          label: :optional,
          name: :cache_version,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
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
          json_name: "loginTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :login_time,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "logoutTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :logout_time,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isOnline",
          kind: {:scalar, false},
          label: :optional,
          name: :is_online,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "roomId",
          kind: {:scalar, 0},
          label: :optional,
          name: :room_id,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, 0},
          label: :optional,
          name: :title,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarId",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_id,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "vip",
          kind: {:scalar, 0},
          label: :optional,
          name: :vip,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, nil},
          label: :optional,
          name: :level,
          tag: 11,
          type: {:message, Soulless.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "playingGame",
          kind: {:scalar, nil},
          label: :optional,
          name: :playing_game,
          tag: 12,
          type: {:message, Soulless.Lq.AccountPlayingGame}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level3",
          kind: {:scalar, nil},
          label: :optional,
          name: :level3,
          tag: 13,
          type: {:message, Soulless.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarFrame",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_frame,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "verified",
          kind: {:scalar, 0},
          label: :optional,
          name: :verified,
          tag: 15,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "banDeadline",
          kind: {:scalar, 0},
          label: :optional,
          name: :ban_deadline,
          tag: 16,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "commentBan",
          kind: {:scalar, 0},
          label: :optional,
          name: :comment_ban,
          tag: 17,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "banState",
          kind: {:scalar, 0},
          label: :optional,
          name: :ban_state,
          tag: 18,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:cache_version)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cacheVersion",
             kind: {:scalar, 0},
             label: :optional,
             name: :cache_version,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("cacheVersion")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cacheVersion",
             kind: {:scalar, 0},
             label: :optional,
             name: :cache_version,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("cache_version")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cacheVersion",
             kind: {:scalar, 0},
             label: :optional,
             name: :cache_version,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:account_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 2,
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
             tag: 2,
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
             tag: 2,
             type: :uint32
           }}
        end
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
        def(field_def(:login_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("loginTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("login_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:logout_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("logoutTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("logout_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_online)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 6,
             type: :bool
           }}
        end

        def(field_def("isOnline")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 6,
             type: :bool
           }}
        end

        def(field_def("is_online")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:room_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("roomId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("room_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roomId",
             kind: {:scalar, 0},
             label: :optional,
             name: :room_id,
             tag: 7,
             type: :uint32
           }}
        end
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
             tag: 8,
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
             tag: 8,
             type: :uint32
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
             tag: 9,
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
             tag: 9,
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
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:vip)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vip",
             kind: {:scalar, 0},
             label: :optional,
             name: :vip,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("vip")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vip",
             kind: {:scalar, 0},
             label: :optional,
             name: :vip,
             tag: 10,
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
             tag: 11,
             type: {:message, Soulless.Lq.AccountLevel}
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
             tag: 11,
             type: {:message, Soulless.Lq.AccountLevel}
           }}
        end

        []
      ),
      (
        def(field_def(:playing_game)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playingGame",
             kind: {:scalar, nil},
             label: :optional,
             name: :playing_game,
             tag: 12,
             type: {:message, Soulless.Lq.AccountPlayingGame}
           }}
        end

        def(field_def("playingGame")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playingGame",
             kind: {:scalar, nil},
             label: :optional,
             name: :playing_game,
             tag: 12,
             type: {:message, Soulless.Lq.AccountPlayingGame}
           }}
        end

        def(field_def("playing_game")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playingGame",
             kind: {:scalar, nil},
             label: :optional,
             name: :playing_game,
             tag: 12,
             type: {:message, Soulless.Lq.AccountPlayingGame}
           }}
        end
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
             tag: 13,
             type: {:message, Soulless.Lq.AccountLevel}
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
             tag: 13,
             type: {:message, Soulless.Lq.AccountLevel}
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
             tag: 14,
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
             tag: 14,
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
             tag: 14,
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
             tag: 15,
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
             tag: 15,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:ban_deadline)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banDeadline",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_deadline,
             tag: 16,
             type: :uint32
           }}
        end

        def(field_def("banDeadline")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banDeadline",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_deadline,
             tag: 16,
             type: :uint32
           }}
        end

        def(field_def("ban_deadline")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banDeadline",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_deadline,
             tag: 16,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:comment_ban)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentBan",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_ban,
             tag: 17,
             type: :uint32
           }}
        end

        def(field_def("commentBan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentBan",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_ban,
             tag: 17,
             type: :uint32
           }}
        end

        def(field_def("comment_ban")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentBan",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_ban,
             tag: 17,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:ban_state)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banState",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_state,
             tag: 18,
             type: :uint32
           }}
        end

        def(field_def("banState")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banState",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_state,
             tag: 18,
             type: :uint32
           }}
        end

        def(field_def("ban_state")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "banState",
             kind: {:scalar, 0},
             label: :optional,
             name: :ban_state,
             tag: 18,
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
      def(default(:cache_version)) do
        {:ok, 0}
      end,
      def(default(:account_id)) do
        {:ok, 0}
      end,
      def(default(:nickname)) do
        {:ok, ""}
      end,
      def(default(:login_time)) do
        {:ok, 0}
      end,
      def(default(:logout_time)) do
        {:ok, 0}
      end,
      def(default(:is_online)) do
        {:ok, false}
      end,
      def(default(:room_id)) do
        {:ok, 0}
      end,
      def(default(:title)) do
        {:ok, 0}
      end,
      def(default(:avatar_id)) do
        {:ok, 0}
      end,
      def(default(:vip)) do
        {:ok, 0}
      end,
      def(default(:level)) do
        {:ok, nil}
      end,
      def(default(:playing_game)) do
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
      def(default(:ban_deadline)) do
        {:ok, 0}
      end,
      def(default(:comment_ban)) do
        {:ok, 0}
      end,
      def(default(:ban_state)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end