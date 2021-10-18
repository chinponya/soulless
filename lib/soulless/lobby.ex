defmodule Soulless.Lobby do
  # TODO reimplement this module as a macro
  alias Soulless.Lq

  @namespace_prefix ".lq.Lobby"

  def send_message(client, message, encoder_mod, decoder_mod, namespace) do
    case encoder_mod.encode(message) do
      {:ok, bytes} ->
        WebSockex.cast(client, {:send, bytes, namespace, decoder_mod})

      error ->
        error
    end
  end

  def fetch(client, message, encoder_mod, decoder_mod, namespace) do
    case encoder_mod.encode(message) do
      {:ok, bytes} ->
        GenServer.call(client, {:send, bytes, namespace, decoder_mod})

      error ->
        error
    end
  end

  def heatbeat(client) do
    send_message(
      client,
      %Lq.ReqHeatBeat{no_operation_counter: 1},
      Lq.ReqHeatBeat,
      Lq.ResCommon,
      "#{@namespace_prefix}.heatbeat"
    )
  end

  def fetchConnectionInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResConnectionInfo,
      "#{@namespace_prefix}.fetchConnectionInfo"
    )
  end

  def signup(client, %Lq.ReqSignupAccount{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSignupAccount,
      Lq.ResSignupAccount,
      "#{@namespace_prefix}.signup"
    )
  end

  def login(client, %Lq.ReqLogin{} = message) do
    send_message(client, message, Lq.ReqLogin, Lq.ResLogin, "#{@namespace_prefix}.login")
  end

  def loginSuccess(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.loginSuccess"
    )
  end

  def emailLogin(client, %Lq.ReqEmailLogin{} = message) do
    send_message(
      client,
      message,
      Lq.ReqEmailLogin,
      Lq.ResLogin,
      "#{@namespace_prefix}.emailLogin"
    )
  end

  def oauth2Auth(client, %Lq.ReqOauth2Auth{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOauth2Auth,
      Lq.ResOauth2Auth,
      "#{@namespace_prefix}.oauth2Auth"
    )
  end

  def oauth2Check(client, %Lq.ReqOauth2Check{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOauth2Check,
      Lq.ResOauth2Check,
      "#{@namespace_prefix}.oauth2Check"
    )
  end

  def oauth2Signup(client, %Lq.ReqOauth2Signup{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOauth2Signup,
      Lq.ResOauth2Signup,
      "#{@namespace_prefix}.oauth2Signup"
    )
  end

  def oauth2Login(client, %Lq.ReqOauth2Login{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOauth2Login,
      Lq.ResLogin,
      "#{@namespace_prefix}.oauth2Login"
    )
  end

  def dmmPreLogin(client, %Lq.ReqDMMPreLogin{} = message) do
    send_message(
      client,
      message,
      Lq.ReqDMMPreLogin,
      Lq.ResDMMPreLogin,
      "#{@namespace_prefix}.dmmPreLogin"
    )
  end

  def createPhoneVerifyCode(client, %Lq.ReqCreatePhoneVerifyCode{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreatePhoneVerifyCode,
      Lq.ResCommon,
      "#{@namespace_prefix}.createPhoneVerifyCode"
    )
  end

  def createEmailVerifyCode(client, %Lq.ReqCreateEmailVerifyCode{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateEmailVerifyCode,
      Lq.ResCommon,
      "#{@namespace_prefix}.createEmailVerifyCode"
    )
  end

  def verfifyCodeForSecure(client, %Lq.ReqVerifyCodeForSecure{} = message) do
    send_message(
      client,
      message,
      Lq.ReqVerifyCodeForSecure,
      Lq.ResVerfiyCodeForSecure,
      "#{@namespace_prefix}.verfifyCodeForSecure"
    )
  end

  def bindPhoneNumber(client, %Lq.ReqBindPhoneNumber{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBindPhoneNumber,
      Lq.ResCommon,
      "#{@namespace_prefix}.bindPhoneNumber"
    )
  end

  def unbindPhoneNumber(client, %Lq.ReqUnbindPhoneNumber{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUnbindPhoneNumber,
      Lq.ResCommon,
      "#{@namespace_prefix}.unbindPhoneNumber"
    )
  end

  def fetchPhoneLoginBind(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFetchPhoneLoginBind,
      "#{@namespace_prefix}.fetchPhoneLoginBind"
    )
  end

  def createPhoneLoginBind(client, %Lq.ReqCreatePhoneLoginBind{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreatePhoneLoginBind,
      Lq.ResCommon,
      "#{@namespace_prefix}.createPhoneLoginBind"
    )
  end

  def bindEmail(client, %Lq.ReqBindEmail{} = message) do
    send_message(client, message, Lq.ReqBindEmail, Lq.ResCommon, "#{@namespace_prefix}.bindEmail")
  end

  def modifyPassword(client, %Lq.ReqModifyPassword{} = message) do
    send_message(
      client,
      message,
      Lq.ReqModifyPassword,
      Lq.ResCommon,
      "#{@namespace_prefix}.modifyPassword"
    )
  end

  def bindAccount(client, %Lq.ReqBindAccount{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBindAccount,
      Lq.ResCommon,
      "#{@namespace_prefix}.bindAccount"
    )
  end

  def logout(client, %Lq.ReqLogout{} = message) do
    send_message(client, message, Lq.ReqLogout, Lq.ResLogout, "#{@namespace_prefix}.logout")
  end

  def loginBeat(client, %Lq.ReqLoginBeat{} = message) do
    send_message(client, message, Lq.ReqLoginBeat, Lq.ResCommon, "#{@namespace_prefix}.loginBeat")
  end

  def createNickname(client, %Lq.ReqCreateNickname{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateNickname,
      Lq.ResCommon,
      "#{@namespace_prefix}.createNickname"
    )
  end

  def modifyNickname(client, %Lq.ReqModifyNickname{} = message) do
    send_message(
      client,
      message,
      Lq.ReqModifyNickname,
      Lq.ResCommon,
      "#{@namespace_prefix}.modifyNickname"
    )
  end

  def modifyBirthday(client, %Lq.ReqModifyBirthday{} = message) do
    send_message(
      client,
      message,
      Lq.ReqModifyBirthday,
      Lq.ResCommon,
      "#{@namespace_prefix}.modifyBirthday"
    )
  end

  def fetchRoom(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResSelfRoom,
      "#{@namespace_prefix}.fetchRoom"
    )
  end

  def createRoom(client, %Lq.ReqCreateRoom{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateRoom,
      Lq.ResCreateRoom,
      "#{@namespace_prefix}.createRoom"
    )
  end

  def joinRoom(client, %Lq.ReqJoinRoom{} = message) do
    send_message(client, message, Lq.ReqJoinRoom, Lq.ResJoinRoom, "#{@namespace_prefix}.joinRoom")
  end

  def leaveRoom(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.leaveRoom"
    )
  end

  def readyPlay(client, %Lq.ReqRoomReady{} = message) do
    send_message(client, message, Lq.ReqRoomReady, Lq.ResCommon, "#{@namespace_prefix}.readyPlay")
  end

  def dressingStatus(client, %Lq.ReqRoomDressing{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRoomDressing,
      Lq.ResCommon,
      "#{@namespace_prefix}.dressingStatus"
    )
  end

  def startRoom(client, %Lq.ReqRoomStart{} = message) do
    send_message(client, message, Lq.ReqRoomStart, Lq.ResCommon, "#{@namespace_prefix}.startRoom")
  end

  def kickPlayer(client, %Lq.ReqRoomKick{} = message) do
    send_message(client, message, Lq.ReqRoomKick, Lq.ResCommon, "#{@namespace_prefix}.kickPlayer")
  end

  def modifyRoom(client, %Lq.ReqModifyRoom{} = message) do
    send_message(
      client,
      message,
      Lq.ReqModifyRoom,
      Lq.ResCommon,
      "#{@namespace_prefix}.modifyRoom"
    )
  end

  def matchGame(client, %Lq.ReqJoinMatchQueue{} = message) do
    send_message(
      client,
      message,
      Lq.ReqJoinMatchQueue,
      Lq.ResCommon,
      "#{@namespace_prefix}.matchGame"
    )
  end

  def cancelMatch(client, %Lq.ReqCancelMatchQueue{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCancelMatchQueue,
      Lq.ResCommon,
      "#{@namespace_prefix}.cancelMatch"
    )
  end

  def fetchAccountInfo(client, %Lq.ReqAccountInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqAccountInfo,
      Lq.ResAccountInfo,
      "#{@namespace_prefix}.fetchAccountInfo"
    )
  end

  def changeAvatar(client, %Lq.ReqChangeAvatar{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChangeAvatar,
      Lq.ResCommon,
      "#{@namespace_prefix}.changeAvatar"
    )
  end

  def receiveVersionReward(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.receiveVersionReward"
    )
  end

  def fetchAccountStatisticInfo(client, %Lq.ReqAccountStatisticInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqAccountStatisticInfo,
      Lq.ResAccountStatisticInfo,
      "#{@namespace_prefix}.fetchAccountStatisticInfo"
    )
  end

  def fetchAccountChallengeRankInfo(client, %Lq.ReqAccountInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqAccountInfo,
      Lq.ResAccountChallengeRankInfo,
      "#{@namespace_prefix}.fetchAccountChallengeRankInfo"
    )
  end

  def fetchAccountCharacterInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResAccountCharacterInfo,
      "#{@namespace_prefix}.fetchAccountCharacterInfo"
    )
  end

  def shopPurchase(client, %Lq.ReqShopPurchase{} = message) do
    send_message(
      client,
      message,
      Lq.ReqShopPurchase,
      Lq.ResShopPurchase,
      "#{@namespace_prefix}.shopPurchase"
    )
  end

  def fetchGameRecord(client, %Lq.ReqGameRecord{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameRecord,
      Lq.ResGameRecord,
      "#{@namespace_prefix}.fetchGameRecord"
    )
  end

  def readGameRecord(client, %Lq.ReqGameRecord{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameRecord,
      Lq.ResCommon,
      "#{@namespace_prefix}.readGameRecord"
    )
  end

  def fetchGameRecordList(client, %Lq.ReqGameRecordList{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameRecordList,
      Lq.ResGameRecordList,
      "#{@namespace_prefix}.fetchGameRecordList"
    )
  end

  def fetchCollectedGameRecordList(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCollectedGameRecordList,
      "#{@namespace_prefix}.fetchCollectedGameRecordList"
    )
  end

  def fetchGameRecordsDetail(client, %Lq.ReqGameRecordsDetail{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameRecordsDetail,
      Lq.ResGameRecordsDetail,
      "#{@namespace_prefix}.fetchGameRecordsDetail"
    )
  end

  def addCollectedGameRecord(client, %Lq.ReqAddCollectedGameRecord{} = message) do
    send_message(
      client,
      message,
      Lq.ReqAddCollectedGameRecord,
      Lq.ResAddCollectedGameRecord,
      "#{@namespace_prefix}.addCollectedGameRecord"
    )
  end

  def removeCollectedGameRecord(client, %Lq.ReqRemoveCollectedGameRecord{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRemoveCollectedGameRecord,
      Lq.ResRemoveCollectedGameRecord,
      "#{@namespace_prefix}.removeCollectedGameRecord"
    )
  end

  def changeCollectedGameRecordRemarks(
        client,
        %Lq.ReqChangeCollectedGameRecordRemarks{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqChangeCollectedGameRecordRemarks,
      Lq.ResChangeCollectedGameRecordRemarks,
      "#{@namespace_prefix}.changeCollectedGameRecordRemarks"
    )
  end

  def fetchLevelLeaderboard(client, %Lq.ReqLevelLeaderboard{} = message) do
    send_message(
      client,
      message,
      Lq.ReqLevelLeaderboard,
      Lq.ResLevelLeaderboard,
      "#{@namespace_prefix}.fetchLevelLeaderboard"
    )
  end

  def fetchChallengeLeaderboard(client, %Lq.ReqChallangeLeaderboard{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChallangeLeaderboard,
      Lq.ResChallengeLeaderboard,
      "#{@namespace_prefix}.fetchChallengeLeaderboard"
    )
  end

  def fetchMutiChallengeLevel(client, %Lq.ReqMutiChallengeLevel{} = message) do
    send_message(
      client,
      message,
      Lq.ReqMutiChallengeLevel,
      Lq.ResMutiChallengeLevel,
      "#{@namespace_prefix}.fetchMutiChallengeLevel"
    )
  end

  def fetchMultiAccountBrief(client, %Lq.ReqMultiAccountId{} = message) do
    send_message(
      client,
      message,
      Lq.ReqMultiAccountId,
      Lq.ResMultiAccountBrief,
      "#{@namespace_prefix}.fetchMultiAccountBrief"
    )
  end

  def fetchFriendList(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFriendList,
      "#{@namespace_prefix}.fetchFriendList"
    )
  end

  def fetchFriendApplyList(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFriendApplyList,
      "#{@namespace_prefix}.fetchFriendApplyList"
    )
  end

  def applyFriend(client, %Lq.ReqApplyFriend{} = message) do
    send_message(
      client,
      message,
      Lq.ReqApplyFriend,
      Lq.ResCommon,
      "#{@namespace_prefix}.applyFriend"
    )
  end

  def handleFriendApply(client, %Lq.ReqHandleFriendApply{} = message) do
    send_message(
      client,
      message,
      Lq.ReqHandleFriendApply,
      Lq.ResCommon,
      "#{@namespace_prefix}.handleFriendApply"
    )
  end

  def removeFriend(client, %Lq.ReqRemoveFriend{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRemoveFriend,
      Lq.ResCommon,
      "#{@namespace_prefix}.removeFriend"
    )
  end

  def searchAccountById(client, %Lq.ReqSearchAccountById{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSearchAccountById,
      Lq.ResSearchAccountById,
      "#{@namespace_prefix}.searchAccountById"
    )
  end

  def searchAccountByPattern(client, %Lq.ReqSearchAccountByPattern{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSearchAccountByPattern,
      Lq.ResSearchAccountByPattern,
      "#{@namespace_prefix}.searchAccountByPattern"
    )
  end

  def fetchAccountState(client, %Lq.ReqAccountList{} = message) do
    send_message(
      client,
      message,
      Lq.ReqAccountList,
      Lq.ResAccountStates,
      "#{@namespace_prefix}.fetchAccountState"
    )
  end

  def fetchBagInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResBagInfo,
      "#{@namespace_prefix}.fetchBagInfo"
    )
  end

  def useBagItem(client, %Lq.ReqUseBagItem{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUseBagItem,
      Lq.ResCommon,
      "#{@namespace_prefix}.useBagItem"
    )
  end

  def openManualItem(client, %Lq.ReqOpenManualItem{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOpenManualItem,
      Lq.ResCommon,
      "#{@namespace_prefix}.openManualItem"
    )
  end

  def openRandomRewardItem(client, %Lq.ReqOpenRandomRewardItem{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOpenRandomRewardItem,
      Lq.ResOpenRandomRewardItem,
      "#{@namespace_prefix}.openRandomRewardItem"
    )
  end

  def openAllRewardItem(client, %Lq.ReqOpenAllRewardItem{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOpenAllRewardItem,
      Lq.ResOpenAllRewardItem,
      "#{@namespace_prefix}.openAllRewardItem"
    )
  end

  def composeShard(client, %Lq.ReqComposeShard{} = message) do
    send_message(
      client,
      message,
      Lq.ReqComposeShard,
      Lq.ResCommon,
      "#{@namespace_prefix}.composeShard"
    )
  end

  def fetchAnnouncement(client, %Lq.ReqFetchAnnouncement{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchAnnouncement,
      Lq.ResAnnouncement,
      "#{@namespace_prefix}.fetchAnnouncement"
    )
  end

  def readAnnouncement(client, %Lq.ReqReadAnnouncement{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReadAnnouncement,
      Lq.ResCommon,
      "#{@namespace_prefix}.readAnnouncement"
    )
  end

  def fetchMailInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResMailInfo,
      "#{@namespace_prefix}.fetchMailInfo"
    )
  end

  def readMail(client, %Lq.ReqReadMail{} = message) do
    send_message(client, message, Lq.ReqReadMail, Lq.ResCommon, "#{@namespace_prefix}.readMail")
  end

  def deleteMail(client, %Lq.ReqDeleteMail{} = message) do
    send_message(
      client,
      message,
      Lq.ReqDeleteMail,
      Lq.ResCommon,
      "#{@namespace_prefix}.deleteMail"
    )
  end

  def takeAttachmentFromMail(client, %Lq.ReqTakeAttachment{} = message) do
    send_message(
      client,
      message,
      Lq.ReqTakeAttachment,
      Lq.ResCommon,
      "#{@namespace_prefix}.takeAttachmentFromMail"
    )
  end

  def receiveAchievementReward(client, %Lq.ReqReceiveAchievementReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReceiveAchievementReward,
      Lq.ResReceiveAchievementReward,
      "#{@namespace_prefix}.receiveAchievementReward"
    )
  end

  def receiveAchievementGroupReward(client, %Lq.ReqReceiveAchievementGroupReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReceiveAchievementGroupReward,
      Lq.ResReceiveAchievementGroupReward,
      "#{@namespace_prefix}.receiveAchievementGroupReward"
    )
  end

  def fetchAchievementRate(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFetchAchievementRate,
      "#{@namespace_prefix}.fetchAchievementRate"
    )
  end

  def fetchAchievement(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResAchievement,
      "#{@namespace_prefix}.fetchAchievement"
    )
  end

  def buyShiLian(client, %Lq.ReqBuyShiLian{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyShiLian,
      Lq.ResCommon,
      "#{@namespace_prefix}.buyShiLian"
    )
  end

  def matchShiLian(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.matchShiLian"
    )
  end

  def goNextShiLian(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.goNextShiLian"
    )
  end

  def updateClientValue(client, %Lq.ReqUpdateClientValue{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateClientValue,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateClientValue"
    )
  end

  def fetchClientValue(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResClientValue,
      "#{@namespace_prefix}.fetchClientValue"
    )
  end

  def clientMessage(client, %Lq.ReqClientMessage{} = message) do
    send_message(
      client,
      message,
      Lq.ReqClientMessage,
      Lq.ResCommon,
      "#{@namespace_prefix}.clientMessage"
    )
  end

  def fetchCurrentMatchInfo(client, %Lq.ReqCurrentMatchInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCurrentMatchInfo,
      Lq.ResCurrentMatchInfo,
      "#{@namespace_prefix}.fetchCurrentMatchInfo"
    )
  end

  def userComplain(client, %Lq.ReqUserComplain{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUserComplain,
      Lq.ResCommon,
      "#{@namespace_prefix}.userComplain"
    )
  end

  def fetchReviveCoinInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResReviveCoinInfo,
      "#{@namespace_prefix}.fetchReviveCoinInfo"
    )
  end

  def gainReviveCoin(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.gainReviveCoin"
    )
  end

  def fetchDailyTask(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResDailyTask,
      "#{@namespace_prefix}.fetchDailyTask"
    )
  end

  def refreshDailyTask(client, %Lq.ReqRefreshDailyTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRefreshDailyTask,
      Lq.ResRefreshDailyTask,
      "#{@namespace_prefix}.refreshDailyTask"
    )
  end

  def useGiftCode(client, %Lq.ReqUseGiftCode{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUseGiftCode,
      Lq.ResUseGiftCode,
      "#{@namespace_prefix}.useGiftCode"
    )
  end

  def useSpecialGiftCode(client, %Lq.ReqUseGiftCode{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUseGiftCode,
      Lq.ResUseSpecialGiftCode,
      "#{@namespace_prefix}.useSpecialGiftCode"
    )
  end

  def fetchTitleList(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResTitleList,
      "#{@namespace_prefix}.fetchTitleList"
    )
  end

  def useTitle(client, %Lq.ReqUseTitle{} = message) do
    send_message(client, message, Lq.ReqUseTitle, Lq.ResCommon, "#{@namespace_prefix}.useTitle")
  end

  def sendClientMessage(client, %Lq.ReqSendClientMessage{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSendClientMessage,
      Lq.ResCommon,
      "#{@namespace_prefix}.sendClientMessage"
    )
  end

  def fetchGameLiveInfo(client, %Lq.ReqGameLiveInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameLiveInfo,
      Lq.ResGameLiveInfo,
      "#{@namespace_prefix}.fetchGameLiveInfo"
    )
  end

  def fetchGameLiveLeftSegment(client, %Lq.ReqGameLiveLeftSegment{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameLiveLeftSegment,
      Lq.ResGameLiveLeftSegment,
      "#{@namespace_prefix}.fetchGameLiveLeftSegment"
    )
  end

  def fetchGameLiveList(client, %Lq.ReqGameLiveList{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGameLiveList,
      Lq.ResGameLiveList,
      "#{@namespace_prefix}.fetchGameLiveList"
    )
  end

  def fetchCommentSetting(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommentSetting,
      "#{@namespace_prefix}.fetchCommentSetting"
    )
  end

  def updateCommentSetting(client, %Lq.ReqUpdateCommentSetting{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateCommentSetting,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateCommentSetting"
    )
  end

  def fetchCommentList(client, %Lq.ReqFetchCommentList{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchCommentList,
      Lq.ResFetchCommentList,
      "#{@namespace_prefix}.fetchCommentList"
    )
  end

  def fetchCommentContent(client, %Lq.ReqFetchCommentContent{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchCommentContent,
      Lq.ResFetchCommentContent,
      "#{@namespace_prefix}.fetchCommentContent"
    )
  end

  def leaveComment(client, %Lq.ReqLeaveComment{} = message) do
    send_message(
      client,
      message,
      Lq.ReqLeaveComment,
      Lq.ResCommon,
      "#{@namespace_prefix}.leaveComment"
    )
  end

  def deleteComment(client, %Lq.ReqDeleteComment{} = message) do
    send_message(
      client,
      message,
      Lq.ReqDeleteComment,
      Lq.ResCommon,
      "#{@namespace_prefix}.deleteComment"
    )
  end

  def updateReadComment(client, %Lq.ReqUpdateReadComment{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateReadComment,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateReadComment"
    )
  end

  def fetchRollingNotice(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ReqRollingNotice,
      "#{@namespace_prefix}.fetchRollingNotice"
    )
  end

  def fetchServerTime(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResServerTime,
      "#{@namespace_prefix}.fetchServerTime"
    )
  end

  def fetchPlatformProducts(client, %Lq.ReqPlatformBillingProducts{} = message) do
    send_message(
      client,
      message,
      Lq.ReqPlatformBillingProducts,
      Lq.ResPlatformBillingProducts,
      "#{@namespace_prefix}.fetchPlatformProducts"
    )
  end

  def cancelGooglePlayOrder(client, %Lq.ReqCancelGooglePlayOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCancelGooglePlayOrder,
      Lq.ResCommon,
      "#{@namespace_prefix}.cancelGooglePlayOrder"
    )
  end

  def openChest(client, %Lq.ReqOpenChest{} = message) do
    send_message(
      client,
      message,
      Lq.ReqOpenChest,
      Lq.ResOpenChest,
      "#{@namespace_prefix}.openChest"
    )
  end

  def buyFromChestShop(client, %Lq.ReqBuyFromChestShop{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyFromChestShop,
      Lq.ResBuyFromChestShop,
      "#{@namespace_prefix}.buyFromChestShop"
    )
  end

  def fetchDailySignInInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResDailySignInInfo,
      "#{@namespace_prefix}.fetchDailySignInInfo"
    )
  end

  def doDailySignIn(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.doDailySignIn"
    )
  end

  def doActivitySignIn(client, %Lq.ReqDoActivitySignIn{} = message) do
    send_message(
      client,
      message,
      Lq.ReqDoActivitySignIn,
      Lq.ResDoActivitySignIn,
      "#{@namespace_prefix}.doActivitySignIn"
    )
  end

  def fetchCharacterInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCharacterInfo,
      "#{@namespace_prefix}.fetchCharacterInfo"
    )
  end

  def updateCharacterSort(client, %Lq.ReqUpdateCharacterSort{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateCharacterSort,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateCharacterSort"
    )
  end

  def changeMainCharacter(client, %Lq.ReqChangeMainCharacter{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChangeMainCharacter,
      Lq.ResCommon,
      "#{@namespace_prefix}.changeMainCharacter"
    )
  end

  def changeCharacterSkin(client, %Lq.ReqChangeCharacterSkin{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChangeCharacterSkin,
      Lq.ResCommon,
      "#{@namespace_prefix}.changeCharacterSkin"
    )
  end

  def changeCharacterView(client, %Lq.ReqChangeCharacterView{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChangeCharacterView,
      Lq.ResCommon,
      "#{@namespace_prefix}.changeCharacterView"
    )
  end

  def sendGiftToCharacter(client, %Lq.ReqSendGiftToCharacter{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSendGiftToCharacter,
      Lq.ResSendGiftToCharacter,
      "#{@namespace_prefix}.sendGiftToCharacter"
    )
  end

  def sellItem(client, %Lq.ReqSellItem{} = message) do
    send_message(client, message, Lq.ReqSellItem, Lq.ResCommon, "#{@namespace_prefix}.sellItem")
  end

  def fetchCommonView(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommonView,
      "#{@namespace_prefix}.fetchCommonView"
    )
  end

  def changeCommonView(client, %Lq.ReqChangeCommonView{} = message) do
    send_message(
      client,
      message,
      Lq.ReqChangeCommonView,
      Lq.ResCommon,
      "#{@namespace_prefix}.changeCommonView"
    )
  end

  def saveCommonViews(client, %Lq.ReqSaveCommonViews{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSaveCommonViews,
      Lq.ResCommon,
      "#{@namespace_prefix}.saveCommonViews"
    )
  end

  def fetchCommonViews(client, %Lq.ReqCommonViews{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCommonViews,
      Lq.ResCommonViews,
      "#{@namespace_prefix}.fetchCommonViews"
    )
  end

  def fetchAllCommonViews(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResAllcommonViews,
      "#{@namespace_prefix}.fetchAllCommonViews"
    )
  end

  def useCommonView(client, %Lq.ReqUseCommonView{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUseCommonView,
      Lq.ResCommon,
      "#{@namespace_prefix}.useCommonView"
    )
  end

  def upgradeCharacter(client, %Lq.ReqUpgradeCharacter{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpgradeCharacter,
      Lq.ResUpgradeCharacter,
      "#{@namespace_prefix}.upgradeCharacter"
    )
  end

  def addFinishedEnding(client, %Lq.ReqFinishedEnding{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFinishedEnding,
      Lq.ResCommon,
      "#{@namespace_prefix}.addFinishedEnding"
    )
  end

  def receiveEndingReward(client, %Lq.ReqFinishedEnding{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFinishedEnding,
      Lq.ResCommon,
      "#{@namespace_prefix}.receiveEndingReward"
    )
  end

  def gameMasterCommand(client, %Lq.ReqGMCommand{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGMCommand,
      Lq.ResCommon,
      "#{@namespace_prefix}.gameMasterCommand"
    )
  end

  def fetchShopInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResShopInfo,
      "#{@namespace_prefix}.fetchShopInfo"
    )
  end

  def buyFromShop(client, %Lq.ReqBuyFromShop{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyFromShop,
      Lq.ResBuyFromShop,
      "#{@namespace_prefix}.buyFromShop"
    )
  end

  def buyFromZHP(client, %Lq.ReqBuyFromZHP{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyFromZHP,
      Lq.ResCommon,
      "#{@namespace_prefix}.buyFromZHP"
    )
  end

  def refreshZHPShop(client, %Lq.ReqReshZHPShop{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReshZHPShop,
      Lq.ResRefreshZHPShop,
      "#{@namespace_prefix}.refreshZHPShop"
    )
  end

  def fetchMonthTicketInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResMonthTicketInfo,
      "#{@namespace_prefix}.fetchMonthTicketInfo"
    )
  end

  def payMonthTicket(client, %Lq.ReqPayMonthTicket{} = message) do
    send_message(
      client,
      message,
      Lq.ReqPayMonthTicket,
      Lq.ResPayMonthTicket,
      "#{@namespace_prefix}.payMonthTicket"
    )
  end

  def exchangeCurrency(client, %Lq.ReqExchangeCurrency{} = message) do
    send_message(
      client,
      message,
      Lq.ReqExchangeCurrency,
      Lq.ResCommon,
      "#{@namespace_prefix}.exchangeCurrency"
    )
  end

  def exchangeChestStone(client, %Lq.ReqExchangeCurrency{} = message) do
    send_message(
      client,
      message,
      Lq.ReqExchangeCurrency,
      Lq.ResCommon,
      "#{@namespace_prefix}.exchangeChestStone"
    )
  end

  def exchangeDiamond(client, %Lq.ReqExchangeCurrency{} = message) do
    send_message(
      client,
      message,
      Lq.ReqExchangeCurrency,
      Lq.ResCommon,
      "#{@namespace_prefix}.exchangeDiamond"
    )
  end

  def fetchServerSettings(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResServerSettings,
      "#{@namespace_prefix}.fetchServerSettings"
    )
  end

  def fetchAccountSettings(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResAccountSettings,
      "#{@namespace_prefix}.fetchAccountSettings"
    )
  end

  def updateAccountSettings(client, %Lq.ReqUpdateAccountSettings{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateAccountSettings,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateAccountSettings"
    )
  end

  def fetchModNicknameTime(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResModNicknameTime,
      "#{@namespace_prefix}.fetchModNicknameTime"
    )
  end

  def createWechatNativeOrder(client, %Lq.ReqCreateWechatNativeOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateWechatNativeOrder,
      Lq.ResCreateWechatNativeOrder,
      "#{@namespace_prefix}.createWechatNativeOrder"
    )
  end

  def createWechatAppOrder(client, %Lq.ReqCreateWechatAppOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateWechatAppOrder,
      Lq.ResCreateWechatAppOrder,
      "#{@namespace_prefix}.createWechatAppOrder"
    )
  end

  def createAlipayOrder(client, %Lq.ReqCreateAlipayOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateAlipayOrder,
      Lq.ResCreateAlipayOrder,
      "#{@namespace_prefix}.createAlipayOrder"
    )
  end

  def createAlipayScanOrder(client, %Lq.ReqCreateAlipayScanOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateAlipayScanOrder,
      Lq.ResCreateAlipayScanOrder,
      "#{@namespace_prefix}.createAlipayScanOrder"
    )
  end

  def createAlipayAppOrder(client, %Lq.ReqCreateAlipayAppOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateAlipayAppOrder,
      Lq.ResCreateAlipayAppOrder,
      "#{@namespace_prefix}.createAlipayAppOrder"
    )
  end

  def createJPCreditCardOrder(client, %Lq.ReqCreateJPCreditCardOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPCreditCardOrder,
      Lq.ResCreateJPCreditCardOrder,
      "#{@namespace_prefix}.createJPCreditCardOrder"
    )
  end

  def createJPPaypalOrder(client, %Lq.ReqCreateJPPaypalOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPPaypalOrder,
      Lq.ResCreateJPPaypalOrder,
      "#{@namespace_prefix}.createJPPaypalOrder"
    )
  end

  def createJPAuOrder(client, %Lq.ReqCreateJPAuOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPAuOrder,
      Lq.ResCreateJPAuOrder,
      "#{@namespace_prefix}.createJPAuOrder"
    )
  end

  def createJPDocomoOrder(client, %Lq.ReqCreateJPDocomoOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPDocomoOrder,
      Lq.ResCreateJPDocomoOrder,
      "#{@namespace_prefix}.createJPDocomoOrder"
    )
  end

  def createJPWebMoneyOrder(client, %Lq.ReqCreateJPWebMoneyOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPWebMoneyOrder,
      Lq.ResCreateJPWebMoneyOrder,
      "#{@namespace_prefix}.createJPWebMoneyOrder"
    )
  end

  def createJPSoftbankOrder(client, %Lq.ReqCreateJPSoftbankOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateJPSoftbankOrder,
      Lq.ResCreateJPSoftbankOrder,
      "#{@namespace_prefix}.createJPSoftbankOrder"
    )
  end

  def createENPaypalOrder(client, %Lq.ReqCreateENPaypalOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateENPaypalOrder,
      Lq.ResCreateENPaypalOrder,
      "#{@namespace_prefix}.createENPaypalOrder"
    )
  end

  def createENMasterCardOrder(client, %Lq.ReqCreateENMasterCardOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateENMasterCardOrder,
      Lq.ResCreateENMasterCardOrder,
      "#{@namespace_prefix}.createENMasterCardOrder"
    )
  end

  def createENVisaOrder(client, %Lq.ReqCreateENVisaOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateENVisaOrder,
      Lq.ResCreateENVisaOrder,
      "#{@namespace_prefix}.createENVisaOrder"
    )
  end

  def createENJCBOrder(client, %Lq.ReqCreateENJCBOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateENJCBOrder,
      Lq.ResCreateENJCBOrder,
      "#{@namespace_prefix}.createENJCBOrder"
    )
  end

  def createENAlipayOrder(client, %Lq.ReqCreateENAlipayOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateENAlipayOrder,
      Lq.ResCreateENAlipayOrder,
      "#{@namespace_prefix}.createENAlipayOrder"
    )
  end

  def createDMMOrder(client, %Lq.ReqCreateDMMOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateDMMOrder,
      Lq.ResCreateDmmOrder,
      "#{@namespace_prefix}.createDMMOrder"
    )
  end

  def createIAPOrder(client, %Lq.ReqCreateIAPOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateIAPOrder,
      Lq.ResCreateIAPOrder,
      "#{@namespace_prefix}.createIAPOrder"
    )
  end

  def createSteamOrder(client, %Lq.ReqCreateSteamOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateSteamOrder,
      Lq.ResCreateSteamOrder,
      "#{@namespace_prefix}.createSteamOrder"
    )
  end

  def verifySteamOrder(client, %Lq.ReqVerifySteamOrder{} = message) do
    send_message(client, message, Lq.AAA, Lq.ResCommon, "#{@namespace_prefix}.verifySteamOrder")
  end

  def createMyCardAndroidOrder(client, %Lq.ReqCreateMyCardOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateMyCardOrder,
      Lq.ResCreateMyCardOrder,
      "#{@namespace_prefix}.createMyCardAndroidOrder"
    )
  end

  def createMyCardWebOrder(client, %Lq.ReqCreateMyCardOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateMyCardOrder,
      Lq.ResCreateMyCardOrder,
      "#{@namespace_prefix}.createMyCardWebOrder"
    )
  end

  def createPaypalOrder(client, %Lq.ReqCreatePaypalOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreatePaypalOrder,
      Lq.ResCreatePaypalOrder,
      "#{@namespace_prefix}.createPaypalOrder"
    )
  end

  def createXsollaOrder(client, %Lq.ReqCreateXsollaOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateXsollaOrder,
      Lq.ResCreateXsollaOrder,
      "#{@namespace_prefix}.createXsollaOrder"
    )
  end

  def verifyMyCardOrder(client, %Lq.ReqVerifyMyCardOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqVerifyMyCardOrder,
      Lq.ResCommon,
      "#{@namespace_prefix}.verifyMyCardOrder"
    )
  end

  def verificationIAPOrder(client, %Lq.ReqVerificationIAPOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqVerificationIAPOrder,
      Lq.ResVerificationIAPOrder,
      "#{@namespace_prefix}.verificationIAPOrder"
    )
  end

  def createYostarSDKOrder(client, %Lq.ReqCreateYostarOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateYostarOrder,
      Lq.ResCreateYostarOrder,
      "#{@namespace_prefix}.createYostarSDKOrder"
    )
  end

  def createBillingOrder(client, %Lq.ReqCreateBillingOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateBillingOrder,
      Lq.ResCreateBillingOrder,
      "#{@namespace_prefix}.createBillingOrder"
    )
  end

  def solveGooglePlayOrder(client, %Lq.ReqSolveGooglePlayOrder{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSolveGooglePlayOrder,
      Lq.ResCommon,
      "#{@namespace_prefix}.solveGooglePlayOrder"
    )
  end

  def solveGooglePayOrderV3(client, %Lq.ReqSolveGooglePlayOrderV3{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSolveGooglePlayOrderV3,
      Lq.ResCommon,
      "#{@namespace_prefix}.solveGooglePayOrderV3"
    )
  end

  def fetchMisc(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResMisc,
      "#{@namespace_prefix}.fetchMisc"
    )
  end

  def modifySignature(client, %Lq.ReqModifySignature{} = message) do
    send_message(
      client,
      message,
      Lq.ReqModifySignature,
      Lq.ResCommon,
      "#{@namespace_prefix}.modifySignature"
    )
  end

  def fetchIDCardInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResIDCardInfo,
      "#{@namespace_prefix}.fetchIDCardInfo"
    )
  end

  def updateIDCardInfo(client, %Lq.ReqUpdateIDCardInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpdateIDCardInfo,
      Lq.ResCommon,
      "#{@namespace_prefix}.updateIDCardInfo"
    )
  end

  def fetchVipReward(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResVipReward,
      "#{@namespace_prefix}.fetchVipReward"
    )
  end

  def gainVipReward(client, %Lq.ReqGainVipReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGainVipReward,
      Lq.ResCommon,
      "#{@namespace_prefix}.gainVipReward"
    )
  end

  def fetchRefundOrder(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFetchRefundOrder,
      "#{@namespace_prefix}.fetchRefundOrder"
    )
  end

  def fetchCustomizedContestList(client, %Lq.ReqFetchCustomizedContestList{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestList,
      Lq.ResFetchCustomizedContestList,
      "#{@namespace_prefix}.fetchCustomizedContestList"
    )
  end

  def fetchCustomizedContestExtendInfo(
        client,
        %Lq.ReqFetchCustomizedContestExtendInfo{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestExtendInfo,
      Lq.ResFetchCustomizedContestExtendInfo,
      "#{@namespace_prefix}.fetchCustomizedContestExtendInfo"
    )
  end

  def fetchCustomizedContestAuthInfo(client, %Lq.ReqFetchCustomizedContestAuthInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestAuthInfo,
      Lq.ResFetchCustomizedContestAuthInfo,
      "#{@namespace_prefix}.fetchCustomizedContestAuthInfo"
    )
  end

  def enterCustomizedContest(client, %Lq.ReqEnterCustomizedContest{} = message) do
    send_message(
      client,
      message,
      Lq.ReqEnterCustomizedContest,
      Lq.ResEnterCustomizedContest,
      "#{@namespace_prefix}.enterCustomizedContest"
    )
  end

  def leaveCustomizedContest(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.leaveCustomizedContest"
    )
  end

  def fetchCustomizedContestOnlineInfo(
        client,
        %Lq.ReqFetchCustomizedContestOnlineInfo{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestOnlineInfo,
      Lq.ResFetchCustomizedContestOnlineInfo,
      "#{@namespace_prefix}.fetchCustomizedContestOnlineInfo"
    )
  end

  def fetchCustomizedContestByContestId(
        client,
        %Lq.ReqFetchCustomizedContestByContestId{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestByContestId,
      Lq.ResFetchCustomizedContestByContestId,
      "#{@namespace_prefix}.fetchCustomizedContestByContestId"
    )
  end

  def startCustomizedContest(client, %Lq.ReqStartCustomizedContest{} = message) do
    send_message(
      client,
      message,
      Lq.ReqStartCustomizedContest,
      Lq.ResCommon,
      "#{@namespace_prefix}.startCustomizedContest"
    )
  end

  def stopCustomizedContest(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.stopCustomizedContest"
    )
  end

  def joinCustomizedContestChatRoom(client, %Lq.ReqJoinCustomizedContestChatRoom{} = message) do
    send_message(
      client,
      message,
      Lq.ReqJoinCustomizedContestChatRoom,
      Lq.ResJoinCustomizedContestChatRoom,
      "#{@namespace_prefix}.joinCustomizedContestChatRoom"
    )
  end

  def leaveCustomizedContestChatRoom(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.leaveCustomizedContestChatRoom"
    )
  end

  def sayChatMessage(client, %Lq.ReqSayChatMessage{} = message) do
    send_message(
      client,
      message,
      Lq.ReqSayChatMessage,
      Lq.ResCommon,
      "#{@namespace_prefix}.sayChatMessage"
    )
  end

  def fetchCustomizedContestGameRecords(
        client,
        %Lq.ReqFetchCustomizedContestGameRecords{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestGameRecords,
      Lq.ResFetchCustomizedContestGameRecords,
      "#{@namespace_prefix}.fetchCustomizedContestGameRecords"
    )
  end

  def fetchCustomizedContestGameLiveList(
        client,
        %Lq.ReqFetchCustomizedContestGameLiveList{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqFetchCustomizedContestGameLiveList,
      Lq.ResFetchCustomizedContestGameLiveList,
      "#{@namespace_prefix}.fetchCustomizedContestGameLiveList"
    )
  end

  def followCustomizedContest(client, %Lq.ReqTargetCustomizedContest{} = message) do
    send_message(
      client,
      message,
      Lq.ReqTargetCustomizedContest,
      Lq.ResCommon,
      "#{@namespace_prefix}.followCustomizedContest"
    )
  end

  def unfollowCustomizedContest(client, %Lq.ReqTargetCustomizedContest{} = message) do
    send_message(
      client,
      message,
      Lq.ReqTargetCustomizedContest,
      Lq.ResCommon,
      "#{@namespace_prefix}.unfollowCustomizedContest"
    )
  end

  def fetchActivityList(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResActivityList,
      "#{@namespace_prefix}.fetchActivityList"
    )
  end

  def fetchAccountActivityData(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResAccountActivityData,
      "#{@namespace_prefix}.fetchAccountActivityData"
    )
  end

  def exchangeActivityItem(client, %Lq.ReqExchangeActivityItem{} = message) do
    send_message(
      client,
      message,
      Lq.ReqExchangeActivityItem,
      Lq.ResExchangeActivityItem,
      "#{@namespace_prefix}.exchangeActivityItem"
    )
  end

  def completeActivityTask(client, %Lq.ReqCompleteActivityTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCompleteActivityTask,
      Lq.ResCommon,
      "#{@namespace_prefix}.completeActivityTask"
    )
  end

  def completeActivityFlipTask(client, %Lq.ReqCompleteActivityTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCompleteActivityTask,
      Lq.ResCommon,
      "#{@namespace_prefix}.completeActivityFlipTask"
    )
  end

  def completePeriodActivityTask(client, %Lq.ReqCompleteActivityTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCompleteActivityTask,
      Lq.ResCommon,
      "#{@namespace_prefix}.completePeriodActivityTask"
    )
  end

  def completeRandomActivityTask(client, %Lq.ReqCompleteActivityTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCompleteActivityTask,
      Lq.ResCommon,
      "#{@namespace_prefix}.completeRandomActivityTask"
    )
  end

  def receiveActivityFlipTask(client, %Lq.ReqReceiveActivityFlipTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReceiveActivityFlipTask,
      Lq.ResReceiveActivityFlipTask,
      "#{@namespace_prefix}.receiveActivityFlipTask"
    )
  end

  def fetchActivityFlipInfo(client, %Lq.ReqFetchActivityFlipInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchActivityFlipInfo,
      Lq.ResFetchActivityFlipInfo,
      "#{@namespace_prefix}.fetchActivityFlipInfo"
    )
  end

  def gainAccumulatedPointActivityReward(
        client,
        %Lq.ReqGainAccumulatedPointActivityReward{} = message
      ) do
    send_message(
      client,
      message,
      Lq.ReqGainAccumulatedPointActivityReward,
      Lq.ResCommon,
      "#{@namespace_prefix}.gainAccumulatedPointActivityReward"
    )
  end

  def gainMultiPointActivityReward(client, %Lq.ReqGainMultiPointActivityReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGainMultiPointActivityReward,
      Lq.ResCommon,
      "#{@namespace_prefix}.gainMultiPointActivityReward"
    )
  end

  def fetchRankPointLeaderboard(client, %Lq.ReqFetchRankPointLeaderboard{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchRankPointLeaderboard,
      Lq.ResFetchRankPointLeaderboard,
      "#{@namespace_prefix}.fetchRankPointLeaderboard"
    )
  end

  def gainRankPointReward(client, %Lq.ReqGainRankPointReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGainRankPointReward,
      Lq.ResCommon,
      "#{@namespace_prefix}.gainRankPointReward"
    )
  end

  def richmanActivityNextMove(client, %Lq.ReqRichmanNextMove{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRichmanNextMove,
      Lq.ResRichmanNextMove,
      "#{@namespace_prefix}.richmanActivityNextMove"
    )
  end

  def richmanAcitivitySpecialMove(client, %Lq.ReqRichmanSpecialMove{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRichmanSpecialMove,
      Lq.ResRichmanNextMove,
      "#{@namespace_prefix}.richmanAcitivitySpecialMove"
    )
  end

  def richmanActivityChestInfo(client, %Lq.ReqRichmanChestInfo{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRichmanChestInfo,
      Lq.ResRichmanChestInfo,
      "#{@namespace_prefix}.richmanActivityChestInfo"
    )
  end

  def createGameObserveAuth(client, %Lq.ReqCreateGameObserveAuth{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCreateGameObserveAuth,
      Lq.ResCreateGameObserveAuth,
      "#{@namespace_prefix}.createGameObserveAuth"
    )
  end

  def refreshGameObserveAuth(client, %Lq.ReqRefreshGameObserveAuth{} = message) do
    send_message(
      client,
      message,
      Lq.ReqRefreshGameObserveAuth,
      Lq.ResRefreshGameObserveAuth,
      "#{@namespace_prefix}.refreshGameObserveAuth"
    )
  end

  def fetchActivityBuff(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResActivityBuff,
      "#{@namespace_prefix}.fetchActivityBuff"
    )
  end

  def upgradeActivityBuff(client, %Lq.ReqUpgradeActivityBuff{} = message) do
    send_message(
      client,
      message,
      Lq.ReqUpgradeActivityBuff,
      Lq.ResActivityBuff,
      "#{@namespace_prefix}.upgradeActivityBuff"
    )
  end

  def upgradeChallenge(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResUpgradeChallenge,
      "#{@namespace_prefix}.upgradeChallenge"
    )
  end

  def refreshChallenge(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResRefreshChallenge,
      "#{@namespace_prefix}.refreshChallenge"
    )
  end

  def fetchChallengeInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFetchChallengeInfo,
      "#{@namespace_prefix}.fetchChallengeInfo"
    )
  end

  def forceCompleteChallengeTask(client, %Lq.ReqForceCompleteChallengeTask{} = message) do
    send_message(
      client,
      message,
      Lq.ReqForceCompleteChallengeTask,
      Lq.ResCommon,
      "#{@namespace_prefix}.forceCompleteChallengeTask"
    )
  end

  def fetchChallengeSeason(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResChallengeSeasonInfo,
      "#{@namespace_prefix}.fetchChallengeSeason"
    )
  end

  def receiveChallengeRankReward(client, %Lq.ReqReceiveChallengeRankReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReceiveChallengeRankReward,
      Lq.ResReceiveChallengeRankReward,
      "#{@namespace_prefix}.receiveChallengeRankReward"
    )
  end

  def fetchABMatchInfo(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResFetchABMatch,
      "#{@namespace_prefix}.fetchABMatchInfo"
    )
  end

  def buyInABMatch(client, %Lq.ReqBuyInABMatch{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyInABMatch,
      Lq.ResCommon,
      "#{@namespace_prefix}.buyInABMatch"
    )
  end

  def receiveABMatchReward(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.receiveABMatchReward"
    )
  end

  def quitABMatch(client) do
    send_message(
      client,
      %Lq.ReqCommon{},
      Lq.ReqCommon,
      Lq.ResCommon,
      "#{@namespace_prefix}.quitABMatch"
    )
  end

  def startUnifiedMatch(client, %Lq.ReqStartUnifiedMatch{} = message) do
    send_message(
      client,
      message,
      Lq.ReqStartUnifiedMatch,
      Lq.ResCommon,
      "#{@namespace_prefix}.startUnifiedMatch"
    )
  end

  def cancelUnifiedMatch(client, %Lq.ReqCancelUnifiedMatch{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCancelUnifiedMatch,
      Lq.ResCommon,
      "#{@namespace_prefix}.cancelUnifiedMatch"
    )
  end

  def fetchGamePointRank(client, %Lq.ReqGamePointRank{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGamePointRank,
      Lq.ResGamePointRank,
      "#{@namespace_prefix}.fetchGamePointRank"
    )
  end

  def fetchSelfGamePointRank(client, %Lq.ReqGamePointRank{} = message) do
    send_message(
      client,
      message,
      Lq.ReqGamePointRank,
      Lq.ResFetchSelfGamePointRank,
      "#{@namespace_prefix}.fetchSelfGamePointRank"
    )
  end

  def readSNS(client, %Lq.ReqReadSNS{} = message) do
    send_message(client, message, Lq.ReqReadSNS, Lq.ResReadSNS, "#{@namespace_prefix}.readSNS")
  end

  def replySNS(client, %Lq.ReqReplySNS{} = message) do
    send_message(client, message, Lq.ReqReplySNS, Lq.ResReplySNS, "#{@namespace_prefix}.replySNS")
  end

  def likeSNS(client, %Lq.ReqLikeSNS{} = message) do
    send_message(client, message, Lq.ReqLikeSNS, Lq.ResLikeSNS, "#{@namespace_prefix}.likeSNS")
  end

  def digMine(client, %Lq.ReqDigMine{} = message) do
    send_message(client, message, Lq.ReqDigMine, Lq.ResDigMine, "#{@namespace_prefix}.digMine")
  end

  def fetchLastPrivacy(client, %Lq.ReqFetchLastPrivacy{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchLastPrivacy,
      Lq.ResFetchLastPrivacy,
      "#{@namespace_prefix}.fetchLastPrivacy"
    )
  end

  def checkPrivacy(client, %Lq.ReqCheckPrivacy{} = message) do
    send_message(
      client,
      message,
      Lq.ReqCheckPrivacy,
      Lq.ResCommon,
      "#{@namespace_prefix}.checkPrivacy"
    )
  end

  def responseCaptcha(client, %Lq.ReqResponseCaptcha{} = message) do
    send_message(
      client,
      message,
      Lq.ReqResponseCaptcha,
      Lq.ResCommon,
      "#{@namespace_prefix}.responseCaptcha"
    )
  end

  def fetchRPGBattleHistory(client, %Lq.ReqFetchRPGBattleHistory{} = message) do
    send_message(
      client,
      message,
      Lq.ReqFetchRPGBattleHistory,
      Lq.ResFetchRPGBattleHistory,
      "#{@namespace_prefix}.fetchRPGBattleHistory"
    )
  end

  def receiveRPGRewards(client, %Lq.ReqReceiveRPGRewards{} = message) do
    send_message(
      client,
      message,
      Lq.ReqReceiveRPGRewards,
      Lq.ResReceiveRPGRewards,
      "#{@namespace_prefix}.receiveRPGRewards"
    )
  end

  def buyArenaTicket(client, %Lq.ReqBuyArenaTicket{} = message) do
    send_message(
      client,
      message,
      Lq.ReqBuyArenaTicket,
      Lq.ResCommon,
      "#{@namespace_prefix}.buyArenaTicket"
    )
  end

  def enterArena(client, %Lq.ReqEnterArena{} = message) do
    send_message(
      client,
      message,
      Lq.ReqEnterArena,
      Lq.ResCommon,
      "#{@namespace_prefix}.enterArena"
    )
  end

  def receiveArenaReward(client, %Lq.ReqArenaReward{} = message) do
    send_message(
      client,
      message,
      Lq.ReqArenaReward,
      Lq.ResArenaReward,
      "#{@namespace_prefix}.receiveArenaReward"
    )
  end
end
