defmodule GenerateProtoFile do
  def run([input_file, output_file]) do
    input_file
      |> File.read!()
      |> Jason.decode!(objects: :ordered_objects)
      |> parse()
      |> indent_lines()
      |> Enum.join("\n")
      |> (&File.write!(output_file, &1)).()

    IO.puts "Converted '#{input_file}' to '#{output_file}'"
  end

  def indent_lines(lines) do
    Enum.map(
      lines,
      fn {text, depth} ->
        String.duplicate(" ", 2 * depth) <> text
      end
    )
  end

  def parse(input) do
    depth = 0
    nested = input["nested"]
    {package_name, package} = Enum.at(nested, 0)

    header = [
        {"syntax = \"proto3\";\n", depth},
        {"package #{package_name};\n", depth},
    ]

    lines = Enum.flat_map(
      package["nested"],
      fn {name, item} -> parse_items(name, item, depth) end
    )

    header ++ extra_headers() ++ lines
  end

  def parse_items(name, item, depth) do
    parsed_items =
      Enum.flat_map(
        item,
        fn {kind, values} ->
          parse_item(kind, name, values, depth) end
      )

    end_block = [{"}\n", depth}]

    parsed_items ++ end_block
  end

  def parse_item("fields", name, values, depth) do
    header = {"message #{name} {", depth}
    [header | parse_fields(name, values, depth + 1)]
  end

  def parse_item("methods", name, values, depth) do
    header = {"service #{name} {", depth}
    [header | parse_methods(values, depth + 1)]
  end

  def parse_item("values", name, values, depth) do
    header = {"enum #{name} {", depth}
    [header | parse_values(values, depth + 1)]
  end

  def parse_item("nested", _name, items, depth) do
    Enum.flat_map(
      items,
      fn {name, values} ->
        parse_items(name, values, depth + 1) end
    )
  end

  def parse_item(kind, _name, _values, _depth) do
    raise "Unknown item kind #{kind}"
  end

  def parse_values(values, depth) do
    Enum.map(values, fn {name, value} ->
      {"#{name} = #{value};", depth}
    end)
  end

  def parse_methods(methods, depth) do
    Enum.map(methods, fn {name, method} ->
      request_type = method["requestType"]
      response_type = method["responseType"]
      text = "rpc #{name} (#{request_type}) returns (#{response_type});"
      {text, depth}
    end)
  end

  def parse_fields(message, fields, depth) do
    Enum.map(fields, fn {name, field} ->
      rule = parse_rule(field)
      new_type = maybe_override_type(message, name, field["type"])
      text = "#{rule}#{new_type} #{name} = #{field["id"]};"
      {text, depth}
    end)
  end

  def parse_rule(field) do
    case field["rule"] do
      nil -> ""
      rule -> "#{rule} "
    end
  end

  def maybe_override_type(parent_name, field_name, current_type) do
    cond do
      parent_name != "Wrapper" and parent_name != "ActionPrototype" and current_type == "bytes" ->
        "Wrapper"

      parent_name == "Error" and field_name == "code" ->
        "ErrorCode"

      true -> current_type
    end
  end

  def extra_headers() do
    [{"import \"error.proto\";\n", 0}]
  end

end

GenerateProtoFile.run(System.argv())
