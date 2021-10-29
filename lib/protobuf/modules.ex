defmodule Soulless.Protobuf.Modules do
  def get_module_by_identifier(name, modules) do
    case Map.get(modules, name) do
      nil ->
        {:error, "No module was found for identifier #{name}"}

      value ->
        {:ok, value}
    end
  end

  def generate_module_lookup_map(file_path, namespace) do
    generate_module_names(file_path)
    |> Enum.map(fn module_name ->
      {".#{module_name}", Module.safe_concat([namespace, upcase_first(module_name)])}
    end)
    |> Enum.into(Map.new())
  end

  def generate_module_names(file_path) do
    file_contents = File.read!(file_path)
    {:ok, parsed_proto, _, _, _, _} = Soulless.Protobuf.Parser.parse(file_contents)
    package = Keyword.get(parsed_proto, :package)

    get_module_names(parsed_proto, add_prefix(package, nil))
    |> MapSet.new()
  end

  defp get_module_names(message, prefix) do
    message
    |> Stream.filter(fn {type, _} -> type == :message end)
    |> Stream.flat_map(fn {_, message} ->
      this_module = add_prefix(Keyword.get(message, :name), prefix)

      Enum.concat(
        get_module_names(Keyword.get(message, :fields), this_module),
        [this_module]
      )
    end)
  end

  defp upcase_first(string) do
    first = String.first(string)
    String.replace_leading(string, first, String.upcase(first))
  end

  defp add_prefix(text, prefix) do
    if prefix do
      "#{prefix}.#{text}"
    else
      text
    end
  end
end
