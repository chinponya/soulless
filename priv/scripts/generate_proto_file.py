#!/usr/bin/env nix-shell
#! nix-shell -i python3 -p python3
import json
import sys
from collections import OrderedDict
from pathlib import Path
from pprint import pprint


def override_type(parent_name, field_name, current_type):
    if parent_name != "Wrapper" and current_type == "bytes":
        return "Wrapper"
    elif parent_name == "Error" and field_name == "code":
        return "ErrorCode"
    else:
        return current_type


def format_line(line, indent):
    return f"{' ' * 2 * indent}{line}\n"


def parse_rule(field):
    if "rule" in field:
        return field["rule"] + " "
    else:
        return ""


def parse_fields(message, fields, indent):
    return (
        format_line(
            f"{parse_rule(field)}{override_type(message, name, field['type'])} {name} = {field['id']};",
            indent,
        )
        for name, field in fields.items()
    )


def parse_methods(methods, indent):
    return (
        format_line(
            f"rpc {name} ({method['requestType']}) returns ({method['responseType']});",
            indent,
        )
        for name, method in methods.items()
    )


def parse_values(values, indent):
    return (format_line(f"{name} = {value};", indent) for name, value in values.items())


def parse_item(name, item, indent):
    lines = []

    if "fields" in item:
        lines = [
            format_line(f"message {name} {{", indent),
            *parse_fields(name, item["fields"], indent + 1),
        ]
    elif "methods" in item:
        lines = [
            format_line(f"service {name} {{", indent),
            *parse_methods(item["methods"], indent + 1),
        ]
    elif "values" in item:
        lines = [
            format_line(f"enum {name} {{", indent),
            *parse_values(item["values"], indent + 1),
        ]
    else:
        pprint(item)
        raise Exception("Unrecognized Item")

    if "nested" in item:
        assert len(item) == 2
        for name, item in item["nested"].items():
            lines.extend(parse_item(name, item, indent + 1))

    lines.append(format_line("}\n", indent))

    return lines


def parse(input_file):
    data = json.load(input_file.open("r"), object_pairs_hook=OrderedDict)
    data_nested = data["nested"]
    assert len(data_nested) == 1
    package_name = list(data_nested.keys())[0]

    lines = [
        'syntax = "proto3";\n\n',
        f"package {package_name};\n\n",
        'import "error.proto";\n\n',
    ]

    package = data_nested[package_name]
    package_nested = package["nested"]

    for name, item in package_nested.items():
        lines.extend(parse_item(name, item, 0))

    return lines


def main():
    input_file = Path(sys.argv[1])
    output_file = Path(sys.argv[2])
    lines = parse(input_file)

    with output_file.open("w") as f:
        f.writelines(lines)


if __name__ == "__main__":
    main()
