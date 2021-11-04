# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.Account) do
  @moduledoc false
  (
    defstruct(
      account_id: 0,
      nickname: "",
      login_time: 0,
      logout_time: 0,
      room_id: 0,
      anti_addiction: nil,
      title: 0,
      signature: "",
      email: "",
      email_verify: 0,
      gold: 0,
      diamond: 0,
      avatar_id: 0,
      vip: 0,
      birthday: 0,
      phone: "",
      phone_verify: 0,
      platform_diamond: [],
      level: nil,
      level3: nil,
      avatar_frame: 0,
      skin_ticket: 0,
      platform_skin_ticket: [],
      verified: 0,
      challenge_levels: [],
      achievement_count: [],
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
          |> encode_nickname(msg)
          |> encode_login_time(msg)
          |> encode_logout_time(msg)
          |> encode_room_id(msg)
          |> encode_anti_addiction(msg)
          |> encode_title(msg)
          |> encode_signature(msg)
          |> encode_email(msg)
          |> encode_email_verify(msg)
          |> encode_gold(msg)
          |> encode_diamond(msg)
          |> encode_avatar_id(msg)
          |> encode_vip(msg)
          |> encode_birthday(msg)
          |> encode_phone(msg)
          |> encode_phone_verify(msg)
          |> encode_platform_diamond(msg)
          |> encode_level(msg)
          |> encode_level3(msg)
          |> encode_avatar_frame(msg)
          |> encode_skin_ticket(msg)
          |> encode_platform_skin_ticket(msg)
          |> encode_verified(msg)
          |> encode_challenge_levels(msg)
          |> encode_achievement_count(msg)
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
        defp(encode_nickname(acc, msg)) do
          try do
            if(msg.nickname == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.nickname)]
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
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.login_time)]
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
              [acc, " ", Protox.Encode.encode_uint32(msg.logout_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:logout_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_room_id(acc, msg)) do
          try do
            if(msg.room_id == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.room_id)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:room_id, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_anti_addiction(acc, msg)) do
          try do
            if(msg.anti_addiction == nil) do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.anti_addiction)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:anti_addiction, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_title(acc, msg)) do
          try do
            if(msg.title == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.title)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_signature(acc, msg)) do
          try do
            if(msg.signature == "") do
              acc
            else
              [acc, "B", Protox.Encode.encode_string(msg.signature)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:signature, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_email(acc, msg)) do
          try do
            if(msg.email == "") do
              acc
            else
              [acc, "J", Protox.Encode.encode_string(msg.email)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:email, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_email_verify(acc, msg)) do
          try do
            if(msg.email_verify == 0) do
              acc
            else
              [acc, "P", Protox.Encode.encode_uint32(msg.email_verify)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:email_verify, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_gold(acc, msg)) do
          try do
            if(msg.gold == 0) do
              acc
            else
              [acc, "X", Protox.Encode.encode_uint32(msg.gold)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:gold, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_diamond(acc, msg)) do
          try do
            if(msg.diamond == 0) do
              acc
            else
              [acc, "`", Protox.Encode.encode_uint32(msg.diamond)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:diamond, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_avatar_id(acc, msg)) do
          try do
            if(msg.avatar_id == 0) do
              acc
            else
              [acc, "h", Protox.Encode.encode_uint32(msg.avatar_id)]
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
              [acc, "p", Protox.Encode.encode_uint32(msg.vip)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:vip, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_birthday(acc, msg)) do
          try do
            if(msg.birthday == 0) do
              acc
            else
              [acc, "x", Protox.Encode.encode_int32(msg.birthday)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:birthday, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_phone(acc, msg)) do
          try do
            if(msg.phone == "") do
              acc
            else
              [acc, <<130, 1>>, Protox.Encode.encode_string(msg.phone)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:phone, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_phone_verify(acc, msg)) do
          try do
            if(msg.phone_verify == 0) do
              acc
            else
              [acc, <<136, 1>>, Protox.Encode.encode_uint32(msg.phone_verify)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:phone_verify, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_platform_diamond(acc, msg)) do
          try do
            case(msg.platform_diamond) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<146, 1>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:platform_diamond, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_level(acc, msg)) do
          try do
            if(msg.level == nil) do
              acc
            else
              [acc, <<170, 1>>, Protox.Encode.encode_message(msg.level)]
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
              [acc, <<178, 1>>, Protox.Encode.encode_message(msg.level3)]
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
              [acc, <<184, 1>>, Protox.Encode.encode_uint32(msg.avatar_frame)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:avatar_frame, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_skin_ticket(acc, msg)) do
          try do
            if(msg.skin_ticket == 0) do
              acc
            else
              [acc, <<192, 1>>, Protox.Encode.encode_uint32(msg.skin_ticket)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:skin_ticket, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_platform_skin_ticket(acc, msg)) do
          try do
            case(msg.platform_skin_ticket) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<202, 1>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:platform_skin_ticket, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_verified(acc, msg)) do
          try do
            if(msg.verified == 0) do
              acc
            else
              [acc, <<208, 1>>, Protox.Encode.encode_uint32(msg.verified)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:verified, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_challenge_levels(acc, msg)) do
          try do
            case(msg.challenge_levels) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<218, 1>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:challenge_levels, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_achievement_count(acc, msg)) do
          try do
            case(msg.achievement_count) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<226, 1>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:achievement_count, "invalid field value"),
                __STACKTRACE__
              )
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.Account))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[nickname: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[login_time: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[logout_time: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[room_id: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   anti_addiction:
                     Protox.Message.merge(
                       msg.anti_addiction,
                       Soulless.Tourney.Lq.AntiAddiction.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[title: value], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[signature: delimited], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[email: delimited], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[email_verify: value], rest}

              {11, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[gold: value], rest}

              {12, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[diamond: value], rest}

              {13, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_id: value], rest}

              {14, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[vip: value], rest}

              {15, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[birthday: value], rest}

              {16, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[phone: delimited], rest}

              {17, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[phone_verify: value], rest}

              {18, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   platform_diamond:
                     msg.platform_diamond ++
                       [Soulless.Tourney.Lq.Account.PlatformDiamond.decode!(delimited)]
                 ], rest}

              {21, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level:
                     Protox.Message.merge(
                       msg.level,
                       Soulless.Tourney.Lq.AccountLevel.decode!(delimited)
                     )
                 ], rest}

              {22, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   level3:
                     Protox.Message.merge(
                       msg.level3,
                       Soulless.Tourney.Lq.AccountLevel.decode!(delimited)
                     )
                 ], rest}

              {23, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[avatar_frame: value], rest}

              {24, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[skin_ticket: value], rest}

              {25, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   platform_skin_ticket:
                     msg.platform_skin_ticket ++
                       [Soulless.Tourney.Lq.Account.PlatformSkinTicket.decode!(delimited)]
                 ], rest}

              {26, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[verified: value], rest}

              {27, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   challenge_levels:
                     msg.challenge_levels ++
                       [Soulless.Tourney.Lq.Account.ChallengeLevel.decode!(delimited)]
                 ], rest}

              {28, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   achievement_count:
                     msg.achievement_count ++
                       [Soulless.Tourney.Lq.Account.AchievementCount.decode!(delimited)]
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
          Soulless.Tourney.Lq.Account,
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
        2 => {:nickname, {:scalar, ""}, :string},
        3 => {:login_time, {:scalar, 0}, :uint32},
        4 => {:logout_time, {:scalar, 0}, :uint32},
        5 => {:room_id, {:scalar, 0}, :uint32},
        6 => {:anti_addiction, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AntiAddiction}},
        7 => {:title, {:scalar, 0}, :uint32},
        8 => {:signature, {:scalar, ""}, :string},
        9 => {:email, {:scalar, ""}, :string},
        10 => {:email_verify, {:scalar, 0}, :uint32},
        11 => {:gold, {:scalar, 0}, :uint32},
        12 => {:diamond, {:scalar, 0}, :uint32},
        13 => {:avatar_id, {:scalar, 0}, :uint32},
        14 => {:vip, {:scalar, 0}, :uint32},
        15 => {:birthday, {:scalar, 0}, :int32},
        16 => {:phone, {:scalar, ""}, :string},
        17 => {:phone_verify, {:scalar, 0}, :uint32},
        18 =>
          {:platform_diamond, :unpacked, {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}},
        21 => {:level, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        22 => {:level3, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        23 => {:avatar_frame, {:scalar, 0}, :uint32},
        24 => {:skin_ticket, {:scalar, 0}, :uint32},
        25 =>
          {:platform_skin_ticket, :unpacked,
           {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}},
        26 => {:verified, {:scalar, 0}, :uint32},
        27 =>
          {:challenge_levels, :unpacked, {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}},
        28 =>
          {:achievement_count, :unpacked,
           {:message, Soulless.Tourney.Lq.Account.AchievementCount}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        account_id: {1, {:scalar, 0}, :uint32},
        achievement_count:
          {28, :unpacked, {:message, Soulless.Tourney.Lq.Account.AchievementCount}},
        anti_addiction: {6, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AntiAddiction}},
        avatar_frame: {23, {:scalar, 0}, :uint32},
        avatar_id: {13, {:scalar, 0}, :uint32},
        birthday: {15, {:scalar, 0}, :int32},
        challenge_levels: {27, :unpacked, {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}},
        diamond: {12, {:scalar, 0}, :uint32},
        email: {9, {:scalar, ""}, :string},
        email_verify: {10, {:scalar, 0}, :uint32},
        gold: {11, {:scalar, 0}, :uint32},
        level: {21, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        level3: {22, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountLevel}},
        login_time: {3, {:scalar, 0}, :uint32},
        logout_time: {4, {:scalar, 0}, :uint32},
        nickname: {2, {:scalar, ""}, :string},
        phone: {16, {:scalar, ""}, :string},
        phone_verify: {17, {:scalar, 0}, :uint32},
        platform_diamond:
          {18, :unpacked, {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}},
        platform_skin_ticket:
          {25, :unpacked, {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}},
        room_id: {5, {:scalar, 0}, :uint32},
        signature: {8, {:scalar, ""}, :string},
        skin_ticket: {24, {:scalar, 0}, :uint32},
        title: {7, {:scalar, 0}, :uint32},
        verified: {26, {:scalar, 0}, :uint32},
        vip: {14, {:scalar, 0}, :uint32}
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
          json_name: "nickname",
          kind: {:scalar, ""},
          label: :optional,
          name: :nickname,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "loginTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :login_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "logoutTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :logout_time,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "roomId",
          kind: {:scalar, 0},
          label: :optional,
          name: :room_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "antiAddiction",
          kind: {:scalar, nil},
          label: :optional,
          name: :anti_addiction,
          tag: 6,
          type: {:message, Soulless.Tourney.Lq.AntiAddiction}
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, 0},
          label: :optional,
          name: :title,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "signature",
          kind: {:scalar, ""},
          label: :optional,
          name: :signature,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "email",
          kind: {:scalar, ""},
          label: :optional,
          name: :email,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "emailVerify",
          kind: {:scalar, 0},
          label: :optional,
          name: :email_verify,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gold",
          kind: {:scalar, 0},
          label: :optional,
          name: :gold,
          tag: 11,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "diamond",
          kind: {:scalar, 0},
          label: :optional,
          name: :diamond,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarId",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_id,
          tag: 13,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "vip",
          kind: {:scalar, 0},
          label: :optional,
          name: :vip,
          tag: 14,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "birthday",
          kind: {:scalar, 0},
          label: :optional,
          name: :birthday,
          tag: 15,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "phone",
          kind: {:scalar, ""},
          label: :optional,
          name: :phone,
          tag: 16,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "phoneVerify",
          kind: {:scalar, 0},
          label: :optional,
          name: :phone_verify,
          tag: 17,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "platformDiamond",
          kind: :unpacked,
          label: :repeated,
          name: :platform_diamond,
          tag: 18,
          type: {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, nil},
          label: :optional,
          name: :level,
          tag: 21,
          type: {:message, Soulless.Tourney.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level3",
          kind: {:scalar, nil},
          label: :optional,
          name: :level3,
          tag: 22,
          type: {:message, Soulless.Tourney.Lq.AccountLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "avatarFrame",
          kind: {:scalar, 0},
          label: :optional,
          name: :avatar_frame,
          tag: 23,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "skinTicket",
          kind: {:scalar, 0},
          label: :optional,
          name: :skin_ticket,
          tag: 24,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "platformSkinTicket",
          kind: :unpacked,
          label: :repeated,
          name: :platform_skin_ticket,
          tag: 25,
          type: {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}
        },
        %{
          __struct__: Protox.Field,
          json_name: "verified",
          kind: {:scalar, 0},
          label: :optional,
          name: :verified,
          tag: 26,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "challengeLevels",
          kind: :unpacked,
          label: :repeated,
          name: :challenge_levels,
          tag: 27,
          type: {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}
        },
        %{
          __struct__: Protox.Field,
          json_name: "achievementCount",
          kind: :unpacked,
          label: :repeated,
          name: :achievement_count,
          tag: 28,
          type: {:message, Soulless.Tourney.Lq.Account.AchievementCount}
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
        def(field_def(:nickname)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "nickname",
             kind: {:scalar, ""},
             label: :optional,
             name: :nickname,
             tag: 2,
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
             tag: 2,
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
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
             tag: 4,
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
             tag: 4,
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
             tag: 4,
             type: :uint32
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
             tag: 5,
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
             tag: 5,
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
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:anti_addiction)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "antiAddiction",
             kind: {:scalar, nil},
             label: :optional,
             name: :anti_addiction,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AntiAddiction}
           }}
        end

        def(field_def("antiAddiction")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "antiAddiction",
             kind: {:scalar, nil},
             label: :optional,
             name: :anti_addiction,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AntiAddiction}
           }}
        end

        def(field_def("anti_addiction")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "antiAddiction",
             kind: {:scalar, nil},
             label: :optional,
             name: :anti_addiction,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.AntiAddiction}
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
             tag: 7,
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
             tag: 7,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:signature)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signature",
             kind: {:scalar, ""},
             label: :optional,
             name: :signature,
             tag: 8,
             type: :string
           }}
        end

        def(field_def("signature")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signature",
             kind: {:scalar, ""},
             label: :optional,
             name: :signature,
             tag: 8,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:email)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "email",
             kind: {:scalar, ""},
             label: :optional,
             name: :email,
             tag: 9,
             type: :string
           }}
        end

        def(field_def("email")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "email",
             kind: {:scalar, ""},
             label: :optional,
             name: :email,
             tag: 9,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:email_verify)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emailVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :email_verify,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("emailVerify")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emailVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :email_verify,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("email_verify")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emailVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :email_verify,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:gold)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gold",
             kind: {:scalar, 0},
             label: :optional,
             name: :gold,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("gold")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gold",
             kind: {:scalar, 0},
             label: :optional,
             name: :gold,
             tag: 11,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:diamond)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "diamond",
             kind: {:scalar, 0},
             label: :optional,
             name: :diamond,
             tag: 12,
             type: :uint32
           }}
        end

        def(field_def("diamond")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "diamond",
             kind: {:scalar, 0},
             label: :optional,
             name: :diamond,
             tag: 12,
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
             tag: 13,
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
             tag: 13,
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
             tag: 13,
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
             tag: 14,
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
             tag: 14,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:birthday)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "birthday",
             kind: {:scalar, 0},
             label: :optional,
             name: :birthday,
             tag: 15,
             type: :int32
           }}
        end

        def(field_def("birthday")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "birthday",
             kind: {:scalar, 0},
             label: :optional,
             name: :birthday,
             tag: 15,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:phone)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phone",
             kind: {:scalar, ""},
             label: :optional,
             name: :phone,
             tag: 16,
             type: :string
           }}
        end

        def(field_def("phone")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phone",
             kind: {:scalar, ""},
             label: :optional,
             name: :phone,
             tag: 16,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:phone_verify)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phoneVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :phone_verify,
             tag: 17,
             type: :uint32
           }}
        end

        def(field_def("phoneVerify")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phoneVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :phone_verify,
             tag: 17,
             type: :uint32
           }}
        end

        def(field_def("phone_verify")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phoneVerify",
             kind: {:scalar, 0},
             label: :optional,
             name: :phone_verify,
             tag: 17,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:platform_diamond)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformDiamond",
             kind: :unpacked,
             label: :repeated,
             name: :platform_diamond,
             tag: 18,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}
           }}
        end

        def(field_def("platformDiamond")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformDiamond",
             kind: :unpacked,
             label: :repeated,
             name: :platform_diamond,
             tag: 18,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}
           }}
        end

        def(field_def("platform_diamond")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformDiamond",
             kind: :unpacked,
             label: :repeated,
             name: :platform_diamond,
             tag: 18,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformDiamond}
           }}
        end
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
             tag: 21,
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
             tag: 21,
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
             tag: 22,
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
             tag: 22,
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
             tag: 23,
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
             tag: 23,
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
             tag: 23,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:skin_ticket)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skinTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :skin_ticket,
             tag: 24,
             type: :uint32
           }}
        end

        def(field_def("skinTicket")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skinTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :skin_ticket,
             tag: 24,
             type: :uint32
           }}
        end

        def(field_def("skin_ticket")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skinTicket",
             kind: {:scalar, 0},
             label: :optional,
             name: :skin_ticket,
             tag: 24,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:platform_skin_ticket)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformSkinTicket",
             kind: :unpacked,
             label: :repeated,
             name: :platform_skin_ticket,
             tag: 25,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}
           }}
        end

        def(field_def("platformSkinTicket")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformSkinTicket",
             kind: :unpacked,
             label: :repeated,
             name: :platform_skin_ticket,
             tag: 25,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}
           }}
        end

        def(field_def("platform_skin_ticket")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platformSkinTicket",
             kind: :unpacked,
             label: :repeated,
             name: :platform_skin_ticket,
             tag: 25,
             type: {:message, Soulless.Tourney.Lq.Account.PlatformSkinTicket}
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
             tag: 26,
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
             tag: 26,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:challenge_levels)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeLevels",
             kind: :unpacked,
             label: :repeated,
             name: :challenge_levels,
             tag: 27,
             type: {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}
           }}
        end

        def(field_def("challengeLevels")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeLevels",
             kind: :unpacked,
             label: :repeated,
             name: :challenge_levels,
             tag: 27,
             type: {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}
           }}
        end

        def(field_def("challenge_levels")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "challengeLevels",
             kind: :unpacked,
             label: :repeated,
             name: :challenge_levels,
             tag: 27,
             type: {:message, Soulless.Tourney.Lq.Account.ChallengeLevel}
           }}
        end
      ),
      (
        def(field_def(:achievement_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievementCount",
             kind: :unpacked,
             label: :repeated,
             name: :achievement_count,
             tag: 28,
             type: {:message, Soulless.Tourney.Lq.Account.AchievementCount}
           }}
        end

        def(field_def("achievementCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievementCount",
             kind: :unpacked,
             label: :repeated,
             name: :achievement_count,
             tag: 28,
             type: {:message, Soulless.Tourney.Lq.Account.AchievementCount}
           }}
        end

        def(field_def("achievement_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievementCount",
             kind: :unpacked,
             label: :repeated,
             name: :achievement_count,
             tag: 28,
             type: {:message, Soulless.Tourney.Lq.Account.AchievementCount}
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
      def(default(:room_id)) do
        {:ok, 0}
      end,
      def(default(:anti_addiction)) do
        {:ok, nil}
      end,
      def(default(:title)) do
        {:ok, 0}
      end,
      def(default(:signature)) do
        {:ok, ""}
      end,
      def(default(:email)) do
        {:ok, ""}
      end,
      def(default(:email_verify)) do
        {:ok, 0}
      end,
      def(default(:gold)) do
        {:ok, 0}
      end,
      def(default(:diamond)) do
        {:ok, 0}
      end,
      def(default(:avatar_id)) do
        {:ok, 0}
      end,
      def(default(:vip)) do
        {:ok, 0}
      end,
      def(default(:birthday)) do
        {:ok, 0}
      end,
      def(default(:phone)) do
        {:ok, ""}
      end,
      def(default(:phone_verify)) do
        {:ok, 0}
      end,
      def(default(:platform_diamond)) do
        {:error, :no_default_value}
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
      def(default(:skin_ticket)) do
        {:ok, 0}
      end,
      def(default(:platform_skin_ticket)) do
        {:error, :no_default_value}
      end,
      def(default(:verified)) do
        {:ok, 0}
      end,
      def(default(:challenge_levels)) do
        {:error, :no_default_value}
      end,
      def(default(:achievement_count)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end