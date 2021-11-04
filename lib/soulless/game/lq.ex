defmodule Soulless.Game.Lq do
  @modules Soulless.Protobuf.Modules.generate_module_lookup_map(
             "priv/protos/majsoul.proto",
             Soulless.Game
           )

  def get_module_by_identifier(name) do
    Soulless.Protobuf.Modules.get_module_by_identifier(name, @modules)
  end
end
