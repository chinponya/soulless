# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchInfo do
  @moduledoc false
  defstruct error: nil,
            server_time: nil,
            server_setting: nil,
            client_value: nil,
            friend_list: nil,
            friend_apply_list: nil,
            recent_friend: nil,
            mail_info: nil,
            receive_coin_info: nil,
            title_list: nil,
            bag_info: nil,
            shop_info: nil,
            shop_interval: nil,
            activity_data: nil,
            activity_interval: nil,
            activity_buff: nil,
            vip_reward: nil,
            month_ticket_info: nil,
            achievement: nil,
            comment_setting: nil,
            account_settings: nil,
            mod_nickname_time: nil,
            misc: nil,
            announcement: nil,
            rolling_notice: nil,
            activity_list: nil,
            character_info: nil,
            all_common_views: nil,
            collected_game_record_list: nil,
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
        |> encode_error(msg)
        |> encode_server_time(msg)
        |> encode_server_setting(msg)
        |> encode_client_value(msg)
        |> encode_friend_list(msg)
        |> encode_friend_apply_list(msg)
        |> encode_recent_friend(msg)
        |> encode_mail_info(msg)
        |> encode_receive_coin_info(msg)
        |> encode_title_list(msg)
        |> encode_bag_info(msg)
        |> encode_shop_info(msg)
        |> encode_shop_interval(msg)
        |> encode_activity_data(msg)
        |> encode_activity_interval(msg)
        |> encode_activity_buff(msg)
        |> encode_vip_reward(msg)
        |> encode_month_ticket_info(msg)
        |> encode_achievement(msg)
        |> encode_comment_setting(msg)
        |> encode_account_settings(msg)
        |> encode_mod_nickname_time(msg)
        |> encode_misc(msg)
        |> encode_announcement(msg)
        |> encode_rolling_notice(msg)
        |> encode_activity_list(msg)
        |> encode_character_info(msg)
        |> encode_all_common_views(msg)
        |> encode_collected_game_record_list(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_server_time(acc, msg) do
        try do
          if msg.server_time == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.server_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:server_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_server_setting(acc, msg) do
        try do
          if msg.server_setting == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.server_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:server_setting, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_client_value(acc, msg) do
        try do
          if msg.client_value == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.client_value)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:client_value, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_friend_list(acc, msg) do
        try do
          if msg.friend_list == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.friend_list)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:friend_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_friend_apply_list(acc, msg) do
        try do
          if msg.friend_apply_list == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.friend_apply_list)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:friend_apply_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_recent_friend(acc, msg) do
        try do
          if msg.recent_friend == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.recent_friend)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:recent_friend, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_mail_info(acc, msg) do
        try do
          if msg.mail_info == nil do
            acc
          else
            [acc, "B", Protox.Encode.encode_message(msg.mail_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mail_info, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_receive_coin_info(acc, msg) do
        try do
          if msg.receive_coin_info == nil do
            acc
          else
            [acc, "J", Protox.Encode.encode_message(msg.receive_coin_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:receive_coin_info, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_title_list(acc, msg) do
        try do
          if msg.title_list == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.title_list)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bag_info(acc, msg) do
        try do
          if msg.bag_info == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.bag_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bag_info, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shop_info(acc, msg) do
        try do
          if msg.shop_info == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.shop_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shop_info, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shop_interval(acc, msg) do
        try do
          if msg.shop_interval == nil do
            acc
          else
            [acc, "j", Protox.Encode.encode_message(msg.shop_interval)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shop_interval, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_data(acc, msg) do
        try do
          if msg.activity_data == nil do
            acc
          else
            [acc, "r", Protox.Encode.encode_message(msg.activity_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_data, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_interval(acc, msg) do
        try do
          if msg.activity_interval == nil do
            acc
          else
            [acc, "z", Protox.Encode.encode_message(msg.activity_interval)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_interval, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_buff(acc, msg) do
        try do
          if msg.activity_buff == nil do
            acc
          else
            [acc, "\x82\x01", Protox.Encode.encode_message(msg.activity_buff)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_buff, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_vip_reward(acc, msg) do
        try do
          if msg.vip_reward == nil do
            acc
          else
            [acc, "\x8A\x01", Protox.Encode.encode_message(msg.vip_reward)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vip_reward, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_month_ticket_info(acc, msg) do
        try do
          if msg.month_ticket_info == nil do
            acc
          else
            [acc, "\x92\x01", Protox.Encode.encode_message(msg.month_ticket_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:month_ticket_info, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_achievement(acc, msg) do
        try do
          if msg.achievement == nil do
            acc
          else
            [acc, "\x9A\x01", Protox.Encode.encode_message(msg.achievement)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:achievement, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_comment_setting(acc, msg) do
        try do
          if msg.comment_setting == nil do
            acc
          else
            [acc, "\xA2\x01", Protox.Encode.encode_message(msg.comment_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:comment_setting, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_account_settings(acc, msg) do
        try do
          if msg.account_settings == nil do
            acc
          else
            [acc, "\xAA\x01", Protox.Encode.encode_message(msg.account_settings)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:account_settings, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_mod_nickname_time(acc, msg) do
        try do
          if msg.mod_nickname_time == nil do
            acc
          else
            [acc, "\xB2\x01", Protox.Encode.encode_message(msg.mod_nickname_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:mod_nickname_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_misc(acc, msg) do
        try do
          if msg.misc == nil do
            acc
          else
            [acc, "\xBA\x01", Protox.Encode.encode_message(msg.misc)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:misc, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_announcement(acc, msg) do
        try do
          if msg.announcement == nil do
            acc
          else
            [acc, "\xC2\x01", Protox.Encode.encode_message(msg.announcement)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:announcement, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rolling_notice(acc, msg) do
        try do
          if msg.rolling_notice == nil do
            acc
          else
            [acc, "\xCA\x01", Protox.Encode.encode_message(msg.rolling_notice)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rolling_notice, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_activity_list(acc, msg) do
        try do
          if msg.activity_list == nil do
            acc
          else
            [acc, "\xD2\x01", Protox.Encode.encode_message(msg.activity_list)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_character_info(acc, msg) do
        try do
          if msg.character_info == nil do
            acc
          else
            [acc, "\xDA\x01", Protox.Encode.encode_message(msg.character_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:character_info, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_all_common_views(acc, msg) do
        try do
          if msg.all_common_views == nil do
            acc
          else
            [acc, "\xE2\x01", Protox.Encode.encode_message(msg.all_common_views)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:all_common_views, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_collected_game_record_list(acc, msg) do
        try do
          if msg.collected_game_record_list == nil do
            acc
          else
            [acc, "\xEA\x01", Protox.Encode.encode_message(msg.collected_game_record_list)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:collected_game_record_list, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResFetchInfo))
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
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 server_time:
                   Protox.MergeMessage.merge(
                     msg.server_time,
                     Soulless.Game.Lq.ResServerTime.decode!(delimited)
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 server_setting:
                   Protox.MergeMessage.merge(
                     msg.server_setting,
                     Soulless.Game.Lq.ResServerSettings.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 client_value:
                   Protox.MergeMessage.merge(
                     msg.client_value,
                     Soulless.Game.Lq.ResClientValue.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 friend_list:
                   Protox.MergeMessage.merge(
                     msg.friend_list,
                     Soulless.Game.Lq.ResFriendList.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 friend_apply_list:
                   Protox.MergeMessage.merge(
                     msg.friend_apply_list,
                     Soulless.Game.Lq.ResFriendApplyList.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 recent_friend:
                   Protox.MergeMessage.merge(
                     msg.recent_friend,
                     Soulless.Game.Lq.ResFetchrecentFriend.decode!(delimited)
                   )
               ], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 mail_info:
                   Protox.MergeMessage.merge(
                     msg.mail_info,
                     Soulless.Game.Lq.ResMailInfo.decode!(delimited)
                   )
               ], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 receive_coin_info:
                   Protox.MergeMessage.merge(
                     msg.receive_coin_info,
                     Soulless.Game.Lq.ResReviveCoinInfo.decode!(delimited)
                   )
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 title_list:
                   Protox.MergeMessage.merge(
                     msg.title_list,
                     Soulless.Game.Lq.ResTitleList.decode!(delimited)
                   )
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 bag_info:
                   Protox.MergeMessage.merge(
                     msg.bag_info,
                     Soulless.Game.Lq.ResBagInfo.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 shop_info:
                   Protox.MergeMessage.merge(
                     msg.shop_info,
                     Soulless.Game.Lq.ResShopInfo.decode!(delimited)
                   )
               ], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 shop_interval:
                   Protox.MergeMessage.merge(
                     msg.shop_interval,
                     Soulless.Game.Lq.ResFetchShopInterval.decode!(delimited)
                   )
               ], rest}

            {14, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_data:
                   Protox.MergeMessage.merge(
                     msg.activity_data,
                     Soulless.Game.Lq.ResAccountActivityData.decode!(delimited)
                   )
               ], rest}

            {15, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_interval:
                   Protox.MergeMessage.merge(
                     msg.activity_interval,
                     Soulless.Game.Lq.ResFetchActivityInterval.decode!(delimited)
                   )
               ], rest}

            {16, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_buff:
                   Protox.MergeMessage.merge(
                     msg.activity_buff,
                     Soulless.Game.Lq.ResActivityBuff.decode!(delimited)
                   )
               ], rest}

            {17, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 vip_reward:
                   Protox.MergeMessage.merge(
                     msg.vip_reward,
                     Soulless.Game.Lq.ResVipReward.decode!(delimited)
                   )
               ], rest}

            {18, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 month_ticket_info:
                   Protox.MergeMessage.merge(
                     msg.month_ticket_info,
                     Soulless.Game.Lq.ResMonthTicketInfo.decode!(delimited)
                   )
               ], rest}

            {19, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 achievement:
                   Protox.MergeMessage.merge(
                     msg.achievement,
                     Soulless.Game.Lq.ResAchievement.decode!(delimited)
                   )
               ], rest}

            {20, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 comment_setting:
                   Protox.MergeMessage.merge(
                     msg.comment_setting,
                     Soulless.Game.Lq.ResCommentSetting.decode!(delimited)
                   )
               ], rest}

            {21, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 account_settings:
                   Protox.MergeMessage.merge(
                     msg.account_settings,
                     Soulless.Game.Lq.ResAccountSettings.decode!(delimited)
                   )
               ], rest}

            {22, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 mod_nickname_time:
                   Protox.MergeMessage.merge(
                     msg.mod_nickname_time,
                     Soulless.Game.Lq.ResModNicknameTime.decode!(delimited)
                   )
               ], rest}

            {23, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 misc:
                   Protox.MergeMessage.merge(
                     msg.misc,
                     Soulless.Game.Lq.ResMisc.decode!(delimited)
                   )
               ], rest}

            {24, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 announcement:
                   Protox.MergeMessage.merge(
                     msg.announcement,
                     Soulless.Game.Lq.ResAnnouncement.decode!(delimited)
                   )
               ], rest}

            {25, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 rolling_notice:
                   Protox.MergeMessage.merge(
                     msg.rolling_notice,
                     Soulless.Game.Lq.ReqRollingNotice.decode!(delimited)
                   )
               ], rest}

            {26, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 activity_list:
                   Protox.MergeMessage.merge(
                     msg.activity_list,
                     Soulless.Game.Lq.ResActivityList.decode!(delimited)
                   )
               ], rest}

            {27, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 character_info:
                   Protox.MergeMessage.merge(
                     msg.character_info,
                     Soulless.Game.Lq.ResCharacterInfo.decode!(delimited)
                   )
               ], rest}

            {28, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 all_common_views:
                   Protox.MergeMessage.merge(
                     msg.all_common_views,
                     Soulless.Game.Lq.ResAllcommonViews.decode!(delimited)
                   )
               ], rest}

            {29, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 collected_game_record_list:
                   Protox.MergeMessage.merge(
                     msg.collected_game_record_list,
                     Soulless.Game.Lq.ResCollectedGameRecordList.decode!(delimited)
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
        Soulless.Game.Lq.ResFetchInfo,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:server_time, {:scalar, nil}, {:message, Soulless.Game.Lq.ResServerTime}},
        3 => {:server_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.ResServerSettings}},
        4 => {:client_value, {:scalar, nil}, {:message, Soulless.Game.Lq.ResClientValue}},
        5 => {:friend_list, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFriendList}},
        6 =>
          {:friend_apply_list, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFriendApplyList}},
        7 => {:recent_friend, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchrecentFriend}},
        8 => {:mail_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMailInfo}},
        9 => {:receive_coin_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResReviveCoinInfo}},
        10 => {:title_list, {:scalar, nil}, {:message, Soulless.Game.Lq.ResTitleList}},
        11 => {:bag_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResBagInfo}},
        12 => {:shop_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResShopInfo}},
        13 => {:shop_interval, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchShopInterval}},
        14 =>
          {:activity_data, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAccountActivityData}},
        15 =>
          {:activity_interval, {:scalar, nil},
           {:message, Soulless.Game.Lq.ResFetchActivityInterval}},
        16 => {:activity_buff, {:scalar, nil}, {:message, Soulless.Game.Lq.ResActivityBuff}},
        17 => {:vip_reward, {:scalar, nil}, {:message, Soulless.Game.Lq.ResVipReward}},
        18 =>
          {:month_ticket_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMonthTicketInfo}},
        19 => {:achievement, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAchievement}},
        20 => {:comment_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.ResCommentSetting}},
        21 =>
          {:account_settings, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAccountSettings}},
        22 =>
          {:mod_nickname_time, {:scalar, nil}, {:message, Soulless.Game.Lq.ResModNicknameTime}},
        23 => {:misc, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMisc}},
        24 => {:announcement, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAnnouncement}},
        25 => {:rolling_notice, {:scalar, nil}, {:message, Soulless.Game.Lq.ReqRollingNotice}},
        26 => {:activity_list, {:scalar, nil}, {:message, Soulless.Game.Lq.ResActivityList}},
        27 => {:character_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ResCharacterInfo}},
        28 => {:all_common_views, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAllcommonViews}},
        29 =>
          {:collected_game_record_list, {:scalar, nil},
           {:message, Soulless.Game.Lq.ResCollectedGameRecordList}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_settings: {21, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAccountSettings}},
        achievement: {19, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAchievement}},
        activity_buff: {16, {:scalar, nil}, {:message, Soulless.Game.Lq.ResActivityBuff}},
        activity_data: {14, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAccountActivityData}},
        activity_interval:
          {15, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchActivityInterval}},
        activity_list: {26, {:scalar, nil}, {:message, Soulless.Game.Lq.ResActivityList}},
        all_common_views: {28, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAllcommonViews}},
        announcement: {24, {:scalar, nil}, {:message, Soulless.Game.Lq.ResAnnouncement}},
        bag_info: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.ResBagInfo}},
        character_info: {27, {:scalar, nil}, {:message, Soulless.Game.Lq.ResCharacterInfo}},
        client_value: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.ResClientValue}},
        collected_game_record_list:
          {29, {:scalar, nil}, {:message, Soulless.Game.Lq.ResCollectedGameRecordList}},
        comment_setting: {20, {:scalar, nil}, {:message, Soulless.Game.Lq.ResCommentSetting}},
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        friend_apply_list: {6, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFriendApplyList}},
        friend_list: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFriendList}},
        mail_info: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMailInfo}},
        misc: {23, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMisc}},
        mod_nickname_time: {22, {:scalar, nil}, {:message, Soulless.Game.Lq.ResModNicknameTime}},
        month_ticket_info: {18, {:scalar, nil}, {:message, Soulless.Game.Lq.ResMonthTicketInfo}},
        receive_coin_info: {9, {:scalar, nil}, {:message, Soulless.Game.Lq.ResReviveCoinInfo}},
        recent_friend: {7, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchrecentFriend}},
        rolling_notice: {25, {:scalar, nil}, {:message, Soulless.Game.Lq.ReqRollingNotice}},
        server_setting: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.ResServerSettings}},
        server_time: {2, {:scalar, nil}, {:message, Soulless.Game.Lq.ResServerTime}},
        shop_info: {12, {:scalar, nil}, {:message, Soulless.Game.Lq.ResShopInfo}},
        shop_interval: {13, {:scalar, nil}, {:message, Soulless.Game.Lq.ResFetchShopInterval}},
        title_list: {10, {:scalar, nil}, {:message, Soulless.Game.Lq.ResTitleList}},
        vip_reward: {17, {:scalar, nil}, {:message, Soulless.Game.Lq.ResVipReward}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Game.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "serverTime",
          kind: {:scalar, nil},
          label: :optional,
          name: :server_time,
          tag: 2,
          type: {:message, Soulless.Game.Lq.ResServerTime}
        },
        %{
          __struct__: Protox.Field,
          json_name: "serverSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :server_setting,
          tag: 3,
          type: {:message, Soulless.Game.Lq.ResServerSettings}
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientValue",
          kind: {:scalar, nil},
          label: :optional,
          name: :client_value,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ResClientValue}
        },
        %{
          __struct__: Protox.Field,
          json_name: "friendList",
          kind: {:scalar, nil},
          label: :optional,
          name: :friend_list,
          tag: 5,
          type: {:message, Soulless.Game.Lq.ResFriendList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "friendApplyList",
          kind: {:scalar, nil},
          label: :optional,
          name: :friend_apply_list,
          tag: 6,
          type: {:message, Soulless.Game.Lq.ResFriendApplyList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recentFriend",
          kind: {:scalar, nil},
          label: :optional,
          name: :recent_friend,
          tag: 7,
          type: {:message, Soulless.Game.Lq.ResFetchrecentFriend}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mailInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :mail_info,
          tag: 8,
          type: {:message, Soulless.Game.Lq.ResMailInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "receiveCoinInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :receive_coin_info,
          tag: 9,
          type: {:message, Soulless.Game.Lq.ResReviveCoinInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "titleList",
          kind: {:scalar, nil},
          label: :optional,
          name: :title_list,
          tag: 10,
          type: {:message, Soulless.Game.Lq.ResTitleList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "bagInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :bag_info,
          tag: 11,
          type: {:message, Soulless.Game.Lq.ResBagInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shopInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :shop_info,
          tag: 12,
          type: {:message, Soulless.Game.Lq.ResShopInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shopInterval",
          kind: {:scalar, nil},
          label: :optional,
          name: :shop_interval,
          tag: 13,
          type: {:message, Soulless.Game.Lq.ResFetchShopInterval}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityData",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_data,
          tag: 14,
          type: {:message, Soulless.Game.Lq.ResAccountActivityData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityInterval",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_interval,
          tag: 15,
          type: {:message, Soulless.Game.Lq.ResFetchActivityInterval}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityBuff",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_buff,
          tag: 16,
          type: {:message, Soulless.Game.Lq.ResActivityBuff}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vipReward",
          kind: {:scalar, nil},
          label: :optional,
          name: :vip_reward,
          tag: 17,
          type: {:message, Soulless.Game.Lq.ResVipReward}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthTicketInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :month_ticket_info,
          tag: 18,
          type: {:message, Soulless.Game.Lq.ResMonthTicketInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "achievement",
          kind: {:scalar, nil},
          label: :optional,
          name: :achievement,
          tag: 19,
          type: {:message, Soulless.Game.Lq.ResAchievement}
        },
        %{
          __struct__: Protox.Field,
          json_name: "commentSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :comment_setting,
          tag: 20,
          type: {:message, Soulless.Game.Lq.ResCommentSetting}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountSettings",
          kind: {:scalar, nil},
          label: :optional,
          name: :account_settings,
          tag: 21,
          type: {:message, Soulless.Game.Lq.ResAccountSettings}
        },
        %{
          __struct__: Protox.Field,
          json_name: "modNicknameTime",
          kind: {:scalar, nil},
          label: :optional,
          name: :mod_nickname_time,
          tag: 22,
          type: {:message, Soulless.Game.Lq.ResModNicknameTime}
        },
        %{
          __struct__: Protox.Field,
          json_name: "misc",
          kind: {:scalar, nil},
          label: :optional,
          name: :misc,
          tag: 23,
          type: {:message, Soulless.Game.Lq.ResMisc}
        },
        %{
          __struct__: Protox.Field,
          json_name: "announcement",
          kind: {:scalar, nil},
          label: :optional,
          name: :announcement,
          tag: 24,
          type: {:message, Soulless.Game.Lq.ResAnnouncement}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rollingNotice",
          kind: {:scalar, nil},
          label: :optional,
          name: :rolling_notice,
          tag: 25,
          type: {:message, Soulless.Game.Lq.ReqRollingNotice}
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityList",
          kind: {:scalar, nil},
          label: :optional,
          name: :activity_list,
          tag: 26,
          type: {:message, Soulless.Game.Lq.ResActivityList}
        },
        %{
          __struct__: Protox.Field,
          json_name: "characterInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :character_info,
          tag: 27,
          type: {:message, Soulless.Game.Lq.ResCharacterInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "allCommonViews",
          kind: {:scalar, nil},
          label: :optional,
          name: :all_common_views,
          tag: 28,
          type: {:message, Soulless.Game.Lq.ResAllcommonViews}
        },
        %{
          __struct__: Protox.Field,
          json_name: "collectedGameRecordList",
          kind: {:scalar, nil},
          label: :optional,
          name: :collected_game_record_list,
          tag: 29,
          type: {:message, Soulless.Game.Lq.ResCollectedGameRecordList}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:server_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_time,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ResServerTime}
           }}
        end

        def field_def("serverTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_time,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ResServerTime}
           }}
        end

        def field_def("server_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_time,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ResServerTime}
           }}
        end
      ),
      (
        def field_def(:server_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ResServerSettings}
           }}
        end

        def field_def("serverSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ResServerSettings}
           }}
        end

        def field_def("server_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "serverSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :server_setting,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ResServerSettings}
           }}
        end
      ),
      (
        def field_def(:client_value) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_value,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResClientValue}
           }}
        end

        def field_def("clientValue") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_value,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResClientValue}
           }}
        end

        def field_def("client_value") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientValue",
             kind: {:scalar, nil},
             label: :optional,
             name: :client_value,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ResClientValue}
           }}
        end
      ),
      (
        def field_def(:friend_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_list,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResFriendList}
           }}
        end

        def field_def("friendList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_list,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResFriendList}
           }}
        end

        def field_def("friend_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_list,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResFriendList}
           }}
        end
      ),
      (
        def field_def(:friend_apply_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendApplyList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_apply_list,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ResFriendApplyList}
           }}
        end

        def field_def("friendApplyList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendApplyList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_apply_list,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ResFriendApplyList}
           }}
        end

        def field_def("friend_apply_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendApplyList",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_apply_list,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ResFriendApplyList}
           }}
        end
      ),
      (
        def field_def(:recent_friend) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentFriend",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_friend,
             tag: 7,
             type: {:message, Soulless.Game.Lq.ResFetchrecentFriend}
           }}
        end

        def field_def("recentFriend") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentFriend",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_friend,
             tag: 7,
             type: {:message, Soulless.Game.Lq.ResFetchrecentFriend}
           }}
        end

        def field_def("recent_friend") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recentFriend",
             kind: {:scalar, nil},
             label: :optional,
             name: :recent_friend,
             tag: 7,
             type: {:message, Soulless.Game.Lq.ResFetchrecentFriend}
           }}
        end
      ),
      (
        def field_def(:mail_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :mail_info,
             tag: 8,
             type: {:message, Soulless.Game.Lq.ResMailInfo}
           }}
        end

        def field_def("mailInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :mail_info,
             tag: 8,
             type: {:message, Soulless.Game.Lq.ResMailInfo}
           }}
        end

        def field_def("mail_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mailInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :mail_info,
             tag: 8,
             type: {:message, Soulless.Game.Lq.ResMailInfo}
           }}
        end
      ),
      (
        def field_def(:receive_coin_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receiveCoinInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :receive_coin_info,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ResReviveCoinInfo}
           }}
        end

        def field_def("receiveCoinInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receiveCoinInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :receive_coin_info,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ResReviveCoinInfo}
           }}
        end

        def field_def("receive_coin_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receiveCoinInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :receive_coin_info,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ResReviveCoinInfo}
           }}
        end
      ),
      (
        def field_def(:title_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleList",
             kind: {:scalar, nil},
             label: :optional,
             name: :title_list,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ResTitleList}
           }}
        end

        def field_def("titleList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleList",
             kind: {:scalar, nil},
             label: :optional,
             name: :title_list,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ResTitleList}
           }}
        end

        def field_def("title_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "titleList",
             kind: {:scalar, nil},
             label: :optional,
             name: :title_list,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ResTitleList}
           }}
        end
      ),
      (
        def field_def(:bag_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :bag_info,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ResBagInfo}
           }}
        end

        def field_def("bagInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :bag_info,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ResBagInfo}
           }}
        end

        def field_def("bag_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :bag_info,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ResBagInfo}
           }}
        end
      ),
      (
        def field_def(:shop_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 12,
             type: {:message, Soulless.Game.Lq.ResShopInfo}
           }}
        end

        def field_def("shopInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 12,
             type: {:message, Soulless.Game.Lq.ResShopInfo}
           }}
        end

        def field_def("shop_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 12,
             type: {:message, Soulless.Game.Lq.ResShopInfo}
           }}
        end
      ),
      (
        def field_def(:shop_interval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_interval,
             tag: 13,
             type: {:message, Soulless.Game.Lq.ResFetchShopInterval}
           }}
        end

        def field_def("shopInterval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_interval,
             tag: 13,
             type: {:message, Soulless.Game.Lq.ResFetchShopInterval}
           }}
        end

        def field_def("shop_interval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_interval,
             tag: 13,
             type: {:message, Soulless.Game.Lq.ResFetchShopInterval}
           }}
        end
      ),
      (
        def field_def(:activity_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityData",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_data,
             tag: 14,
             type: {:message, Soulless.Game.Lq.ResAccountActivityData}
           }}
        end

        def field_def("activityData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityData",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_data,
             tag: 14,
             type: {:message, Soulless.Game.Lq.ResAccountActivityData}
           }}
        end

        def field_def("activity_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityData",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_data,
             tag: 14,
             type: {:message, Soulless.Game.Lq.ResAccountActivityData}
           }}
        end
      ),
      (
        def field_def(:activity_interval) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_interval,
             tag: 15,
             type: {:message, Soulless.Game.Lq.ResFetchActivityInterval}
           }}
        end

        def field_def("activityInterval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_interval,
             tag: 15,
             type: {:message, Soulless.Game.Lq.ResFetchActivityInterval}
           }}
        end

        def field_def("activity_interval") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityInterval",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_interval,
             tag: 15,
             type: {:message, Soulless.Game.Lq.ResFetchActivityInterval}
           }}
        end
      ),
      (
        def field_def(:activity_buff) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityBuff",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_buff,
             tag: 16,
             type: {:message, Soulless.Game.Lq.ResActivityBuff}
           }}
        end

        def field_def("activityBuff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityBuff",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_buff,
             tag: 16,
             type: {:message, Soulless.Game.Lq.ResActivityBuff}
           }}
        end

        def field_def("activity_buff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityBuff",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_buff,
             tag: 16,
             type: {:message, Soulless.Game.Lq.ResActivityBuff}
           }}
        end
      ),
      (
        def field_def(:vip_reward) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipReward",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward,
             tag: 17,
             type: {:message, Soulless.Game.Lq.ResVipReward}
           }}
        end

        def field_def("vipReward") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipReward",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward,
             tag: 17,
             type: {:message, Soulless.Game.Lq.ResVipReward}
           }}
        end

        def field_def("vip_reward") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipReward",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward,
             tag: 17,
             type: {:message, Soulless.Game.Lq.ResVipReward}
           }}
        end
      ),
      (
        def field_def(:month_ticket_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_info,
             tag: 18,
             type: {:message, Soulless.Game.Lq.ResMonthTicketInfo}
           }}
        end

        def field_def("monthTicketInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_info,
             tag: 18,
             type: {:message, Soulless.Game.Lq.ResMonthTicketInfo}
           }}
        end

        def field_def("month_ticket_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_info,
             tag: 18,
             type: {:message, Soulless.Game.Lq.ResMonthTicketInfo}
           }}
        end
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
             tag: 19,
             type: {:message, Soulless.Game.Lq.ResAchievement}
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
             tag: 19,
             type: {:message, Soulless.Game.Lq.ResAchievement}
           }}
        end

        []
      ),
      (
        def field_def(:comment_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :comment_setting,
             tag: 20,
             type: {:message, Soulless.Game.Lq.ResCommentSetting}
           }}
        end

        def field_def("commentSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :comment_setting,
             tag: 20,
             type: {:message, Soulless.Game.Lq.ResCommentSetting}
           }}
        end

        def field_def("comment_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :comment_setting,
             tag: 20,
             type: {:message, Soulless.Game.Lq.ResCommentSetting}
           }}
        end
      ),
      (
        def field_def(:account_settings) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountSettings",
             kind: {:scalar, nil},
             label: :optional,
             name: :account_settings,
             tag: 21,
             type: {:message, Soulless.Game.Lq.ResAccountSettings}
           }}
        end

        def field_def("accountSettings") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountSettings",
             kind: {:scalar, nil},
             label: :optional,
             name: :account_settings,
             tag: 21,
             type: {:message, Soulless.Game.Lq.ResAccountSettings}
           }}
        end

        def field_def("account_settings") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountSettings",
             kind: {:scalar, nil},
             label: :optional,
             name: :account_settings,
             tag: 21,
             type: {:message, Soulless.Game.Lq.ResAccountSettings}
           }}
        end
      ),
      (
        def field_def(:mod_nickname_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modNicknameTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :mod_nickname_time,
             tag: 22,
             type: {:message, Soulless.Game.Lq.ResModNicknameTime}
           }}
        end

        def field_def("modNicknameTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modNicknameTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :mod_nickname_time,
             tag: 22,
             type: {:message, Soulless.Game.Lq.ResModNicknameTime}
           }}
        end

        def field_def("mod_nickname_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modNicknameTime",
             kind: {:scalar, nil},
             label: :optional,
             name: :mod_nickname_time,
             tag: 22,
             type: {:message, Soulless.Game.Lq.ResModNicknameTime}
           }}
        end
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
             tag: 23,
             type: {:message, Soulless.Game.Lq.ResMisc}
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
             tag: 23,
             type: {:message, Soulless.Game.Lq.ResMisc}
           }}
        end

        []
      ),
      (
        def field_def(:announcement) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "announcement",
             kind: {:scalar, nil},
             label: :optional,
             name: :announcement,
             tag: 24,
             type: {:message, Soulless.Game.Lq.ResAnnouncement}
           }}
        end

        def field_def("announcement") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "announcement",
             kind: {:scalar, nil},
             label: :optional,
             name: :announcement,
             tag: 24,
             type: {:message, Soulless.Game.Lq.ResAnnouncement}
           }}
        end

        []
      ),
      (
        def field_def(:rolling_notice) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rollingNotice",
             kind: {:scalar, nil},
             label: :optional,
             name: :rolling_notice,
             tag: 25,
             type: {:message, Soulless.Game.Lq.ReqRollingNotice}
           }}
        end

        def field_def("rollingNotice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rollingNotice",
             kind: {:scalar, nil},
             label: :optional,
             name: :rolling_notice,
             tag: 25,
             type: {:message, Soulless.Game.Lq.ReqRollingNotice}
           }}
        end

        def field_def("rolling_notice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rollingNotice",
             kind: {:scalar, nil},
             label: :optional,
             name: :rolling_notice,
             tag: 25,
             type: {:message, Soulless.Game.Lq.ReqRollingNotice}
           }}
        end
      ),
      (
        def field_def(:activity_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityList",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_list,
             tag: 26,
             type: {:message, Soulless.Game.Lq.ResActivityList}
           }}
        end

        def field_def("activityList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityList",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_list,
             tag: 26,
             type: {:message, Soulless.Game.Lq.ResActivityList}
           }}
        end

        def field_def("activity_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityList",
             kind: {:scalar, nil},
             label: :optional,
             name: :activity_list,
             tag: 26,
             type: {:message, Soulless.Game.Lq.ResActivityList}
           }}
        end
      ),
      (
        def field_def(:character_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_info,
             tag: 27,
             type: {:message, Soulless.Game.Lq.ResCharacterInfo}
           }}
        end

        def field_def("characterInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_info,
             tag: 27,
             type: {:message, Soulless.Game.Lq.ResCharacterInfo}
           }}
        end

        def field_def("character_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "characterInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :character_info,
             tag: 27,
             type: {:message, Soulless.Game.Lq.ResCharacterInfo}
           }}
        end
      ),
      (
        def field_def(:all_common_views) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "allCommonViews",
             kind: {:scalar, nil},
             label: :optional,
             name: :all_common_views,
             tag: 28,
             type: {:message, Soulless.Game.Lq.ResAllcommonViews}
           }}
        end

        def field_def("allCommonViews") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "allCommonViews",
             kind: {:scalar, nil},
             label: :optional,
             name: :all_common_views,
             tag: 28,
             type: {:message, Soulless.Game.Lq.ResAllcommonViews}
           }}
        end

        def field_def("all_common_views") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "allCommonViews",
             kind: {:scalar, nil},
             label: :optional,
             name: :all_common_views,
             tag: 28,
             type: {:message, Soulless.Game.Lq.ResAllcommonViews}
           }}
        end
      ),
      (
        def field_def(:collected_game_record_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collectedGameRecordList",
             kind: {:scalar, nil},
             label: :optional,
             name: :collected_game_record_list,
             tag: 29,
             type: {:message, Soulless.Game.Lq.ResCollectedGameRecordList}
           }}
        end

        def field_def("collectedGameRecordList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collectedGameRecordList",
             kind: {:scalar, nil},
             label: :optional,
             name: :collected_game_record_list,
             tag: 29,
             type: {:message, Soulless.Game.Lq.ResCollectedGameRecordList}
           }}
        end

        def field_def("collected_game_record_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "collectedGameRecordList",
             kind: {:scalar, nil},
             label: :optional,
             name: :collected_game_record_list,
             tag: 29,
             type: {:message, Soulless.Game.Lq.ResCollectedGameRecordList}
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
    def default(:error) do
      {:ok, nil}
    end,
    def default(:server_time) do
      {:ok, nil}
    end,
    def default(:server_setting) do
      {:ok, nil}
    end,
    def default(:client_value) do
      {:ok, nil}
    end,
    def default(:friend_list) do
      {:ok, nil}
    end,
    def default(:friend_apply_list) do
      {:ok, nil}
    end,
    def default(:recent_friend) do
      {:ok, nil}
    end,
    def default(:mail_info) do
      {:ok, nil}
    end,
    def default(:receive_coin_info) do
      {:ok, nil}
    end,
    def default(:title_list) do
      {:ok, nil}
    end,
    def default(:bag_info) do
      {:ok, nil}
    end,
    def default(:shop_info) do
      {:ok, nil}
    end,
    def default(:shop_interval) do
      {:ok, nil}
    end,
    def default(:activity_data) do
      {:ok, nil}
    end,
    def default(:activity_interval) do
      {:ok, nil}
    end,
    def default(:activity_buff) do
      {:ok, nil}
    end,
    def default(:vip_reward) do
      {:ok, nil}
    end,
    def default(:month_ticket_info) do
      {:ok, nil}
    end,
    def default(:achievement) do
      {:ok, nil}
    end,
    def default(:comment_setting) do
      {:ok, nil}
    end,
    def default(:account_settings) do
      {:ok, nil}
    end,
    def default(:mod_nickname_time) do
      {:ok, nil}
    end,
    def default(:misc) do
      {:ok, nil}
    end,
    def default(:announcement) do
      {:ok, nil}
    end,
    def default(:rolling_notice) do
      {:ok, nil}
    end,
    def default(:activity_list) do
      {:ok, nil}
    end,
    def default(:character_info) do
      {:ok, nil}
    end,
    def default(:all_common_views) do
      {:ok, nil}
    end,
    def default(:collected_game_record_list) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end