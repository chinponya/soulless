defmodule Soulless.Game.Service.FastTest do
  use Soulless.RPC,
    file: "priv/protos/majsoul.proto",
    service: "FastTest",
    namespace: Soulless.Game
end
