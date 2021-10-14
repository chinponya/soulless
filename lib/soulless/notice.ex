defmodule Soulless.Notice do
  alias Soulless.Lq

  @prefix ".lq"
  @modules [
             Lq.NotifyAFKResult,
             Lq.NotifyAccountChallengeTaskUpdate,
             Lq.NotifyAccountLevelChange,
             Lq.NotifyAccountLogout,
             Lq.NotifyAccountRandomTaskUpdate,
             Lq.NotifyAccountUpdate,
             Lq.NotifyActivityChange,
             Lq.NotifyActivityPeriodTaskUpdate,
             Lq.NotifyActivityPoint,
             Lq.NotifyActivityPointV2,
             Lq.NotifyActivityReward,
             Lq.NotifyActivityRewardV2,
             Lq.NotifyActivityTaskUpdate,
             Lq.NotifyAnnouncementUpdate,
             Lq.NotifyAnotherLogin,
             Lq.NotifyCaptcha,
             Lq.NotifyClientMessage,
             Lq.NotifyCustomContestAccountMsg,
             Lq.NotifyCustomContestState,
             Lq.NotifyCustomContestSystemMsg,
             Lq.NotifyDailyTaskUpdate,
             Lq.NotifyDeleteMail,
             Lq.NotifyEndGameVote,
             Lq.NotifyFriendChange,
             Lq.NotifyFriendStateChange,
             Lq.NotifyFriendViewChange,
             Lq.NotifyGameBroadcast,
             Lq.NotifyGameEndResult,
             Lq.NotifyGameFinishReward,
             Lq.NotifyGameFinishRewardV2,
             Lq.NotifyGamePause,
             Lq.NotifyGameTerminate,
             Lq.NotifyGiftSendRefresh,
             Lq.NotifyLeaderboardPoint,
             Lq.NotifyLeaderboardPointV2,
             Lq.NotifyMatchGameStart,
             Lq.NotifyMatchTimeout,
             Lq.NotifyNewComment,
             Lq.NotifyNewFriendApply,
             Lq.NotifyNewGame,
             Lq.NotifyNewMail,
             Lq.NotifyObserveData,
             Lq.NotifyPayResult,
             Lq.NotifyPlayerConnectionState,
             Lq.NotifyPlayerLoadGameReady,
             Lq.NotifyReviveCoinUpdate,
             Lq.NotifyRollingNotice,
             Lq.NotifyRoomGameStart,
             Lq.NotifyRoomKickOut,
             Lq.NotifyRoomPlayerDressing,
             Lq.NotifyRoomPlayerReady,
             Lq.NotifyRoomPlayerUpdate,
             Lq.NotifyServerSetting,
             Lq.NotifyShopUpdate,
             Lq.NotifyVipLevelChange
           ]
           |> Enum.map(fn mod ->
             {@prefix <> (mod |> to_string |> String.replace_prefix("Elixir.Soulless.Lq", "")),
              mod}
           end)
           |> Map.new()

  def get_by_notice_name(name) do
    case Map.get(@modules, name) do
      nil ->
        {:error, "No notice module was found for identifier #{name}"}

      value ->
        {:ok, value}
    end
  end
end
