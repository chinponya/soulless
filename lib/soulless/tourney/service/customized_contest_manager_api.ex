defmodule Soulless.Tourney.Service.CustomizedContestManagerApi do
  use Soulless.RPC,
    file: "priv/protos/tourney.proto",
    service: "CustomizedContestManagerApi",
    namespace: Soulless.Tourney
end
