defmodule Soulless.Game.Service do
  @modules Soulless.Protobuf.Modules.generate_rpc_lookup_map(
             "priv/protos/majsoul.proto",
             Soulless.Game
           )

  def get_rpc_by_identifier(name) do
    Soulless.Protobuf.Modules.get_module_by_identifier(name, @modules)
  end

  def get_rpc_by_identifier!(name) do
    {:ok, rpc} = get_rpc_by_identifier(name)
    rpc
  end
end
