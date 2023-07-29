defmodule Soulless.Tourney.Lq do
  @modules Soulless.Protobuf.Modules.generate_module_lookup_map(
             "priv/protos/tourney.proto",
             Soulless.Tourney
           )

  def get_type_by_identifier(name) do
    Soulless.Protobuf.Modules.get_module_by_identifier(name, @modules)
  end
end
