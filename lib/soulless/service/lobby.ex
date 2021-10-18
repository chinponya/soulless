defmodule Soulless.Service.Lobby do
  # TODO reimplement this module as a macro
  alias Soulless.Lq

  @namespace_prefix ".lq.Lobby"

  def heatbeat() do
    %Soulless.RPC{
      message: %Lq.ReqHeatBeat{no_operation_counter: 1},
      request_module: Lq.ReqHeatBeat,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.heatbeat"
    }
  end

  def fetchConnectionInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResConnectionInfo,
      namespace: "#{@namespace_prefix}.fetchConnectionInfo"
    }
  end

  def signup(%Lq.ReqSignupAccount{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSignupAccount,
      response_module: Lq.ResSignupAccount,
      namespace: "#{@namespace_prefix}.signup"
    }
  end

  def login(%Lq.ReqLogin{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLogin,
      response_module: Lq.ResLogin,
      namespace: "#{@namespace_prefix}.login"
    }
  end

  def loginSuccess() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.loginSuccess"
    }
  end

  def emailLogin(%Lq.ReqEmailLogin{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqEmailLogin,
      response_module: Lq.ResLogin,
      namespace: "#{@namespace_prefix}.emailLogin"
    }
  end

  def oauth2Auth(%Lq.ReqOauth2Auth{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOauth2Auth,
      response_module: Lq.ResOauth2Auth,
      namespace: "#{@namespace_prefix}.oauth2Auth"
    }
  end

  def oauth2Check(%Lq.ReqOauth2Check{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOauth2Check,
      response_module: Lq.ResOauth2Check,
      namespace: "#{@namespace_prefix}.oauth2Check"
    }
  end

  def oauth2Signup(%Lq.ReqOauth2Signup{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOauth2Signup,
      response_module: Lq.ResOauth2Signup,
      namespace: "#{@namespace_prefix}.oauth2Signup"
    }
  end

  def oauth2Login(%Lq.ReqOauth2Login{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOauth2Login,
      response_module: Lq.ResLogin,
      namespace: "#{@namespace_prefix}.oauth2Login"
    }
  end

  def dmmPreLogin(%Lq.ReqDMMPreLogin{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqDMMPreLogin,
      response_module: Lq.ResDMMPreLogin,
      namespace: "#{@namespace_prefix}.dmmPreLogin"
    }
  end

  def createPhoneVerifyCode(%Lq.ReqCreatePhoneVerifyCode{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreatePhoneVerifyCode,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.createPhoneVerifyCode"
    }
  end

  def createEmailVerifyCode(%Lq.ReqCreateEmailVerifyCode{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateEmailVerifyCode,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.createEmailVerifyCode"
    }
  end

  def verfifyCodeForSecure(%Lq.ReqVerifyCodeForSecure{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqVerifyCodeForSecure,
      response_module: Lq.ResVerfiyCodeForSecure,
      namespace: "#{@namespace_prefix}.verfifyCodeForSecure"
    }
  end

  def bindPhoneNumber(%Lq.ReqBindPhoneNumber{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBindPhoneNumber,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.bindPhoneNumber"
    }
  end

  def unbindPhoneNumber(%Lq.ReqUnbindPhoneNumber{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUnbindPhoneNumber,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.unbindPhoneNumber"
    }
  end

  def fetchPhoneLoginBind() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFetchPhoneLoginBind,
      namespace: "#{@namespace_prefix}.fetchPhoneLoginBind"
    }
  end

  def createPhoneLoginBind(%Lq.ReqCreatePhoneLoginBind{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreatePhoneLoginBind,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.createPhoneLoginBind"
    }
  end

  def bindEmail(%Lq.ReqBindEmail{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBindEmail,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.bindEmail"
    }
  end

  def modifyPassword(%Lq.ReqModifyPassword{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqModifyPassword,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.modifyPassword"
    }
  end

  def bindAccount(%Lq.ReqBindAccount{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBindAccount,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.bindAccount"
    }
  end

  def logout(%Lq.ReqLogout{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLogout,
      response_module: Lq.ResLogout,
      namespace: "#{@namespace_prefix}.logout"
    }
  end

  def loginBeat(%Lq.ReqLoginBeat{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLoginBeat,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.loginBeat"
    }
  end

  def createNickname(%Lq.ReqCreateNickname{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateNickname,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.createNickname"
    }
  end

  def modifyNickname(%Lq.ReqModifyNickname{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqModifyNickname,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.modifyNickname"
    }
  end

  def modifyBirthday(%Lq.ReqModifyBirthday{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqModifyBirthday,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.modifyBirthday"
    }
  end

  def fetchRoom() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResSelfRoom,
      namespace: "#{@namespace_prefix}.fetchRoom"
    }
  end

  def createRoom(%Lq.ReqCreateRoom{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateRoom,
      response_module: Lq.ResCreateRoom,
      namespace: "#{@namespace_prefix}.createRoom"
    }
  end

  def joinRoom(%Lq.ReqJoinRoom{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqJoinRoom,
      response_module: Lq.ResJoinRoom,
      namespace: "#{@namespace_prefix}.joinRoom"
    }
  end

  def leaveRoom() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.leaveRoom"
    }
  end

  def readyPlay(%Lq.ReqRoomReady{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRoomReady,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.readyPlay"
    }
  end

  def dressingStatus(%Lq.ReqRoomDressing{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRoomDressing,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.dressingStatus"
    }
  end

  def startRoom(%Lq.ReqRoomStart{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRoomStart,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.startRoom"
    }
  end

  def kickPlayer(%Lq.ReqRoomKick{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRoomKick,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.kickPlayer"
    }
  end

  def modifyRoom(%Lq.ReqModifyRoom{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqModifyRoom,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.modifyRoom"
    }
  end

  def matchGame(%Lq.ReqJoinMatchQueue{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqJoinMatchQueue,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.matchGame"
    }
  end

  def cancelMatch(%Lq.ReqCancelMatchQueue{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCancelMatchQueue,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.cancelMatch"
    }
  end

  def fetchAccountInfo(%Lq.ReqAccountInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqAccountInfo,
      response_module: Lq.ResAccountInfo,
      namespace: "#{@namespace_prefix}.fetchAccountInfo"
    }
  end

  def changeAvatar(%Lq.ReqChangeAvatar{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeAvatar,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.changeAvatar"
    }
  end

  def receiveVersionReward() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.receiveVersionReward"
    }
  end

  def fetchAccountStatisticInfo(%Lq.ReqAccountStatisticInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqAccountStatisticInfo,
      response_module: Lq.ResAccountStatisticInfo,
      namespace: "#{@namespace_prefix}.fetchAccountStatisticInfo"
    }
  end

  def fetchAccountChallengeRankInfo(%Lq.ReqAccountInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqAccountInfo,
      response_module: Lq.ResAccountChallengeRankInfo,
      namespace: "#{@namespace_prefix}.fetchAccountChallengeRankInfo"
    }
  end

  def fetchAccountCharacterInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResAccountCharacterInfo,
      namespace: "#{@namespace_prefix}.fetchAccountCharacterInfo"
    }
  end

  def shopPurchase(%Lq.ReqShopPurchase{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqShopPurchase,
      response_module: Lq.ResShopPurchase,
      namespace: "#{@namespace_prefix}.shopPurchase"
    }
  end

  def fetchGameRecord(%Lq.ReqGameRecord{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameRecord,
      response_module: Lq.ResGameRecord,
      namespace: "#{@namespace_prefix}.fetchGameRecord"
    }
  end

  def readGameRecord(%Lq.ReqGameRecord{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameRecord,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.readGameRecord"
    }
  end

  def fetchGameRecordList(%Lq.ReqGameRecordList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameRecordList,
      response_module: Lq.ResGameRecordList,
      namespace: "#{@namespace_prefix}.fetchGameRecordList"
    }
  end

  def fetchCollectedGameRecordList() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCollectedGameRecordList,
      namespace: "#{@namespace_prefix}.fetchCollectedGameRecordList"
    }
  end

  def fetchGameRecordsDetail(%Lq.ReqGameRecordsDetail{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameRecordsDetail,
      response_module: Lq.ResGameRecordsDetail,
      namespace: "#{@namespace_prefix}.fetchGameRecordsDetail"
    }
  end

  def addCollectedGameRecord(%Lq.ReqAddCollectedGameRecord{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqAddCollectedGameRecord,
      response_module: Lq.ResAddCollectedGameRecord,
      namespace: "#{@namespace_prefix}.addCollectedGameRecord"
    }
  end

  def removeCollectedGameRecord(%Lq.ReqRemoveCollectedGameRecord{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRemoveCollectedGameRecord,
      response_module: Lq.ResRemoveCollectedGameRecord,
      namespace: "#{@namespace_prefix}.removeCollectedGameRecord"
    }
  end

  def changeCollectedGameRecordRemarks(%Lq.ReqChangeCollectedGameRecordRemarks{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeCollectedGameRecordRemarks,
      response_module: Lq.ResChangeCollectedGameRecordRemarks,
      namespace: "#{@namespace_prefix}.changeCollectedGameRecordRemarks"
    }
  end

  def fetchLevelLeaderboard(%Lq.ReqLevelLeaderboard{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLevelLeaderboard,
      response_module: Lq.ResLevelLeaderboard,
      namespace: "#{@namespace_prefix}.fetchLevelLeaderboard"
    }
  end

  def fetchChallengeLeaderboard(%Lq.ReqChallangeLeaderboard{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChallangeLeaderboard,
      response_module: Lq.ResChallengeLeaderboard,
      namespace: "#{@namespace_prefix}.fetchChallengeLeaderboard"
    }
  end

  def fetchMutiChallengeLevel(%Lq.ReqMutiChallengeLevel{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqMutiChallengeLevel,
      response_module: Lq.ResMutiChallengeLevel,
      namespace: "#{@namespace_prefix}.fetchMutiChallengeLevel"
    }
  end

  def fetchMultiAccountBrief(%Lq.ReqMultiAccountId{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqMultiAccountId,
      response_module: Lq.ResMultiAccountBrief,
      namespace: "#{@namespace_prefix}.fetchMultiAccountBrief"
    }
  end

  def fetchFriendList() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFriendList,
      namespace: "#{@namespace_prefix}.fetchFriendList"
    }
  end

  def fetchFriendApplyList() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFriendApplyList,
      namespace: "#{@namespace_prefix}.fetchFriendApplyList"
    }
  end

  def applyFriend(%Lq.ReqApplyFriend{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqApplyFriend,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.applyFriend"
    }
  end

  def handleFriendApply(%Lq.ReqHandleFriendApply{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqHandleFriendApply,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.handleFriendApply"
    }
  end

  def removeFriend(%Lq.ReqRemoveFriend{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRemoveFriend,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.removeFriend"
    }
  end

  def searchAccountById(%Lq.ReqSearchAccountById{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSearchAccountById,
      response_module: Lq.ResSearchAccountById,
      namespace: "#{@namespace_prefix}.searchAccountById"
    }
  end

  def searchAccountByPattern(%Lq.ReqSearchAccountByPattern{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSearchAccountByPattern,
      response_module: Lq.ResSearchAccountByPattern,
      namespace: "#{@namespace_prefix}.searchAccountByPattern"
    }
  end

  def fetchAccountState(%Lq.ReqAccountList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqAccountList,
      response_module: Lq.ResAccountStates,
      namespace: "#{@namespace_prefix}.fetchAccountState"
    }
  end

  def fetchBagInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResBagInfo,
      namespace: "#{@namespace_prefix}.fetchBagInfo"
    }
  end

  def useBagItem(%Lq.ReqUseBagItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUseBagItem,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.useBagItem"
    }
  end

  def openManualItem(%Lq.ReqOpenManualItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOpenManualItem,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.openManualItem"
    }
  end

  def openRandomRewardItem(%Lq.ReqOpenRandomRewardItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOpenRandomRewardItem,
      response_module: Lq.ResOpenRandomRewardItem,
      namespace: "#{@namespace_prefix}.openRandomRewardItem"
    }
  end

  def openAllRewardItem(%Lq.ReqOpenAllRewardItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOpenAllRewardItem,
      response_module: Lq.ResOpenAllRewardItem,
      namespace: "#{@namespace_prefix}.openAllRewardItem"
    }
  end

  def composeShard(%Lq.ReqComposeShard{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqComposeShard,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.composeShard"
    }
  end

  def fetchAnnouncement(%Lq.ReqFetchAnnouncement{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchAnnouncement,
      response_module: Lq.ResAnnouncement,
      namespace: "#{@namespace_prefix}.fetchAnnouncement"
    }
  end

  def readAnnouncement(%Lq.ReqReadAnnouncement{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReadAnnouncement,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.readAnnouncement"
    }
  end

  def fetchMailInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResMailInfo,
      namespace: "#{@namespace_prefix}.fetchMailInfo"
    }
  end

  def readMail(%Lq.ReqReadMail{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReadMail,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.readMail"
    }
  end

  def deleteMail(%Lq.ReqDeleteMail{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqDeleteMail,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.deleteMail"
    }
  end

  def takeAttachmentFromMail(%Lq.ReqTakeAttachment{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqTakeAttachment,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.takeAttachmentFromMail"
    }
  end

  def receiveAchievementReward(%Lq.ReqReceiveAchievementReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReceiveAchievementReward,
      response_module: Lq.ResReceiveAchievementReward,
      namespace: "#{@namespace_prefix}.receiveAchievementReward"
    }
  end

  def receiveAchievementGroupReward(%Lq.ReqReceiveAchievementGroupReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReceiveAchievementGroupReward,
      response_module: Lq.ResReceiveAchievementGroupReward,
      namespace: "#{@namespace_prefix}.receiveAchievementGroupReward"
    }
  end

  def fetchAchievementRate() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFetchAchievementRate,
      namespace: "#{@namespace_prefix}.fetchAchievementRate"
    }
  end

  def fetchAchievement() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResAchievement,
      namespace: "#{@namespace_prefix}.fetchAchievement"
    }
  end

  def buyShiLian(%Lq.ReqBuyShiLian{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyShiLian,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.buyShiLian"
    }
  end

  def matchShiLian() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.matchShiLian"
    }
  end

  def goNextShiLian() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.goNextShiLian"
    }
  end

  def updateClientValue(%Lq.ReqUpdateClientValue{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateClientValue,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateClientValue"
    }
  end

  def fetchClientValue() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResClientValue,
      namespace: "#{@namespace_prefix}.fetchClientValue"
    }
  end

  def clientMessage(%Lq.ReqClientMessage{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqClientMessage,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.clientMessage"
    }
  end

  def fetchCurrentMatchInfo(%Lq.ReqCurrentMatchInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCurrentMatchInfo,
      response_module: Lq.ResCurrentMatchInfo,
      namespace: "#{@namespace_prefix}.fetchCurrentMatchInfo"
    }
  end

  def userComplain(%Lq.ReqUserComplain{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUserComplain,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.userComplain"
    }
  end

  def fetchReviveCoinInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResReviveCoinInfo,
      namespace: "#{@namespace_prefix}.fetchReviveCoinInfo"
    }
  end

  def gainReviveCoin() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gainReviveCoin"
    }
  end

  def fetchDailyTask() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResDailyTask,
      namespace: "#{@namespace_prefix}.fetchDailyTask"
    }
  end

  def refreshDailyTask(%Lq.ReqRefreshDailyTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRefreshDailyTask,
      response_module: Lq.ResRefreshDailyTask,
      namespace: "#{@namespace_prefix}.refreshDailyTask"
    }
  end

  def useGiftCode(%Lq.ReqUseGiftCode{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUseGiftCode,
      response_module: Lq.ResUseGiftCode,
      namespace: "#{@namespace_prefix}.useGiftCode"
    }
  end

  def useSpecialGiftCode(%Lq.ReqUseGiftCode{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUseGiftCode,
      response_module: Lq.ResUseSpecialGiftCode,
      namespace: "#{@namespace_prefix}.useSpecialGiftCode"
    }
  end

  def fetchTitleList() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResTitleList,
      namespace: "#{@namespace_prefix}.fetchTitleList"
    }
  end

  def useTitle(%Lq.ReqUseTitle{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUseTitle,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.useTitle"
    }
  end

  def sendClientMessage(%Lq.ReqSendClientMessage{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSendClientMessage,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.sendClientMessage"
    }
  end

  def fetchGameLiveInfo(%Lq.ReqGameLiveInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameLiveInfo,
      response_module: Lq.ResGameLiveInfo,
      namespace: "#{@namespace_prefix}.fetchGameLiveInfo"
    }
  end

  def fetchGameLiveLeftSegment(%Lq.ReqGameLiveLeftSegment{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameLiveLeftSegment,
      response_module: Lq.ResGameLiveLeftSegment,
      namespace: "#{@namespace_prefix}.fetchGameLiveLeftSegment"
    }
  end

  def fetchGameLiveList(%Lq.ReqGameLiveList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGameLiveList,
      response_module: Lq.ResGameLiveList,
      namespace: "#{@namespace_prefix}.fetchGameLiveList"
    }
  end

  def fetchCommentSetting() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommentSetting,
      namespace: "#{@namespace_prefix}.fetchCommentSetting"
    }
  end

  def updateCommentSetting(%Lq.ReqUpdateCommentSetting{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateCommentSetting,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateCommentSetting"
    }
  end

  def fetchCommentList(%Lq.ReqFetchCommentList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCommentList,
      response_module: Lq.ResFetchCommentList,
      namespace: "#{@namespace_prefix}.fetchCommentList"
    }
  end

  def fetchCommentContent(%Lq.ReqFetchCommentContent{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCommentContent,
      response_module: Lq.ResFetchCommentContent,
      namespace: "#{@namespace_prefix}.fetchCommentContent"
    }
  end

  def leaveComment(%Lq.ReqLeaveComment{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLeaveComment,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.leaveComment"
    }
  end

  def deleteComment(%Lq.ReqDeleteComment{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqDeleteComment,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.deleteComment"
    }
  end

  def updateReadComment(%Lq.ReqUpdateReadComment{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateReadComment,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateReadComment"
    }
  end

  def fetchRollingNotice() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ReqRollingNotice,
      namespace: "#{@namespace_prefix}.fetchRollingNotice"
    }
  end

  def fetchServerTime() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResServerTime,
      namespace: "#{@namespace_prefix}.fetchServerTime"
    }
  end

  def fetchPlatformProducts(%Lq.ReqPlatformBillingProducts{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqPlatformBillingProducts,
      response_module: Lq.ResPlatformBillingProducts,
      namespace: "#{@namespace_prefix}.fetchPlatformProducts"
    }
  end

  def cancelGooglePlayOrder(%Lq.ReqCancelGooglePlayOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCancelGooglePlayOrder,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.cancelGooglePlayOrder"
    }
  end

  def openChest(%Lq.ReqOpenChest{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqOpenChest,
      response_module: Lq.ResOpenChest,
      namespace: "#{@namespace_prefix}.openChest"
    }
  end

  def buyFromChestShop(%Lq.ReqBuyFromChestShop{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyFromChestShop,
      response_module: Lq.ResBuyFromChestShop,
      namespace: "#{@namespace_prefix}.buyFromChestShop"
    }
  end

  def fetchDailySignInInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResDailySignInInfo,
      namespace: "#{@namespace_prefix}.fetchDailySignInInfo"
    }
  end

  def doDailySignIn() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.doDailySignIn"
    }
  end

  def doActivitySignIn(%Lq.ReqDoActivitySignIn{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqDoActivitySignIn,
      response_module: Lq.ResDoActivitySignIn,
      namespace: "#{@namespace_prefix}.doActivitySignIn"
    }
  end

  def fetchCharacterInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCharacterInfo,
      namespace: "#{@namespace_prefix}.fetchCharacterInfo"
    }
  end

  def updateCharacterSort(%Lq.ReqUpdateCharacterSort{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateCharacterSort,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateCharacterSort"
    }
  end

  def changeMainCharacter(%Lq.ReqChangeMainCharacter{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeMainCharacter,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.changeMainCharacter"
    }
  end

  def changeCharacterSkin(%Lq.ReqChangeCharacterSkin{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeCharacterSkin,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.changeCharacterSkin"
    }
  end

  def changeCharacterView(%Lq.ReqChangeCharacterView{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeCharacterView,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.changeCharacterView"
    }
  end

  def sendGiftToCharacter(%Lq.ReqSendGiftToCharacter{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSendGiftToCharacter,
      response_module: Lq.ResSendGiftToCharacter,
      namespace: "#{@namespace_prefix}.sendGiftToCharacter"
    }
  end

  def sellItem(%Lq.ReqSellItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSellItem,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.sellItem"
    }
  end

  def fetchCommonView() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommonView,
      namespace: "#{@namespace_prefix}.fetchCommonView"
    }
  end

  def changeCommonView(%Lq.ReqChangeCommonView{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqChangeCommonView,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.changeCommonView"
    }
  end

  def saveCommonViews(%Lq.ReqSaveCommonViews{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSaveCommonViews,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.saveCommonViews"
    }
  end

  def fetchCommonViews(%Lq.ReqCommonViews{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCommonViews,
      response_module: Lq.ResCommonViews,
      namespace: "#{@namespace_prefix}.fetchCommonViews"
    }
  end

  def fetchAllCommonViews() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResAllcommonViews,
      namespace: "#{@namespace_prefix}.fetchAllCommonViews"
    }
  end

  def useCommonView(%Lq.ReqUseCommonView{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUseCommonView,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.useCommonView"
    }
  end

  def upgradeCharacter(%Lq.ReqUpgradeCharacter{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpgradeCharacter,
      response_module: Lq.ResUpgradeCharacter,
      namespace: "#{@namespace_prefix}.upgradeCharacter"
    }
  end

  def addFinishedEnding(%Lq.ReqFinishedEnding{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFinishedEnding,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.addFinishedEnding"
    }
  end

  def receiveEndingReward(%Lq.ReqFinishedEnding{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFinishedEnding,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.receiveEndingReward"
    }
  end

  def gameMasterCommand(%Lq.ReqGMCommand{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGMCommand,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gameMasterCommand"
    }
  end

  def fetchShopInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResShopInfo,
      namespace: "#{@namespace_prefix}.fetchShopInfo"
    }
  end

  def buyFromShop(%Lq.ReqBuyFromShop{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyFromShop,
      response_module: Lq.ResBuyFromShop,
      namespace: "#{@namespace_prefix}.buyFromShop"
    }
  end

  def buyFromZHP(%Lq.ReqBuyFromZHP{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyFromZHP,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.buyFromZHP"
    }
  end

  def refreshZHPShop(%Lq.ReqReshZHPShop{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReshZHPShop,
      response_module: Lq.ResRefreshZHPShop,
      namespace: "#{@namespace_prefix}.refreshZHPShop"
    }
  end

  def fetchMonthTicketInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResMonthTicketInfo,
      namespace: "#{@namespace_prefix}.fetchMonthTicketInfo"
    }
  end

  def payMonthTicket(%Lq.ReqPayMonthTicket{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqPayMonthTicket,
      response_module: Lq.ResPayMonthTicket,
      namespace: "#{@namespace_prefix}.payMonthTicket"
    }
  end

  def exchangeCurrency(%Lq.ReqExchangeCurrency{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqExchangeCurrency,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.exchangeCurrency"
    }
  end

  def exchangeChestStone(%Lq.ReqExchangeCurrency{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqExchangeCurrency,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.exchangeChestStone"
    }
  end

  def exchangeDiamond(%Lq.ReqExchangeCurrency{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqExchangeCurrency,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.exchangeDiamond"
    }
  end

  def fetchServerSettings() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResServerSettings,
      namespace: "#{@namespace_prefix}.fetchServerSettings"
    }
  end

  def fetchAccountSettings() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResAccountSettings,
      namespace: "#{@namespace_prefix}.fetchAccountSettings"
    }
  end

  def updateAccountSettings(%Lq.ReqUpdateAccountSettings{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateAccountSettings,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateAccountSettings"
    }
  end

  def fetchModNicknameTime() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResModNicknameTime,
      namespace: "#{@namespace_prefix}.fetchModNicknameTime"
    }
  end

  def createWechatNativeOrder(%Lq.ReqCreateWechatNativeOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateWechatNativeOrder,
      response_module: Lq.ResCreateWechatNativeOrder,
      namespace: "#{@namespace_prefix}.createWechatNativeOrder"
    }
  end

  def createWechatAppOrder(%Lq.ReqCreateWechatAppOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateWechatAppOrder,
      response_module: Lq.ResCreateWechatAppOrder,
      namespace: "#{@namespace_prefix}.createWechatAppOrder"
    }
  end

  def createAlipayOrder(%Lq.ReqCreateAlipayOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateAlipayOrder,
      response_module: Lq.ResCreateAlipayOrder,
      namespace: "#{@namespace_prefix}.createAlipayOrder"
    }
  end

  def createAlipayScanOrder(%Lq.ReqCreateAlipayScanOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateAlipayScanOrder,
      response_module: Lq.ResCreateAlipayScanOrder,
      namespace: "#{@namespace_prefix}.createAlipayScanOrder"
    }
  end

  def createAlipayAppOrder(%Lq.ReqCreateAlipayAppOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateAlipayAppOrder,
      response_module: Lq.ResCreateAlipayAppOrder,
      namespace: "#{@namespace_prefix}.createAlipayAppOrder"
    }
  end

  def createJPCreditCardOrder(%Lq.ReqCreateJPCreditCardOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPCreditCardOrder,
      response_module: Lq.ResCreateJPCreditCardOrder,
      namespace: "#{@namespace_prefix}.createJPCreditCardOrder"
    }
  end

  def createJPPaypalOrder(%Lq.ReqCreateJPPaypalOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPPaypalOrder,
      response_module: Lq.ResCreateJPPaypalOrder,
      namespace: "#{@namespace_prefix}.createJPPaypalOrder"
    }
  end

  def createJPAuOrder(%Lq.ReqCreateJPAuOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPAuOrder,
      response_module: Lq.ResCreateJPAuOrder,
      namespace: "#{@namespace_prefix}.createJPAuOrder"
    }
  end

  def createJPDocomoOrder(%Lq.ReqCreateJPDocomoOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPDocomoOrder,
      response_module: Lq.ResCreateJPDocomoOrder,
      namespace: "#{@namespace_prefix}.createJPDocomoOrder"
    }
  end

  def createJPWebMoneyOrder(%Lq.ReqCreateJPWebMoneyOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPWebMoneyOrder,
      response_module: Lq.ResCreateJPWebMoneyOrder,
      namespace: "#{@namespace_prefix}.createJPWebMoneyOrder"
    }
  end

  def createJPSoftbankOrder(%Lq.ReqCreateJPSoftbankOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateJPSoftbankOrder,
      response_module: Lq.ResCreateJPSoftbankOrder,
      namespace: "#{@namespace_prefix}.createJPSoftbankOrder"
    }
  end

  def createENPaypalOrder(%Lq.ReqCreateENPaypalOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateENPaypalOrder,
      response_module: Lq.ResCreateENPaypalOrder,
      namespace: "#{@namespace_prefix}.createENPaypalOrder"
    }
  end

  def createENMasterCardOrder(%Lq.ReqCreateENMasterCardOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateENMasterCardOrder,
      response_module: Lq.ResCreateENMasterCardOrder,
      namespace: "#{@namespace_prefix}.createENMasterCardOrder"
    }
  end

  def createENVisaOrder(%Lq.ReqCreateENVisaOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateENVisaOrder,
      response_module: Lq.ResCreateENVisaOrder,
      namespace: "#{@namespace_prefix}.createENVisaOrder"
    }
  end

  def createENJCBOrder(%Lq.ReqCreateENJCBOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateENJCBOrder,
      response_module: Lq.ResCreateENJCBOrder,
      namespace: "#{@namespace_prefix}.createENJCBOrder"
    }
  end

  def createENAlipayOrder(%Lq.ReqCreateENAlipayOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateENAlipayOrder,
      response_module: Lq.ResCreateENAlipayOrder,
      namespace: "#{@namespace_prefix}.createENAlipayOrder"
    }
  end

  def createDMMOrder(%Lq.ReqCreateDMMOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateDMMOrder,
      response_module: Lq.ResCreateDmmOrder,
      namespace: "#{@namespace_prefix}.createDMMOrder"
    }
  end

  def createIAPOrder(%Lq.ReqCreateIAPOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateIAPOrder,
      response_module: Lq.ResCreateIAPOrder,
      namespace: "#{@namespace_prefix}.createIAPOrder"
    }
  end

  def createSteamOrder(%Lq.ReqCreateSteamOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateSteamOrder,
      response_module: Lq.ResCreateSteamOrder,
      namespace: "#{@namespace_prefix}.createSteamOrder"
    }
  end

  def verifySteamOrder(%Lq.ReqVerifySteamOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.AAA,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.verifySteamOrder"
    }
  end

  def createMyCardAndroidOrder(%Lq.ReqCreateMyCardOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateMyCardOrder,
      response_module: Lq.ResCreateMyCardOrder,
      namespace: "#{@namespace_prefix}.createMyCardAndroidOrder"
    }
  end

  def createMyCardWebOrder(%Lq.ReqCreateMyCardOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateMyCardOrder,
      response_module: Lq.ResCreateMyCardOrder,
      namespace: "#{@namespace_prefix}.createMyCardWebOrder"
    }
  end

  def createPaypalOrder(%Lq.ReqCreatePaypalOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreatePaypalOrder,
      response_module: Lq.ResCreatePaypalOrder,
      namespace: "#{@namespace_prefix}.createPaypalOrder"
    }
  end

  def createXsollaOrder(%Lq.ReqCreateXsollaOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateXsollaOrder,
      response_module: Lq.ResCreateXsollaOrder,
      namespace: "#{@namespace_prefix}.createXsollaOrder"
    }
  end

  def verifyMyCardOrder(%Lq.ReqVerifyMyCardOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqVerifyMyCardOrder,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.verifyMyCardOrder"
    }
  end

  def verificationIAPOrder(%Lq.ReqVerificationIAPOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqVerificationIAPOrder,
      response_module: Lq.ResVerificationIAPOrder,
      namespace: "#{@namespace_prefix}.verificationIAPOrder"
    }
  end

  def createYostarSDKOrder(%Lq.ReqCreateYostarOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateYostarOrder,
      response_module: Lq.ResCreateYostarOrder,
      namespace: "#{@namespace_prefix}.createYostarSDKOrder"
    }
  end

  def createBillingOrder(%Lq.ReqCreateBillingOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateBillingOrder,
      response_module: Lq.ResCreateBillingOrder,
      namespace: "#{@namespace_prefix}.createBillingOrder"
    }
  end

  def solveGooglePlayOrder(%Lq.ReqSolveGooglePlayOrder{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSolveGooglePlayOrder,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.solveGooglePlayOrder"
    }
  end

  def solveGooglePayOrderV3(%Lq.ReqSolveGooglePlayOrderV3{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSolveGooglePlayOrderV3,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.solveGooglePayOrderV3"
    }
  end

  def fetchMisc() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResMisc,
      namespace: "#{@namespace_prefix}.fetchMisc"
    }
  end

  def modifySignature(%Lq.ReqModifySignature{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqModifySignature,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.modifySignature"
    }
  end

  def fetchIDCardInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResIDCardInfo,
      namespace: "#{@namespace_prefix}.fetchIDCardInfo"
    }
  end

  def updateIDCardInfo(%Lq.ReqUpdateIDCardInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpdateIDCardInfo,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.updateIDCardInfo"
    }
  end

  def fetchVipReward() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResVipReward,
      namespace: "#{@namespace_prefix}.fetchVipReward"
    }
  end

  def gainVipReward(%Lq.ReqGainVipReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGainVipReward,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gainVipReward"
    }
  end

  def fetchRefundOrder() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFetchRefundOrder,
      namespace: "#{@namespace_prefix}.fetchRefundOrder"
    }
  end

  def fetchCustomizedContestList(%Lq.ReqFetchCustomizedContestList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestList,
      response_module: Lq.ResFetchCustomizedContestList,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestList"
    }
  end

  def fetchCustomizedContestExtendInfo(%Lq.ReqFetchCustomizedContestExtendInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestExtendInfo,
      response_module: Lq.ResFetchCustomizedContestExtendInfo,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestExtendInfo"
    }
  end

  def fetchCustomizedContestAuthInfo(%Lq.ReqFetchCustomizedContestAuthInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestAuthInfo,
      response_module: Lq.ResFetchCustomizedContestAuthInfo,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestAuthInfo"
    }
  end

  def enterCustomizedContest(%Lq.ReqEnterCustomizedContest{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqEnterCustomizedContest,
      response_module: Lq.ResEnterCustomizedContest,
      namespace: "#{@namespace_prefix}.enterCustomizedContest"
    }
  end

  def leaveCustomizedContest() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.leaveCustomizedContest"
    }
  end

  def fetchCustomizedContestOnlineInfo(%Lq.ReqFetchCustomizedContestOnlineInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestOnlineInfo,
      response_module: Lq.ResFetchCustomizedContestOnlineInfo,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestOnlineInfo"
    }
  end

  def fetchCustomizedContestByContestId(%Lq.ReqFetchCustomizedContestByContestId{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestByContestId,
      response_module: Lq.ResFetchCustomizedContestByContestId,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestByContestId"
    }
  end

  def startCustomizedContest(%Lq.ReqStartCustomizedContest{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqStartCustomizedContest,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.startCustomizedContest"
    }
  end

  def stopCustomizedContest() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.stopCustomizedContest"
    }
  end

  def joinCustomizedContestChatRoom(%Lq.ReqJoinCustomizedContestChatRoom{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqJoinCustomizedContestChatRoom,
      response_module: Lq.ResJoinCustomizedContestChatRoom,
      namespace: "#{@namespace_prefix}.joinCustomizedContestChatRoom"
    }
  end

  def leaveCustomizedContestChatRoom() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.leaveCustomizedContestChatRoom"
    }
  end

  def sayChatMessage(%Lq.ReqSayChatMessage{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqSayChatMessage,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.sayChatMessage"
    }
  end

  def fetchCustomizedContestGameRecords(%Lq.ReqFetchCustomizedContestGameRecords{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestGameRecords,
      response_module: Lq.ResFetchCustomizedContestGameRecords,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestGameRecords"
    }
  end

  def fetchCustomizedContestGameLiveList(%Lq.ReqFetchCustomizedContestGameLiveList{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchCustomizedContestGameLiveList,
      response_module: Lq.ResFetchCustomizedContestGameLiveList,
      namespace: "#{@namespace_prefix}.fetchCustomizedContestGameLiveList"
    }
  end

  def followCustomizedContest(%Lq.ReqTargetCustomizedContest{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqTargetCustomizedContest,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.followCustomizedContest"
    }
  end

  def unfollowCustomizedContest(%Lq.ReqTargetCustomizedContest{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqTargetCustomizedContest,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.unfollowCustomizedContest"
    }
  end

  def fetchActivityList() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResActivityList,
      namespace: "#{@namespace_prefix}.fetchActivityList"
    }
  end

  def fetchAccountActivityData() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResAccountActivityData,
      namespace: "#{@namespace_prefix}.fetchAccountActivityData"
    }
  end

  def exchangeActivityItem(%Lq.ReqExchangeActivityItem{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqExchangeActivityItem,
      response_module: Lq.ResExchangeActivityItem,
      namespace: "#{@namespace_prefix}.exchangeActivityItem"
    }
  end

  def completeActivityTask(%Lq.ReqCompleteActivityTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCompleteActivityTask,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.completeActivityTask"
    }
  end

  def completeActivityFlipTask(%Lq.ReqCompleteActivityTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCompleteActivityTask,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.completeActivityFlipTask"
    }
  end

  def completePeriodActivityTask(%Lq.ReqCompleteActivityTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCompleteActivityTask,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.completePeriodActivityTask"
    }
  end

  def completeRandomActivityTask(%Lq.ReqCompleteActivityTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCompleteActivityTask,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.completeRandomActivityTask"
    }
  end

  def receiveActivityFlipTask(%Lq.ReqReceiveActivityFlipTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReceiveActivityFlipTask,
      response_module: Lq.ResReceiveActivityFlipTask,
      namespace: "#{@namespace_prefix}.receiveActivityFlipTask"
    }
  end

  def fetchActivityFlipInfo(%Lq.ReqFetchActivityFlipInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchActivityFlipInfo,
      response_module: Lq.ResFetchActivityFlipInfo,
      namespace: "#{@namespace_prefix}.fetchActivityFlipInfo"
    }
  end

  def gainAccumulatedPointActivityReward(%Lq.ReqGainAccumulatedPointActivityReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGainAccumulatedPointActivityReward,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gainAccumulatedPointActivityReward"
    }
  end

  def gainMultiPointActivityReward(%Lq.ReqGainMultiPointActivityReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGainMultiPointActivityReward,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gainMultiPointActivityReward"
    }
  end

  def fetchRankPointLeaderboard(%Lq.ReqFetchRankPointLeaderboard{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchRankPointLeaderboard,
      response_module: Lq.ResFetchRankPointLeaderboard,
      namespace: "#{@namespace_prefix}.fetchRankPointLeaderboard"
    }
  end

  def gainRankPointReward(%Lq.ReqGainRankPointReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGainRankPointReward,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.gainRankPointReward"
    }
  end

  def richmanActivityNextMove(%Lq.ReqRichmanNextMove{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRichmanNextMove,
      response_module: Lq.ResRichmanNextMove,
      namespace: "#{@namespace_prefix}.richmanActivityNextMove"
    }
  end

  def richmanAcitivitySpecialMove(%Lq.ReqRichmanSpecialMove{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRichmanSpecialMove,
      response_module: Lq.ResRichmanNextMove,
      namespace: "#{@namespace_prefix}.richmanAcitivitySpecialMove"
    }
  end

  def richmanActivityChestInfo(%Lq.ReqRichmanChestInfo{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRichmanChestInfo,
      response_module: Lq.ResRichmanChestInfo,
      namespace: "#{@namespace_prefix}.richmanActivityChestInfo"
    }
  end

  def createGameObserveAuth(%Lq.ReqCreateGameObserveAuth{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCreateGameObserveAuth,
      response_module: Lq.ResCreateGameObserveAuth,
      namespace: "#{@namespace_prefix}.createGameObserveAuth"
    }
  end

  def refreshGameObserveAuth(%Lq.ReqRefreshGameObserveAuth{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqRefreshGameObserveAuth,
      response_module: Lq.ResRefreshGameObserveAuth,
      namespace: "#{@namespace_prefix}.refreshGameObserveAuth"
    }
  end

  def fetchActivityBuff() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResActivityBuff,
      namespace: "#{@namespace_prefix}.fetchActivityBuff"
    }
  end

  def upgradeActivityBuff(%Lq.ReqUpgradeActivityBuff{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqUpgradeActivityBuff,
      response_module: Lq.ResActivityBuff,
      namespace: "#{@namespace_prefix}.upgradeActivityBuff"
    }
  end

  def upgradeChallenge() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResUpgradeChallenge,
      namespace: "#{@namespace_prefix}.upgradeChallenge"
    }
  end

  def refreshChallenge() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResRefreshChallenge,
      namespace: "#{@namespace_prefix}.refreshChallenge"
    }
  end

  def fetchChallengeInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFetchChallengeInfo,
      namespace: "#{@namespace_prefix}.fetchChallengeInfo"
    }
  end

  def forceCompleteChallengeTask(%Lq.ReqForceCompleteChallengeTask{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqForceCompleteChallengeTask,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.forceCompleteChallengeTask"
    }
  end

  def fetchChallengeSeason() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResChallengeSeasonInfo,
      namespace: "#{@namespace_prefix}.fetchChallengeSeason"
    }
  end

  def receiveChallengeRankReward(%Lq.ReqReceiveChallengeRankReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReceiveChallengeRankReward,
      response_module: Lq.ResReceiveChallengeRankReward,
      namespace: "#{@namespace_prefix}.receiveChallengeRankReward"
    }
  end

  def fetchABMatchInfo() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResFetchABMatch,
      namespace: "#{@namespace_prefix}.fetchABMatchInfo"
    }
  end

  def buyInABMatch(%Lq.ReqBuyInABMatch{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyInABMatch,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.buyInABMatch"
    }
  end

  def receiveABMatchReward() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.receiveABMatchReward"
    }
  end

  def quitABMatch() do
    %Soulless.RPC{
      message: %Lq.ReqCommon{},
      request_module: Lq.ReqCommon,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.quitABMatch"
    }
  end

  def startUnifiedMatch(%Lq.ReqStartUnifiedMatch{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqStartUnifiedMatch,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.startUnifiedMatch"
    }
  end

  def cancelUnifiedMatch(%Lq.ReqCancelUnifiedMatch{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCancelUnifiedMatch,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.cancelUnifiedMatch"
    }
  end

  def fetchGamePointRank(%Lq.ReqGamePointRank{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGamePointRank,
      response_module: Lq.ResGamePointRank,
      namespace: "#{@namespace_prefix}.fetchGamePointRank"
    }
  end

  def fetchSelfGamePointRank(%Lq.ReqGamePointRank{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqGamePointRank,
      response_module: Lq.ResFetchSelfGamePointRank,
      namespace: "#{@namespace_prefix}.fetchSelfGamePointRank"
    }
  end

  def readSNS(%Lq.ReqReadSNS{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReadSNS,
      response_module: Lq.ResReadSNS,
      namespace: "#{@namespace_prefix}.readSNS"
    }
  end

  def replySNS(%Lq.ReqReplySNS{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReplySNS,
      response_module: Lq.ResReplySNS,
      namespace: "#{@namespace_prefix}.replySNS"
    }
  end

  def likeSNS(%Lq.ReqLikeSNS{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqLikeSNS,
      response_module: Lq.ResLikeSNS,
      namespace: "#{@namespace_prefix}.likeSNS"
    }
  end

  def digMine(%Lq.ReqDigMine{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqDigMine,
      response_module: Lq.ResDigMine,
      namespace: "#{@namespace_prefix}.digMine"
    }
  end

  def fetchLastPrivacy(%Lq.ReqFetchLastPrivacy{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchLastPrivacy,
      response_module: Lq.ResFetchLastPrivacy,
      namespace: "#{@namespace_prefix}.fetchLastPrivacy"
    }
  end

  def checkPrivacy(%Lq.ReqCheckPrivacy{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqCheckPrivacy,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.checkPrivacy"
    }
  end

  def responseCaptcha(%Lq.ReqResponseCaptcha{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqResponseCaptcha,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.responseCaptcha"
    }
  end

  def fetchRPGBattleHistory(%Lq.ReqFetchRPGBattleHistory{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqFetchRPGBattleHistory,
      response_module: Lq.ResFetchRPGBattleHistory,
      namespace: "#{@namespace_prefix}.fetchRPGBattleHistory"
    }
  end

  def receiveRPGRewards(%Lq.ReqReceiveRPGRewards{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqReceiveRPGRewards,
      response_module: Lq.ResReceiveRPGRewards,
      namespace: "#{@namespace_prefix}.receiveRPGRewards"
    }
  end

  def buyArenaTicket(%Lq.ReqBuyArenaTicket{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqBuyArenaTicket,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.buyArenaTicket"
    }
  end

  def enterArena(%Lq.ReqEnterArena{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqEnterArena,
      response_module: Lq.ResCommon,
      namespace: "#{@namespace_prefix}.enterArena"
    }
  end

  def receiveArenaReward(%Lq.ReqArenaReward{} = message) do
    %Soulless.RPC{
      message: message,
      request_module: Lq.ReqArenaReward,
      response_module: Lq.ResArenaReward,
      namespace: "#{@namespace_prefix}.receiveArenaReward"
    }
  end
end
