defmodule Soulless do
  def create_module_lookup_map() do
    Application.ensure_loaded(:soulless)

    {:ok, modules} = :application.get_key(:soulless, :modules)

    modules
    |> Enum.filter(fn module ->
      String.starts_with?(to_string(module), "Elixir.Soulless.Lq")
    end)
    |> Enum.map(fn module ->
      {module
       |> Module.split()
       |> Enum.map(&String.downcase/1)
       |> Enum.drop(1)
       |> Enum.join("."), module}
    end)
    |> Map.new()
  end

  def get_module_by_identifier(name) do
    get_module_by_identifier(name, create_module_lookup_map())
  end

  def get_module_by_identifier(name, modules) do
    search_key =
      name
      |> String.downcase()
      |> String.split(".")
      |> Enum.drop(1)
      |> Enum.join(".")

    case Map.get(modules, search_key) do
      nil ->
        {:error, "No notice module was found for identifier #{name}"}

      value ->
        {:ok, value}
    end
  end
end
