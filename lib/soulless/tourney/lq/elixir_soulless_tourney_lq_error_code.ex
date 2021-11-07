# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.ErrorCode) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :OK
      def(default()) do
        :OK
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:OK)) do
          0
        end

        def(encode("OK")) do
          0
        end
      ),
      (
        def(encode(:UNKNOWN)) do
          1
        end

        def(encode("UNKNOWN")) do
          1
        end
      ),
      (
        def(encode(:SYSTEM_ERROR)) do
          2
        end

        def(encode("SYSTEM_ERROR")) do
          2
        end
      ),
      (
        def(encode(:CLIENT_PACKET_PARAM)) do
          3
        end

        def(encode("CLIENT_PACKET_PARAM")) do
          3
        end
      ),
      (
        def(encode(:NOT_DEVELOPMENT_MODE)) do
          4
        end

        def(encode("NOT_DEVELOPMENT_MODE")) do
          4
        end
      ),
      (
        def(encode(:SYSTEM_COMMUNICATION)) do
          5
        end

        def(encode("SYSTEM_COMMUNICATION")) do
          5
        end
      ),
      (
        def(encode(:METHOD_NOT_FOUND)) do
          6
        end

        def(encode("METHOD_NOT_FOUND")) do
          6
        end
      ),
      (
        def(encode(:EMPTY_INPUT)) do
          101
        end

        def(encode("EMPTY_INPUT")) do
          101
        end
      ),
      (
        def(encode(:INVALID_INPUT)) do
          102
        end

        def(encode("INVALID_INPUT")) do
          102
        end
      ),
      (
        def(encode(:CONFIG_NOT_FOUND)) do
          104
        end

        def(encode("CONFIG_NOT_FOUND")) do
          104
        end
      ),
      (
        def(encode(:GIFT_CODE_NOT_VALID)) do
          105
        end

        def(encode("GIFT_CODE_NOT_VALID")) do
          105
        end
      ),
      (
        def(encode(:GIFT_CODE_ALREADY_USED)) do
          106
        end

        def(encode("GIFT_CODE_ALREADY_USED")) do
          106
        end
      ),
      (
        def(encode(:GIFT_CODE_GAIN_USAGEID)) do
          107
        end

        def(encode("GIFT_CODE_GAIN_USAGEID")) do
          107
        end
      ),
      (
        def(encode(:UNSUPPORT_OAUTH2)) do
          108
        end

        def(encode("UNSUPPORT_OAUTH2")) do
          108
        end
      ),
      (
        def(encode(:OAUTH2_EXPIRED)) do
          109
        end

        def(encode("OAUTH2_EXPIRED")) do
          109
        end
      ),
      (
        def(encode(:OAUTH2_FAILED)) do
          110
        end

        def(encode("OAUTH2_FAILED")) do
          110
        end
      ),
      (
        def(encode(:GIFT_CODE_PROCESSING)) do
          112
        end

        def(encode("GIFT_CODE_PROCESSING")) do
          112
        end
      ),
      (
        def(encode(:GIFT_CODE_DURATION)) do
          113
        end

        def(encode("GIFT_CODE_DURATION")) do
          113
        end
      ),
      (
        def(encode(:GIFT_CODE_DISCARDED)) do
          114
        end

        def(encode("GIFT_CODE_DISCARDED")) do
          114
        end
      ),
      (
        def(encode(:FREQUENT_PHONE_CODE)) do
          115
        end

        def(encode("FREQUENT_PHONE_CODE")) do
          115
        end
      ),
      (
        def(encode(:PHONE_CODE_EXPIRED)) do
          116
        end

        def(encode("PHONE_CODE_EXPIRED")) do
          116
        end
      ),
      (
        def(encode(:SECURE_OPERATION_EXPIRED)) do
          117
        end

        def(encode("SECURE_OPERATION_EXPIRED")) do
          117
        end
      ),
      (
        def(encode(:BIND_SAME_PHONE)) do
          118
        end

        def(encode("BIND_SAME_PHONE")) do
          118
        end
      ),
      (
        def(encode(:PHONE_SEND_FAILED)) do
          119
        end

        def(encode("PHONE_SEND_FAILED")) do
          119
        end
      ),
      (
        def(encode(:CLIENT_OUTDATED)) do
          151
        end

        def(encode("CLIENT_OUTDATED")) do
          151
        end
      ),
      (
        def(encode(:RESOURCE_NOT_ENOUGH)) do
          501
        end

        def(encode("RESOURCE_NOT_ENOUGH")) do
          501
        end
      ),
      (
        def(encode(:TEXT_FORBIDDEN_WORD)) do
          502
        end

        def(encode("TEXT_FORBIDDEN_WORD")) do
          502
        end
      ),
      (
        def(encode(:ACCOUNT_BANNED)) do
          503
        end

        def(encode("ACCOUNT_BANNED")) do
          503
        end
      ),
      (
        def(encode(:RESOURCE_UNIQUE)) do
          504
        end

        def(encode("RESOURCE_UNIQUE")) do
          504
        end
      ),
      (
        def(encode(:ACC_DUPLICATE_SIGN_UP)) do
          1001
        end

        def(encode("ACC_DUPLICATE_SIGN_UP")) do
          1001
        end
      ),
      (
        def(encode(:ACC_NOT_SIGN_UP)) do
          1002
        end

        def(encode("ACC_NOT_SIGN_UP")) do
          1002
        end
      ),
      (
        def(encode(:ACC_PASSWORD)) do
          1003
        end

        def(encode("ACC_PASSWORD")) do
          1003
        end
      ),
      (
        def(encode(:ACC_NOT_LOGIN)) do
          1004
        end

        def(encode("ACC_NOT_LOGIN")) do
          1004
        end
      ),
      (
        def(encode(:ACC_ALREADY_LOGIN)) do
          1005
        end

        def(encode("ACC_ALREADY_LOGIN")) do
          1005
        end
      ),
      (
        def(encode(:ACC_NOT_EXIST)) do
          1006
        end

        def(encode("ACC_NOT_EXIST")) do
          1006
        end
      ),
      (
        def(encode(:ACC_CHAR_NOT_LOCK)) do
          1007
        end

        def(encode("ACC_CHAR_NOT_LOCK")) do
          1007
        end
      ),
      (
        def(encode(:ACC_CHAR_ALREADY_LOCK)) do
          1008
        end

        def(encode("ACC_CHAR_ALREADY_LOCK")) do
          1008
        end
      ),
      (
        def(encode(:ACC_TICK_BY_SAME)) do
          1009
        end

        def(encode("ACC_TICK_BY_SAME")) do
          1009
        end
      ),
      (
        def(encode(:ACC_NICKNAME_USED)) do
          1010
        end

        def(encode("ACC_NICKNAME_USED")) do
          1010
        end
      ),
      (
        def(encode(:ACC_NO_NICKNAME)) do
          1011
        end

        def(encode("ACC_NO_NICKNAME")) do
          1011
        end
      ),
      (
        def(encode(:ACC_HAS_NICKNAME)) do
          1012
        end

        def(encode("ACC_HAS_NICKNAME")) do
          1012
        end
      ),
      (
        def(encode(:ACC_HAS_BIND_ACCOUNT)) do
          1013
        end

        def(encode("ACC_HAS_BIND_ACCOUNT")) do
          1013
        end
      ),
      (
        def(encode(:ACC_TARGET_ACCOUNT_USED)) do
          1014
        end

        def(encode("ACC_TARGET_ACCOUNT_USED")) do
          1014
        end
      ),
      (
        def(encode(:ACC_NEED_NICKNAME_ITEM)) do
          1015
        end

        def(encode("ACC_NEED_NICKNAME_ITEM")) do
          1015
        end
      ),
      (
        def(encode(:ACC_MOD_NICKNAME_CD)) do
          1016
        end

        def(encode("ACC_MOD_NICKNAME_CD")) do
          1016
        end
      ),
      (
        def(encode(:ACC_ALREADY_REG_REALNAME)) do
          1017
        end

        def(encode("ACC_ALREADY_REG_REALNAME")) do
          1017
        end
      ),
      (
        def(encode(:ROOM_NOT_EXIST)) do
          1100
        end

        def(encode("ROOM_NOT_EXIST")) do
          1100
        end
      ),
      (
        def(encode(:ROOM_IS_FULL)) do
          1101
        end

        def(encode("ROOM_IS_FULL")) do
          1101
        end
      ),
      (
        def(encode(:ROOM_ALREADY_LEAVE)) do
          1102
        end

        def(encode("ROOM_ALREADY_LEAVE")) do
          1102
        end
      ),
      (
        def(encode(:ROOM_NOT_OWNER)) do
          1103
        end

        def(encode("ROOM_NOT_OWNER")) do
          1103
        end
      ),
      (
        def(encode(:ROOM_NOT_ALL_READY)) do
          1104
        end

        def(encode("ROOM_NOT_ALL_READY")) do
          1104
        end
      ),
      (
        def(encode(:ROOM_ALREADY_JOIN)) do
          1105
        end

        def(encode("ROOM_ALREADY_JOIN")) do
          1105
        end
      ),
      (
        def(encode(:ROOM_NOT_JOIN)) do
          1106
        end

        def(encode("ROOM_NOT_JOIN")) do
          1106
        end
      ),
      (
        def(encode(:ROOM_TARGET_NOT_JOIN)) do
          1107
        end

        def(encode("ROOM_TARGET_NOT_JOIN")) do
          1107
        end
      ),
      (
        def(encode(:ROOM_KICK_SELF)) do
          1108
        end

        def(encode("ROOM_KICK_SELF")) do
          1108
        end
      ),
      (
        def(encode(:ACC_IS_PLAYING)) do
          1109
        end

        def(encode("ACC_IS_PLAYING")) do
          1109
        end
      ),
      (
        def(encode(:ROOM_NO_AVAILABLE_ID)) do
          1110
        end

        def(encode("ROOM_NO_AVAILABLE_ID")) do
          1110
        end
      ),
      (
        def(encode(:ROOM_NO_ENOUGH_SLOT)) do
          1111
        end

        def(encode("ROOM_NO_ENOUGH_SLOT")) do
          1111
        end
      ),
      (
        def(encode(:ROOM_MODE_INVALID)) do
          1112
        end

        def(encode("ROOM_MODE_INVALID")) do
          1112
        end
      ),
      (
        def(encode(:TOKEN_NOT_EXIST)) do
          1201
        end

        def(encode("TOKEN_NOT_EXIST")) do
          1201
        end
      ),
      (
        def(encode(:TOKEN_INVALID)) do
          1202
        end

        def(encode("TOKEN_INVALID")) do
          1202
        end
      ),
      (
        def(encode(:GAME_NOT_EXIST)) do
          1203
        end

        def(encode("GAME_NOT_EXIST")) do
          1203
        end
      ),
      (
        def(encode(:GAME_REFUSED)) do
          1204
        end

        def(encode("GAME_REFUSED")) do
          1204
        end
      ),
      (
        def(encode(:GAME_NOT_PLAYING)) do
          1205
        end

        def(encode("GAME_NOT_PLAYING")) do
          1205
        end
      ),
      (
        def(encode(:GAME_ALREADY_FINISH)) do
          1206
        end

        def(encode("GAME_ALREADY_FINISH")) do
          1206
        end
      ),
      (
        def(encode(:GAME_CAN_NOT_MANUAL_TER)) do
          1207
        end

        def(encode("GAME_CAN_NOT_MANUAL_TER")) do
          1207
        end
      ),
      (
        def(encode(:GAME_CREATE_FAILED)) do
          1208
        end

        def(encode("GAME_CREATE_FAILED")) do
          1208
        end
      ),
      (
        def(encode(:MATCH_IN_MATCHING)) do
          1301
        end

        def(encode("MATCH_IN_MATCHING")) do
          1301
        end
      ),
      (
        def(encode(:MATCH_NOT_IN_MATCHING)) do
          1302
        end

        def(encode("MATCH_NOT_IN_MATCHING")) do
          1302
        end
      ),
      (
        def(encode(:UNSUPPORT_MATCH_MODE)) do
          1303
        end

        def(encode("UNSUPPORT_MATCH_MODE")) do
          1303
        end
      ),
      (
        def(encode(:MATCH_GOLD_LIMIT)) do
          1304
        end

        def(encode("MATCH_GOLD_LIMIT")) do
          1304
        end
      ),
      (
        def(encode(:MATCH_LEVEL_LIMIT)) do
          1305
        end

        def(encode("MATCH_LEVEL_LIMIT")) do
          1305
        end
      ),
      (
        def(encode(:MATCH_MODE_NOT_OPEN)) do
          1306
        end

        def(encode("MATCH_MODE_NOT_OPEN")) do
          1306
        end
      ),
      (
        def(encode(:FRIEND_NOT_FRIEND)) do
          1401
        end

        def(encode("FRIEND_NOT_FRIEND")) do
          1401
        end
      ),
      (
        def(encode(:FRIEND_IS_FRIEND)) do
          1402
        end

        def(encode("FRIEND_IS_FRIEND")) do
          1402
        end
      ),
      (
        def(encode(:SEARCH_TIMEOUT)) do
          1403
        end

        def(encode("SEARCH_TIMEOUT")) do
          1403
        end
      ),
      (
        def(encode(:SEARCH_INVALID)) do
          1404
        end

        def(encode("SEARCH_INVALID")) do
          1404
        end
      ),
      (
        def(encode(:FRIEND_APPLY_METHOD)) do
          1405
        end

        def(encode("FRIEND_APPLY_METHOD")) do
          1405
        end
      ),
      (
        def(encode(:FRIEND_MAX_APPLY)) do
          1406
        end

        def(encode("FRIEND_MAX_APPLY")) do
          1406
        end
      ),
      (
        def(encode(:FRIEND_MAX)) do
          1407
        end

        def(encode("FRIEND_MAX")) do
          1407
        end
      ),
      (
        def(encode(:FRIEND_ADD_SELF)) do
          1408
        end

        def(encode("FRIEND_ADD_SELF")) do
          1408
        end
      ),
      (
        def(encode(:FRIEND_MAX_TARGET)) do
          1409
        end

        def(encode("FRIEND_MAX_TARGET")) do
          1409
        end
      ),
      (
        def(encode(:BAG_NO_ITEM)) do
          1501
        end

        def(encode("BAG_NO_ITEM")) do
          1501
        end
      ),
      (
        def(encode(:BAG_NOT_ENOUGH_ITEM)) do
          1502
        end

        def(encode("BAG_NOT_ENOUGH_ITEM")) do
          1502
        end
      ),
      (
        def(encode(:BAG_ITEM_NOT_USABLE)) do
          1503
        end

        def(encode("BAG_ITEM_NOT_USABLE")) do
          1503
        end
      ),
      (
        def(encode(:BAG_ITEM_NOT_COMPOSE)) do
          1504
        end

        def(encode("BAG_ITEM_NOT_COMPOSE")) do
          1504
        end
      ),
      (
        def(encode(:ACHIEVEMENT_NOT_ACHIEVED)) do
          1601
        end

        def(encode("ACHIEVEMENT_NOT_ACHIEVED")) do
          1601
        end
      ),
      (
        def(encode(:TASK_DAILY_NOT_FOUND)) do
          1611
        end

        def(encode("TASK_DAILY_NOT_FOUND")) do
          1611
        end
      ),
      (
        def(encode(:TASK_DAILY_NO_REFRESH)) do
          1612
        end

        def(encode("TASK_DAILY_NO_REFRESH")) do
          1612
        end
      ),
      (
        def(encode(:MAIL_NOT_FOUND)) do
          1701
        end

        def(encode("MAIL_NOT_FOUND")) do
          1701
        end
      ),
      (
        def(encode(:MAIL_NO_ATTACHMENT)) do
          1702
        end

        def(encode("MAIL_NO_ATTACHMENT")) do
          1702
        end
      ),
      (
        def(encode(:MAIL_ALREADY_TAKE)) do
          1703
        end

        def(encode("MAIL_ALREADY_TAKE")) do
          1703
        end
      ),
      (
        def(encode(:LIVE_GAME_NOT_FOUND)) do
          1801
        end

        def(encode("LIVE_GAME_NOT_FOUND")) do
          1801
        end
      ),
      (
        def(encode(:PAYMENT_CLOSED)) do
          1900
        end

        def(encode("PAYMENT_CLOSED")) do
          1900
        end
      ),
      (
        def(encode(:PAYMENT_ORDER_NOT_FOUND)) do
          1901
        end

        def(encode("PAYMENT_ORDER_NOT_FOUND")) do
          1901
        end
      ),
      (
        def(encode(:PAYMENT_ORDER_HANDLED)) do
          1902
        end

        def(encode("PAYMENT_ORDER_HANDLED")) do
          1902
        end
      ),
      (
        def(encode(:PAYMENT_PLATFORM)) do
          1903
        end

        def(encode("PAYMENT_PLATFORM")) do
          1903
        end
      ),
      (
        def(encode(:PAYMENT_GOODS_NOT_FOUND)) do
          1904
        end

        def(encode("PAYMENT_GOODS_NOT_FOUND")) do
          1904
        end
      ),
      (
        def(encode(:PAYMENT_GP_VERIFY)) do
          1951
        end

        def(encode("PAYMENT_GP_VERIFY")) do
          1951
        end
      ),
      (
        def(encode(:PAYMENT_WECHAT_DISABLE)) do
          1960
        end

        def(encode("PAYMENT_WECHAT_DISABLE")) do
          1960
        end
      ),
      (
        def(encode(:PAYMENT_WECHAT_POST_FAILED)) do
          1961
        end

        def(encode("PAYMENT_WECHAT_POST_FAILED")) do
          1961
        end
      ),
      (
        def(encode(:PAYMENT_ALI_DISABLE)) do
          1970
        end

        def(encode("PAYMENT_ALI_DISABLE")) do
          1970
        end
      ),
      (
        def(encode(:PAYMENT_ALI_TYPE_UNSUP)) do
          1971
        end

        def(encode("PAYMENT_ALI_TYPE_UNSUP")) do
          1971
        end
      ),
      (
        def(encode(:REVIVE_COIN_TIME)) do
          2001
        end

        def(encode("REVIVE_COIN_TIME")) do
          2001
        end
      ),
      (
        def(encode(:REVIVE_COIN_LIMIT)) do
          2002
        end

        def(encode("REVIVE_COIN_LIMIT")) do
          2002
        end
      ),
      (
        def(encode(:TITLE_NOT_UNLOCK)) do
          2003
        end

        def(encode("TITLE_NOT_UNLOCK")) do
          2003
        end
      ),
      (
        def(encode(:COMMENT_ONLY_FRIEND)) do
          2004
        end

        def(encode("COMMENT_ONLY_FRIEND")) do
          2004
        end
      ),
      (
        def(encode(:COMMENT_FORBID)) do
          2005
        end

        def(encode("COMMENT_FORBID")) do
          2005
        end
      ),
      (
        def(encode(:COMMENT_SELF)) do
          2006
        end

        def(encode("COMMENT_SELF")) do
          2006
        end
      ),
      (
        def(encode(:COMMENT_WHEN_GAMING)) do
          2007
        end

        def(encode("COMMENT_WHEN_GAMING")) do
          2007
        end
      ),
      (
        def(encode(:COMMENT_NO_PRIV_DELETE)) do
          2008
        end

        def(encode("COMMENT_NO_PRIV_DELETE")) do
          2008
        end
      ),
      (
        def(encode(:COMMENT_CD)) do
          2009
        end

        def(encode("COMMENT_CD")) do
          2009
        end
      ),
      (
        def(encode(:CHEST_NOT_FOUND)) do
          2010
        end

        def(encode("CHEST_NOT_FOUND")) do
          2010
        end
      ),
      (
        def(encode(:CHEST_INVALID_COUNT)) do
          2011
        end

        def(encode("CHEST_INVALID_COUNT")) do
          2011
        end
      ),
      (
        def(encode(:CHARACTER_UNLOCK)) do
          2201
        end

        def(encode("CHARACTER_UNLOCK")) do
          2201
        end
      ),
      (
        def(encode(:CHARACTER_GIFT_TYPE)) do
          2202
        end

        def(encode("CHARACTER_GIFT_TYPE")) do
          2202
        end
      ),
      (
        def(encode(:CHARACTER_GIFT_COUNT_MAX)) do
          2203
        end

        def(encode("CHARACTER_GIFT_COUNT_MAX")) do
          2203
        end
      ),
      (
        def(encode(:CHARACTER_SKIN_UNLOCK)) do
          2204
        end

        def(encode("CHARACTER_SKIN_UNLOCK")) do
          2204
        end
      ),
      (
        def(encode(:CHARACTER_IS_UPGRADE)) do
          2205
        end

        def(encode("CHARACTER_IS_UPGRADE")) do
          2205
        end
      ),
      (
        def(encode(:CHARACTER_LEVEL)) do
          2206
        end

        def(encode("CHARACTER_LEVEL")) do
          2206
        end
      ),
      (
        def(encode(:CHARACTER_CANNOT_MARRY)) do
          2207
        end

        def(encode("CHARACTER_CANNOT_MARRY")) do
          2207
        end
      ),
      (
        def(encode(:ITEM_CANNOT_SELL)) do
          2301
        end

        def(encode("ITEM_CANNOT_SELL")) do
          2301
        end
      ),
      (
        def(encode(:SHOP_GOODS_NOT_FOUND)) do
          2401
        end

        def(encode("SHOP_GOODS_NOT_FOUND")) do
          2401
        end
      ),
      (
        def(encode(:SHOP_GOODS_BUY_LIMIT)) do
          2402
        end

        def(encode("SHOP_GOODS_BUY_LIMIT")) do
          2402
        end
      ),
      (
        def(encode(:SHOP_ZHP_UNAVAILABLE)) do
          2431
        end

        def(encode("SHOP_ZHP_UNAVAILABLE")) do
          2431
        end
      ),
      (
        def(encode(:SHOP_ZHP_REFRESH_LIMIT)) do
          2432
        end

        def(encode("SHOP_ZHP_REFRESH_LIMIT")) do
          2432
        end
      ),
      (
        def(encode(:CONTEST_NOT_FOUND)) do
          2501
        end

        def(encode("CONTEST_NOT_FOUND")) do
          2501
        end
      ),
      (
        def(encode(:CONTEST_MAX_ACTIVE)) do
          2502
        end

        def(encode("CONTEST_MAX_ACTIVE")) do
          2502
        end
      ),
      (
        def(encode(:CONTEST_RANDOM_CID)) do
          2503
        end

        def(encode("CONTEST_RANDOM_CID")) do
          2503
        end
      ),
      (
        def(encode(:CONTEST_MGR_HAS_LOGINED)) do
          2504
        end

        def(encode("CONTEST_MGR_HAS_LOGINED")) do
          2504
        end
      ),
      (
        def(encode(:CONTEST_MGR_NOT_LOGIN)) do
          2505
        end

        def(encode("CONTEST_MGR_NOT_LOGIN")) do
          2505
        end
      ),
      (
        def(encode(:CONTEST_MGR_NO_PRIVILEGE)) do
          2506
        end

        def(encode("CONTEST_MGR_NO_PRIVILEGE")) do
          2506
        end
      ),
      (
        def(encode(:CONTEST_NOT_START)) do
          2507
        end

        def(encode("CONTEST_NOT_START")) do
          2507
        end
      ),
      (
        def(encode(:CONTEST_ALREADY_END)) do
          2508
        end

        def(encode("CONTEST_ALREADY_END")) do
          2508
        end
      ),
      (
        def(encode(:CONTEST_PLAYER_NOT_MATCHING)) do
          2509
        end

        def(encode("CONTEST_PLAYER_NOT_MATCHING")) do
          2509
        end
      ),
      (
        def(encode(:CONTEST_LOCK_BY_OTHER)) do
          2510
        end

        def(encode("CONTEST_LOCK_BY_OTHER")) do
          2510
        end
      ),
      (
        def(encode(:CONTEST_NO_ACCESS_MATCH)) do
          2511
        end

        def(encode("CONTEST_NO_ACCESS_MATCH")) do
          2511
        end
      ),
      (
        def(encode(:CONTEST_NO_PRIV_CHAT)) do
          2512
        end

        def(encode("CONTEST_NO_PRIV_CHAT")) do
          2512
        end
      ),
      (
        def(encode(:CONTEST_NOT_CREATOR)) do
          2513
        end

        def(encode("CONTEST_NOT_CREATOR")) do
          2513
        end
      ),
      (
        def(encode(:CONTEST_MANAGER_COUNT_LIMIT)) do
          2514
        end

        def(encode("CONTEST_MANAGER_COUNT_LIMIT")) do
          2514
        end
      ),
      (
        def(encode(:CONTEST_CREATE_TIME_LIMIT)) do
          2515
        end

        def(encode("CONTEST_CREATE_TIME_LIMIT")) do
          2515
        end
      ),
      (
        def(encode(:CONTEST_BAN_CREATE)) do
          2516
        end

        def(encode("CONTEST_BAN_CREATE")) do
          2516
        end
      ),
      (
        def(encode(:CONTEST_SETTING_PARAM)) do
          2517
        end

        def(encode("CONTEST_SETTING_PARAM")) do
          2517
        end
      ),
      (
        def(encode(:CONTEST_LEVEL_LIMIT)) do
          2518
        end

        def(encode("CONTEST_LEVEL_LIMIT")) do
          2518
        end
      ),
      (
        def(encode(:CONTEST_GAME_COUNT_LIMIT)) do
          2519
        end

        def(encode("CONTEST_GAME_COUNT_LIMIT")) do
          2519
        end
      ),
      (
        def(encode(:CONTEST_PROLONG_LIMIT)) do
          2520
        end

        def(encode("CONTEST_PROLONG_LIMIT")) do
          2520
        end
      ),
      (
        def(encode(:CONTEST_AUTO_MATCHING)) do
          2521
        end

        def(encode("CONTEST_AUTO_MATCHING")) do
          2521
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(2501)) do
        :CONTEST_NOT_FOUND
      end,
      def(decode(1303)) do
        :UNSUPPORT_MATCH_MODE
      end,
      def(decode(107)) do
        :GIFT_CODE_GAIN_USAGEID
      end,
      def(decode(115)) do
        :FREQUENT_PHONE_CODE
      end,
      def(decode(501)) do
        :RESOURCE_NOT_ENOUGH
      end,
      def(decode(1302)) do
        :MATCH_NOT_IN_MATCHING
      end,
      def(decode(5)) do
        :SYSTEM_COMMUNICATION
      end,
      def(decode(1206)) do
        :GAME_ALREADY_FINISH
      end,
      def(decode(118)) do
        :BIND_SAME_PHONE
      end,
      def(decode(114)) do
        :GIFT_CODE_DISCARDED
      end,
      def(decode(2007)) do
        :COMMENT_WHEN_GAMING
      end,
      def(decode(101)) do
        :EMPTY_INPUT
      end,
      def(decode(1004)) do
        :ACC_NOT_LOGIN
      end,
      def(decode(106)) do
        :GIFT_CODE_ALREADY_USED
      end,
      def(decode(1107)) do
        :ROOM_TARGET_NOT_JOIN
      end,
      def(decode(1502)) do
        :BAG_NOT_ENOUGH_ITEM
      end,
      def(decode(2517)) do
        :CONTEST_SETTING_PARAM
      end,
      def(decode(1904)) do
        :PAYMENT_GOODS_NOT_FOUND
      end,
      def(decode(1611)) do
        :TASK_DAILY_NOT_FOUND
      end,
      def(decode(2301)) do
        :ITEM_CANNOT_SELL
      end,
      def(decode(1408)) do
        :FRIEND_ADD_SELF
      end,
      def(decode(2507)) do
        :CONTEST_NOT_START
      end,
      def(decode(2003)) do
        :TITLE_NOT_UNLOCK
      end,
      def(decode(105)) do
        :GIFT_CODE_NOT_VALID
      end,
      def(decode(2401)) do
        :SHOP_GOODS_NOT_FOUND
      end,
      def(decode(1100)) do
        :ROOM_NOT_EXIST
      end,
      def(decode(1901)) do
        :PAYMENT_ORDER_NOT_FOUND
      end,
      def(decode(1204)) do
        :GAME_REFUSED
      end,
      def(decode(2510)) do
        :CONTEST_LOCK_BY_OTHER
      end,
      def(decode(102)) do
        :INVALID_INPUT
      end,
      def(decode(2519)) do
        :CONTEST_GAME_COUNT_LIMIT
      end,
      def(decode(1971)) do
        :PAYMENT_ALI_TYPE_UNSUP
      end,
      def(decode(2506)) do
        :CONTEST_MGR_NO_PRIVILEGE
      end,
      def(decode(1008)) do
        :ACC_CHAR_ALREADY_LOCK
      end,
      def(decode(2513)) do
        :CONTEST_NOT_CREATOR
      end,
      def(decode(2505)) do
        :CONTEST_MGR_NOT_LOGIN
      end,
      def(decode(1016)) do
        :ACC_MOD_NICKNAME_CD
      end,
      def(decode(1902)) do
        :PAYMENT_ORDER_HANDLED
      end,
      def(decode(119)) do
        :PHONE_SEND_FAILED
      end,
      def(decode(4)) do
        :NOT_DEVELOPMENT_MODE
      end,
      def(decode(1010)) do
        :ACC_NICKNAME_USED
      end,
      def(decode(2512)) do
        :CONTEST_NO_PRIV_CHAT
      end,
      def(decode(1503)) do
        :BAG_ITEM_NOT_USABLE
      end,
      def(decode(1017)) do
        :ACC_ALREADY_REG_REALNAME
      end,
      def(decode(1702)) do
        :MAIL_NO_ATTACHMENT
      end,
      def(decode(1403)) do
        :SEARCH_TIMEOUT
      end,
      def(decode(2008)) do
        :COMMENT_NO_PRIV_DELETE
      end,
      def(decode(1005)) do
        :ACC_ALREADY_LOGIN
      end,
      def(decode(1006)) do
        :ACC_NOT_EXIST
      end,
      def(decode(1207)) do
        :GAME_CAN_NOT_MANUAL_TER
      end,
      def(decode(1208)) do
        :GAME_CREATE_FAILED
      end,
      def(decode(2002)) do
        :REVIVE_COIN_LIMIT
      end,
      def(decode(1002)) do
        :ACC_NOT_SIGN_UP
      end,
      def(decode(1401)) do
        :FRIEND_NOT_FRIEND
      end,
      def(decode(2502)) do
        :CONTEST_MAX_ACTIVE
      end,
      def(decode(151)) do
        :CLIENT_OUTDATED
      end,
      def(decode(3)) do
        :CLIENT_PACKET_PARAM
      end,
      def(decode(1112)) do
        :ROOM_MODE_INVALID
      end,
      def(decode(104)) do
        :CONFIG_NOT_FOUND
      end,
      def(decode(1601)) do
        :ACHIEVEMENT_NOT_ACHIEVED
      end,
      def(decode(1)) do
        :UNKNOWN
      end,
      def(decode(1406)) do
        :FRIEND_MAX_APPLY
      end,
      def(decode(2432)) do
        :SHOP_ZHP_REFRESH_LIMIT
      end,
      def(decode(112)) do
        :GIFT_CODE_PROCESSING
      end,
      def(decode(1961)) do
        :PAYMENT_WECHAT_POST_FAILED
      end,
      def(decode(2503)) do
        :CONTEST_RANDOM_CID
      end,
      def(decode(2201)) do
        :CHARACTER_UNLOCK
      end,
      def(decode(1801)) do
        :LIVE_GAME_NOT_FOUND
      end,
      def(decode(1003)) do
        :ACC_PASSWORD
      end,
      def(decode(2010)) do
        :CHEST_NOT_FOUND
      end,
      def(decode(2203)) do
        :CHARACTER_GIFT_COUNT_MAX
      end,
      def(decode(2508)) do
        :CONTEST_ALREADY_END
      end,
      def(decode(1201)) do
        :TOKEN_NOT_EXIST
      end,
      def(decode(1109)) do
        :ACC_IS_PLAYING
      end,
      def(decode(2)) do
        :SYSTEM_ERROR
      end,
      def(decode(108)) do
        :UNSUPPORT_OAUTH2
      end,
      def(decode(2520)) do
        :CONTEST_PROLONG_LIMIT
      end,
      def(decode(1703)) do
        :MAIL_ALREADY_TAKE
      end,
      def(decode(2204)) do
        :CHARACTER_SKIN_UNLOCK
      end,
      def(decode(2514)) do
        :CONTEST_MANAGER_COUNT_LIMIT
      end,
      def(decode(2518)) do
        :CONTEST_LEVEL_LIMIT
      end,
      def(decode(502)) do
        :TEXT_FORBIDDEN_WORD
      end,
      def(decode(1110)) do
        :ROOM_NO_AVAILABLE_ID
      end,
      def(decode(1007)) do
        :ACC_CHAR_NOT_LOCK
      end,
      def(decode(116)) do
        :PHONE_CODE_EXPIRED
      end,
      def(decode(1900)) do
        :PAYMENT_CLOSED
      end,
      def(decode(0)) do
        :OK
      end,
      def(decode(110)) do
        :OAUTH2_FAILED
      end,
      def(decode(1103)) do
        :ROOM_NOT_OWNER
      end,
      def(decode(2004)) do
        :COMMENT_ONLY_FRIEND
      end,
      def(decode(1101)) do
        :ROOM_IS_FULL
      end,
      def(decode(2005)) do
        :COMMENT_FORBID
      end,
      def(decode(109)) do
        :OAUTH2_EXPIRED
      end,
      def(decode(2431)) do
        :SHOP_ZHP_UNAVAILABLE
      end,
      def(decode(2206)) do
        :CHARACTER_LEVEL
      end,
      def(decode(1202)) do
        :TOKEN_INVALID
      end,
      def(decode(1106)) do
        :ROOM_NOT_JOIN
      end,
      def(decode(6)) do
        :METHOD_NOT_FOUND
      end,
      def(decode(2515)) do
        :CONTEST_CREATE_TIME_LIMIT
      end,
      def(decode(1111)) do
        :ROOM_NO_ENOUGH_SLOT
      end,
      def(decode(2521)) do
        :CONTEST_AUTO_MATCHING
      end,
      def(decode(1011)) do
        :ACC_NO_NICKNAME
      end,
      def(decode(504)) do
        :RESOURCE_UNIQUE
      end,
      def(decode(1105)) do
        :ROOM_ALREADY_JOIN
      end,
      def(decode(1014)) do
        :ACC_TARGET_ACCOUNT_USED
      end,
      def(decode(2207)) do
        :CHARACTER_CANNOT_MARRY
      end,
      def(decode(503)) do
        :ACCOUNT_BANNED
      end,
      def(decode(2205)) do
        :CHARACTER_IS_UPGRADE
      end,
      def(decode(1012)) do
        :ACC_HAS_NICKNAME
      end,
      def(decode(2509)) do
        :CONTEST_PLAYER_NOT_MATCHING
      end,
      def(decode(1405)) do
        :FRIEND_APPLY_METHOD
      end,
      def(decode(1009)) do
        :ACC_TICK_BY_SAME
      end,
      def(decode(2006)) do
        :COMMENT_SELF
      end,
      def(decode(2011)) do
        :CHEST_INVALID_COUNT
      end,
      def(decode(1102)) do
        :ROOM_ALREADY_LEAVE
      end,
      def(decode(1013)) do
        :ACC_HAS_BIND_ACCOUNT
      end,
      def(decode(1504)) do
        :BAG_ITEM_NOT_COMPOSE
      end,
      def(decode(1701)) do
        :MAIL_NOT_FOUND
      end,
      def(decode(1612)) do
        :TASK_DAILY_NO_REFRESH
      end,
      def(decode(1015)) do
        :ACC_NEED_NICKNAME_ITEM
      end,
      def(decode(1970)) do
        :PAYMENT_ALI_DISABLE
      end,
      def(decode(1409)) do
        :FRIEND_MAX_TARGET
      end,
      def(decode(2001)) do
        :REVIVE_COIN_TIME
      end,
      def(decode(1903)) do
        :PAYMENT_PLATFORM
      end,
      def(decode(1404)) do
        :SEARCH_INVALID
      end,
      def(decode(2504)) do
        :CONTEST_MGR_HAS_LOGINED
      end,
      def(decode(1305)) do
        :MATCH_LEVEL_LIMIT
      end,
      def(decode(2009)) do
        :COMMENT_CD
      end,
      def(decode(113)) do
        :GIFT_CODE_DURATION
      end,
      def(decode(2202)) do
        :CHARACTER_GIFT_TYPE
      end,
      def(decode(1304)) do
        :MATCH_GOLD_LIMIT
      end,
      def(decode(2402)) do
        :SHOP_GOODS_BUY_LIMIT
      end,
      def(decode(1104)) do
        :ROOM_NOT_ALL_READY
      end,
      def(decode(1501)) do
        :BAG_NO_ITEM
      end,
      def(decode(1306)) do
        :MATCH_MODE_NOT_OPEN
      end,
      def(decode(1203)) do
        :GAME_NOT_EXIST
      end,
      def(decode(1301)) do
        :MATCH_IN_MATCHING
      end,
      def(decode(1001)) do
        :ACC_DUPLICATE_SIGN_UP
      end,
      def(decode(2516)) do
        :CONTEST_BAN_CREATE
      end,
      def(decode(1108)) do
        :ROOM_KICK_SELF
      end,
      def(decode(1960)) do
        :PAYMENT_WECHAT_DISABLE
      end,
      def(decode(1951)) do
        :PAYMENT_GP_VERIFY
      end,
      def(decode(2511)) do
        :CONTEST_NO_ACCESS_MATCH
      end,
      def(decode(1205)) do
        :GAME_NOT_PLAYING
      end,
      def(decode(1402)) do
        :FRIEND_IS_FRIEND
      end,
      def(decode(1407)) do
        :FRIEND_MAX
      end,
      def(decode(117)) do
        :SECURE_OPERATION_EXPIRED
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [
        {0, :OK},
        {1, :UNKNOWN},
        {2, :SYSTEM_ERROR},
        {3, :CLIENT_PACKET_PARAM},
        {4, :NOT_DEVELOPMENT_MODE},
        {5, :SYSTEM_COMMUNICATION},
        {6, :METHOD_NOT_FOUND},
        {101, :EMPTY_INPUT},
        {102, :INVALID_INPUT},
        {104, :CONFIG_NOT_FOUND},
        {105, :GIFT_CODE_NOT_VALID},
        {106, :GIFT_CODE_ALREADY_USED},
        {107, :GIFT_CODE_GAIN_USAGEID},
        {108, :UNSUPPORT_OAUTH2},
        {109, :OAUTH2_EXPIRED},
        {110, :OAUTH2_FAILED},
        {112, :GIFT_CODE_PROCESSING},
        {113, :GIFT_CODE_DURATION},
        {114, :GIFT_CODE_DISCARDED},
        {115, :FREQUENT_PHONE_CODE},
        {116, :PHONE_CODE_EXPIRED},
        {117, :SECURE_OPERATION_EXPIRED},
        {118, :BIND_SAME_PHONE},
        {119, :PHONE_SEND_FAILED},
        {151, :CLIENT_OUTDATED},
        {501, :RESOURCE_NOT_ENOUGH},
        {502, :TEXT_FORBIDDEN_WORD},
        {503, :ACCOUNT_BANNED},
        {504, :RESOURCE_UNIQUE},
        {1001, :ACC_DUPLICATE_SIGN_UP},
        {1002, :ACC_NOT_SIGN_UP},
        {1003, :ACC_PASSWORD},
        {1004, :ACC_NOT_LOGIN},
        {1005, :ACC_ALREADY_LOGIN},
        {1006, :ACC_NOT_EXIST},
        {1007, :ACC_CHAR_NOT_LOCK},
        {1008, :ACC_CHAR_ALREADY_LOCK},
        {1009, :ACC_TICK_BY_SAME},
        {1010, :ACC_NICKNAME_USED},
        {1011, :ACC_NO_NICKNAME},
        {1012, :ACC_HAS_NICKNAME},
        {1013, :ACC_HAS_BIND_ACCOUNT},
        {1014, :ACC_TARGET_ACCOUNT_USED},
        {1015, :ACC_NEED_NICKNAME_ITEM},
        {1016, :ACC_MOD_NICKNAME_CD},
        {1017, :ACC_ALREADY_REG_REALNAME},
        {1100, :ROOM_NOT_EXIST},
        {1101, :ROOM_IS_FULL},
        {1102, :ROOM_ALREADY_LEAVE},
        {1103, :ROOM_NOT_OWNER},
        {1104, :ROOM_NOT_ALL_READY},
        {1105, :ROOM_ALREADY_JOIN},
        {1106, :ROOM_NOT_JOIN},
        {1107, :ROOM_TARGET_NOT_JOIN},
        {1108, :ROOM_KICK_SELF},
        {1109, :ACC_IS_PLAYING},
        {1110, :ROOM_NO_AVAILABLE_ID},
        {1111, :ROOM_NO_ENOUGH_SLOT},
        {1112, :ROOM_MODE_INVALID},
        {1201, :TOKEN_NOT_EXIST},
        {1202, :TOKEN_INVALID},
        {1203, :GAME_NOT_EXIST},
        {1204, :GAME_REFUSED},
        {1205, :GAME_NOT_PLAYING},
        {1206, :GAME_ALREADY_FINISH},
        {1207, :GAME_CAN_NOT_MANUAL_TER},
        {1208, :GAME_CREATE_FAILED},
        {1301, :MATCH_IN_MATCHING},
        {1302, :MATCH_NOT_IN_MATCHING},
        {1303, :UNSUPPORT_MATCH_MODE},
        {1304, :MATCH_GOLD_LIMIT},
        {1305, :MATCH_LEVEL_LIMIT},
        {1306, :MATCH_MODE_NOT_OPEN},
        {1401, :FRIEND_NOT_FRIEND},
        {1402, :FRIEND_IS_FRIEND},
        {1403, :SEARCH_TIMEOUT},
        {1404, :SEARCH_INVALID},
        {1405, :FRIEND_APPLY_METHOD},
        {1406, :FRIEND_MAX_APPLY},
        {1407, :FRIEND_MAX},
        {1408, :FRIEND_ADD_SELF},
        {1409, :FRIEND_MAX_TARGET},
        {1501, :BAG_NO_ITEM},
        {1502, :BAG_NOT_ENOUGH_ITEM},
        {1503, :BAG_ITEM_NOT_USABLE},
        {1504, :BAG_ITEM_NOT_COMPOSE},
        {1601, :ACHIEVEMENT_NOT_ACHIEVED},
        {1611, :TASK_DAILY_NOT_FOUND},
        {1612, :TASK_DAILY_NO_REFRESH},
        {1701, :MAIL_NOT_FOUND},
        {1702, :MAIL_NO_ATTACHMENT},
        {1703, :MAIL_ALREADY_TAKE},
        {1801, :LIVE_GAME_NOT_FOUND},
        {1900, :PAYMENT_CLOSED},
        {1901, :PAYMENT_ORDER_NOT_FOUND},
        {1902, :PAYMENT_ORDER_HANDLED},
        {1903, :PAYMENT_PLATFORM},
        {1904, :PAYMENT_GOODS_NOT_FOUND},
        {1951, :PAYMENT_GP_VERIFY},
        {1960, :PAYMENT_WECHAT_DISABLE},
        {1961, :PAYMENT_WECHAT_POST_FAILED},
        {1970, :PAYMENT_ALI_DISABLE},
        {1971, :PAYMENT_ALI_TYPE_UNSUP},
        {2001, :REVIVE_COIN_TIME},
        {2002, :REVIVE_COIN_LIMIT},
        {2003, :TITLE_NOT_UNLOCK},
        {2004, :COMMENT_ONLY_FRIEND},
        {2005, :COMMENT_FORBID},
        {2006, :COMMENT_SELF},
        {2007, :COMMENT_WHEN_GAMING},
        {2008, :COMMENT_NO_PRIV_DELETE},
        {2009, :COMMENT_CD},
        {2010, :CHEST_NOT_FOUND},
        {2011, :CHEST_INVALID_COUNT},
        {2201, :CHARACTER_UNLOCK},
        {2202, :CHARACTER_GIFT_TYPE},
        {2203, :CHARACTER_GIFT_COUNT_MAX},
        {2204, :CHARACTER_SKIN_UNLOCK},
        {2205, :CHARACTER_IS_UPGRADE},
        {2206, :CHARACTER_LEVEL},
        {2207, :CHARACTER_CANNOT_MARRY},
        {2301, :ITEM_CANNOT_SELL},
        {2401, :SHOP_GOODS_NOT_FOUND},
        {2402, :SHOP_GOODS_BUY_LIMIT},
        {2431, :SHOP_ZHP_UNAVAILABLE},
        {2432, :SHOP_ZHP_REFRESH_LIMIT},
        {2501, :CONTEST_NOT_FOUND},
        {2502, :CONTEST_MAX_ACTIVE},
        {2503, :CONTEST_RANDOM_CID},
        {2504, :CONTEST_MGR_HAS_LOGINED},
        {2505, :CONTEST_MGR_NOT_LOGIN},
        {2506, :CONTEST_MGR_NO_PRIVILEGE},
        {2507, :CONTEST_NOT_START},
        {2508, :CONTEST_ALREADY_END},
        {2509, :CONTEST_PLAYER_NOT_MATCHING},
        {2510, :CONTEST_LOCK_BY_OTHER},
        {2511, :CONTEST_NO_ACCESS_MATCH},
        {2512, :CONTEST_NO_PRIV_CHAT},
        {2513, :CONTEST_NOT_CREATOR},
        {2514, :CONTEST_MANAGER_COUNT_LIMIT},
        {2515, :CONTEST_CREATE_TIME_LIMIT},
        {2516, :CONTEST_BAN_CREATE},
        {2517, :CONTEST_SETTING_PARAM},
        {2518, :CONTEST_LEVEL_LIMIT},
        {2519, :CONTEST_GAME_COUNT_LIMIT},
        {2520, :CONTEST_PROLONG_LIMIT},
        {2521, :CONTEST_AUTO_MATCHING}
      ]
    end
  )
end