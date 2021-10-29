defmodule Soulless.Protobuf.Parser.Helpers do
  import NimbleParsec

  def white_space(combinator \\ empty()) do
    ignore(combinator, ascii_string([?\s, ?\n, ?\t], min: 1))
  end

  def optional_white_space(combinator \\ empty()) do
    optional(white_space(combinator))
  end

  def semicolon(combinator \\ empty()) do
    ignore(combinator, string(";"))
  end

  def equals(combinator \\ empty()) do
    ignore(combinator, string("="))
  end

  def legal_string(combinator \\ empty()) do
    ascii_string(combinator, [?0..?9, ?a..?z, ?A..?Z, ?_, ?.], min: 1)
  end

  def literal_between(combinator \\ empty(), value, start_string, end_string) do
    combinator
    |> ignore(string(start_string))
    |> string(value)
    |> ignore(string(end_string))
  end

  def quoted_literal(combinator \\ empty(), value) do
    literal_between(combinator, value, "\"", "\"")
  end

  def legal_string_between(combinator \\ empty(), start_string, end_string) do
    combinator
    |> ignore(string(start_string))
    |> legal_string()
    |> ignore(string(end_string))
  end

  def quoted_legal_string(combinator \\ empty()) do
    legal_string_between(combinator, "\"", "\"")
  end

  def start_block(combinator \\ empty(), symbol \\ "{") do
    ignore(combinator, string(symbol))
  end

  def end_block(combinator \\ empty(), symbol \\ "}") do
    ignore(combinator, string(symbol))
  end

  def protobuf_type(combinator \\ empty()) do
    combinator
    |> choice([
      string("any") |> replace(:any),
      string("bool") |> replace(:bool),
      string("string") |> replace(:string),
      string("bytes") |> replace(:bytes),
      string("int32") |> replace(:int32),
      string("int64") |> replace(:int64),
      string("uint32") |> replace(:uint32),
      string("uint64") |> replace(:uint64),
      string("sint32") |> replace(:sint32),
      string("sint64") |> replace(:sint64),
      string("fixed32") |> replace(:fixed32),
      string("fixed64") |> replace(:fixed64),
      string("sfixed32") |> replace(:sfixed32),
      string("sfixed64") |> replace(:sfixed64),
      string("float") |> replace(:float),
      string("double") |> replace(:double),
      legal_string() |> unwrap_and_tag(:custom)
    ])
  end

  def type_in_parentheses(combinator \\ empty()) do
    combinator
    |> start_block("(")
    |> protobuf_type()
    |> end_block(")")
  end
end

defmodule Soulless.Protobuf.Parser do
  import NimbleParsec
  import Soulless.Protobuf.Parser.Helpers

  defcombinatorp(
    :syntax,
    ignore(string("syntax"))
    |> optional_white_space()
    |> equals()
    |> optional_white_space()
    |> choice([
      quoted_literal("proto2") |> replace(:proto2),
      quoted_literal("proto3") |> replace(:proto3)
    ])
    |> semicolon()
  )

  defcombinatorp(
    :package,
    ignore(string("package"))
    |> white_space()
    |> legal_string()
    |> semicolon()
  )

  defcombinatorp(
    :enum_field,
    empty()
    |> concat(
      legal_string()
      |> unwrap_and_tag(:name)
    )
    |> optional_white_space()
    |> equals()
    |> optional_white_space()
    |> concat(integer(min: 1) |> unwrap_and_tag(:value))
    |> semicolon()
  )

  defcombinatorp(
    :enum,
    ignore(string("enum"))
    |> white_space()
    |> concat(legal_string() |> unwrap_and_tag(:name))
    |> optional_white_space()
    |> start_block()
    |> concat(
      repeat(optional_white_space() |> parsec(:enum_field) |> tag(:option))
      |> tag(:options)
    )
    |> optional_white_space()
    |> end_block()
  )

  defcombinator(
    :field,
    empty()
    |> concat(
      protobuf_type()
      |> unwrap_and_tag(:type)
    )
    |> white_space()
    |> concat(
      legal_string()
      |> unwrap_and_tag(:name)
    )
    |> white_space()
    |> equals()
    |> white_space()
    |> concat(integer(min: 1) |> unwrap_and_tag(:id))
    |> semicolon()
  )

  defcombinatorp(
    :repeated_field,
    ignore(string("repeated"))
    |> white_space()
    |> parsec(:field)
  )

  defcombinatorp(
    :optional_field,
    ignore(string("optional"))
    |> white_space()
    |> parsec(:field)
  )

  defcombinatorp(
    :field_or_message,
    choice([
      parsec(:repeated_field) |> tag(:repeated_field),
      parsec(:optional_field) |> tag(:optional_field),
      parsec(:field) |> tag(:field),
      lookahead(string("message")) |> parsec(:message) |> tag(:message)
    ])
  )

  defcombinatorp(
    :message,
    ignore(string("message"))
    |> white_space()
    |> concat(legal_string() |> unwrap_and_tag(:name))
    |> white_space()
    |> start_block()
    |> concat(
      repeat(optional_white_space() |> parsec(:field_or_message))
      |> tag(:fields)
    )
    |> optional_white_space()
    |> end_block()
  )

  defcombinatorp(
    :rpc,
    ignore(string("rpc"))
    |> white_space()
    |> concat(legal_string() |> unwrap_and_tag(:function))
    |> white_space()
    |> concat(type_in_parentheses() |> unwrap_and_tag(:request_type))
    |> white_space()
    |> ignore(string("returns"))
    |> white_space()
    |> concat(type_in_parentheses() |> unwrap_and_tag(:return_type))
    |> semicolon()
  )

  defcombinatorp(
    :service,
    ignore(string("service"))
    |> white_space()
    |> concat(legal_string() |> unwrap_and_tag(:name))
    |> white_space()
    |> start_block()
    |> concat(
      repeat(optional_white_space() |> parsec(:rpc) |> tag(:rpc))
      |> tag(:procedures)
    )
    |> optional_white_space()
    |> end_block()
  )

  defcombinatorp(
    :message_or_service,
    choice([
      lookahead(string("message")) |> parsec(:message) |> tag(:message),
      lookahead(string("service")) |> parsec(:service) |> tag(:service),
      lookahead(string("enum")) |> parsec(:enum) |> tag(:enum)
    ])
  )

  defcombinatorp(
    :proto,
    optional_white_space()
    |> concat(parsec(:syntax) |> unwrap_and_tag(:syntax))
    |> optional_white_space()
    |> concat(parsec(:package) |> unwrap_and_tag(:package))
    |> repeat(optional_white_space() |> parsec(:message_or_service))
    |> optional_white_space()
    |> eos()
  )

  defparsec(:parse, parsec(:proto))
end
