defmodule Soulless.Tourney.Service do
  @modules Soulless.Protobuf.Modules.generate_rpc_lookup_map(
             "priv/protos/tourney.proto",
             Soulless.Tourney.Lq
           )

  def get_rpc_by_identifier(name) do
    Soulless.Protobuf.Modules.get_module_by_identifier(name, @modules)
  end

  def get_rpc_by_identifier!(name) do
    {:ok, rpc} = get_rpc_by_identifier(name)
    rpc
  end
end
