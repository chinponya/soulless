# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ClientDeviceInfo do
  @moduledoc false
  defstruct platform: "",
            hardware: "",
            os: "",
            os_version: "",
            is_browser: false,
            software: "",
            sale_platform: "",
            hardware_vendor: "",
            model_number: "",
            screen_width: 0,
            screen_height: 0,
            __uf__: []

  (
    (
      @spec encode(struct) :: {:ok, iodata} | {:error, any}
      def encode(msg) do
        try do
          {:ok, encode!(msg)}
        rescue
          e in [Protox.EncodingError, Protox.RequiredFieldsError] -> {:error, e}
        end
      end

      @spec encode!(struct) :: iodata | no_return
      def encode!(msg) do
        []
        |> encode_platform(msg)
        |> encode_hardware(msg)
        |> encode_os(msg)
        |> encode_os_version(msg)
        |> encode_is_browser(msg)
        |> encode_software(msg)
        |> encode_sale_platform(msg)
        |> encode_hardware_vendor(msg)
        |> encode_model_number(msg)
        |> encode_screen_width(msg)
        |> encode_screen_height(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_platform(acc, msg) do
        try do
          if msg.platform == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.platform)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:platform, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_hardware(acc, msg) do
        try do
          if msg.hardware == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.hardware)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hardware, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_os(acc, msg) do
        try do
          if msg.os == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.os)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:os, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_os_version(acc, msg) do
        try do
          if msg.os_version == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.os_version)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:os_version, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_browser(acc, msg) do
        try do
          if msg.is_browser == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.is_browser)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_browser, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_software(acc, msg) do
        try do
          if msg.software == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.software)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:software, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_sale_platform(acc, msg) do
        try do
          if msg.sale_platform == "" do
            acc
          else
            [acc, ":", Protox.Encode.encode_string(msg.sale_platform)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:sale_platform, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_hardware_vendor(acc, msg) do
        try do
          if msg.hardware_vendor == "" do
            acc
          else
            [acc, "B", Protox.Encode.encode_string(msg.hardware_vendor)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:hardware_vendor, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_model_number(acc, msg) do
        try do
          if msg.model_number == "" do
            acc
          else
            [acc, "J", Protox.Encode.encode_string(msg.model_number)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:model_number, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_screen_width(acc, msg) do
        try do
          if msg.screen_width == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.screen_width)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:screen_width, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_screen_height(acc, msg) do
        try do
          if msg.screen_height == 0 do
            acc
          else
            [acc, "X", Protox.Encode.encode_uint32(msg.screen_height)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:screen_height, "invalid field value"),
                    __STACKTRACE__
        end
      end
    ]

    defp encode_unknown_fields(acc, msg) do
      Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
        case wire_type do
          0 ->
            [acc, Protox.Encode.make_key_bytes(tag, :int32), bytes]

          1 ->
            [acc, Protox.Encode.make_key_bytes(tag, :double), bytes]

          2 ->
            len_bytes = bytes |> byte_size() |> Protox.Varint.encode()
            [acc, Protox.Encode.make_key_bytes(tag, :packed), len_bytes, bytes]

          5 ->
            [acc, Protox.Encode.make_key_bytes(tag, :float), bytes]
        end
      end)
    end
  )

  (
    (
      @spec decode(binary) :: {:ok, struct} | {:error, any}
      def decode(bytes) do
        try do
          {:ok, decode!(bytes)}
        rescue
          e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
            {:error, e}
        end
      end

      (
        @spec decode!(binary) :: struct | no_return
        def decode!(bytes) do
          parse_key_value(bytes, struct(Soulless.Game.Lq.ClientDeviceInfo))
        end
      )
    )

    (
      @spec parse_key_value(binary, struct) :: struct
      defp parse_key_value(<<>>, msg) do
        msg
      end

      defp parse_key_value(bytes, msg) do
        {field, rest} =
          case Protox.Decode.parse_key(bytes) do
            {0, _, _} ->
              raise %Protox.IllegalTagError{}

            {1, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[platform: Protox.Decode.validate_string(delimited)], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hardware: Protox.Decode.validate_string(delimited)], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[os: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[os_version: Protox.Decode.validate_string(delimited)], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_browser: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[software: Protox.Decode.validate_string(delimited)], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[sale_platform: Protox.Decode.validate_string(delimited)], rest}

            {8, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[hardware_vendor: Protox.Decode.validate_string(delimited)], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[model_number: Protox.Decode.validate_string(delimited)], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[screen_width: value], rest}

            {11, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[screen_height: value], rest}

            {tag, wire_type, rest} ->
              {value, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)

              {[
                 {msg.__struct__.unknown_fields_name,
                  [value | msg.__struct__.unknown_fields(msg)]}
               ], rest}
          end

        msg_updated = struct(msg, field)
        parse_key_value(rest, msg_updated)
      end
    )

    []
  )

  (
    @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
    def json_decode(input, opts \\ []) do
      try do
        {:ok, json_decode!(input, opts)}
      rescue
        e in Protox.JsonDecodingError -> {:error, e}
      end
    end

    @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
    def json_decode!(input, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

      Protox.JsonDecode.decode!(
        input,
        Soulless.Game.Lq.ClientDeviceInfo,
        &json_library_wrapper.decode!(json_library, &1)
      )
    end

    @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
    def json_encode(msg, opts \\ []) do
      try do
        {:ok, json_encode!(msg, opts)}
      rescue
        e in Protox.JsonEncodingError -> {:error, e}
      end
    end

    @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
    def json_encode!(msg, opts \\ []) do
      {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
      Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
    end
  )

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:platform, {:scalar, ""}, :string},
        2 => {:hardware, {:scalar, ""}, :string},
        3 => {:os, {:scalar, ""}, :string},
        4 => {:os_version, {:scalar, ""}, :string},
        5 => {:is_browser, {:scalar, false}, :bool},
        6 => {:software, {:scalar, ""}, :string},
        7 => {:sale_platform, {:scalar, ""}, :string},
        8 => {:hardware_vendor, {:scalar, ""}, :string},
        9 => {:model_number, {:scalar, ""}, :string},
        10 => {:screen_width, {:scalar, 0}, :uint32},
        11 => {:screen_height, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        hardware: {2, {:scalar, ""}, :string},
        hardware_vendor: {8, {:scalar, ""}, :string},
        is_browser: {5, {:scalar, false}, :bool},
        model_number: {9, {:scalar, ""}, :string},
        os: {3, {:scalar, ""}, :string},
        os_version: {4, {:scalar, ""}, :string},
        platform: {1, {:scalar, ""}, :string},
        sale_platform: {7, {:scalar, ""}, :string},
        screen_height: {11, {:scalar, 0}, :uint32},
        screen_width: {10, {:scalar, 0}, :uint32},
        software: {6, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "platform",
          kind: {:scalar, ""},
          label: :optional,
          name: :platform,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "hardware",
          kind: {:scalar, ""},
          label: :optional,
          name: :hardware,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "os",
          kind: {:scalar, ""},
          label: :optional,
          name: :os,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "osVersion",
          kind: {:scalar, ""},
          label: :optional,
          name: :os_version,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "isBrowser",
          kind: {:scalar, false},
          label: :optional,
          name: :is_browser,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "software",
          kind: {:scalar, ""},
          label: :optional,
          name: :software,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "salePlatform",
          kind: {:scalar, ""},
          label: :optional,
          name: :sale_platform,
          tag: 7,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "hardwareVendor",
          kind: {:scalar, ""},
          label: :optional,
          name: :hardware_vendor,
          tag: 8,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "modelNumber",
          kind: {:scalar, ""},
          label: :optional,
          name: :model_number,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "screenWidth",
          kind: {:scalar, 0},
          label: :optional,
          name: :screen_width,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "screenHeight",
          kind: {:scalar, 0},
          label: :optional,
          name: :screen_height,
          tag: 11,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:platform) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platform",
             kind: {:scalar, ""},
             label: :optional,
             name: :platform,
             tag: 1,
             type: :string
           }}
        end

        def field_def("platform") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "platform",
             kind: {:scalar, ""},
             label: :optional,
             name: :platform,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:hardware) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hardware",
             kind: {:scalar, ""},
             label: :optional,
             name: :hardware,
             tag: 2,
             type: :string
           }}
        end

        def field_def("hardware") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hardware",
             kind: {:scalar, ""},
             label: :optional,
             name: :hardware,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:os) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "os",
             kind: {:scalar, ""},
             label: :optional,
             name: :os,
             tag: 3,
             type: :string
           }}
        end

        def field_def("os") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "os",
             kind: {:scalar, ""},
             label: :optional,
             name: :os,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:os_version) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "osVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :os_version,
             tag: 4,
             type: :string
           }}
        end

        def field_def("osVersion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "osVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :os_version,
             tag: 4,
             type: :string
           }}
        end

        def field_def("os_version") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "osVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :os_version,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:is_browser) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBrowser",
             kind: {:scalar, false},
             label: :optional,
             name: :is_browser,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("isBrowser") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBrowser",
             kind: {:scalar, false},
             label: :optional,
             name: :is_browser,
             tag: 5,
             type: :bool
           }}
        end

        def field_def("is_browser") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBrowser",
             kind: {:scalar, false},
             label: :optional,
             name: :is_browser,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:software) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "software",
             kind: {:scalar, ""},
             label: :optional,
             name: :software,
             tag: 6,
             type: :string
           }}
        end

        def field_def("software") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "software",
             kind: {:scalar, ""},
             label: :optional,
             name: :software,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:sale_platform) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "salePlatform",
             kind: {:scalar, ""},
             label: :optional,
             name: :sale_platform,
             tag: 7,
             type: :string
           }}
        end

        def field_def("salePlatform") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "salePlatform",
             kind: {:scalar, ""},
             label: :optional,
             name: :sale_platform,
             tag: 7,
             type: :string
           }}
        end

        def field_def("sale_platform") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "salePlatform",
             kind: {:scalar, ""},
             label: :optional,
             name: :sale_platform,
             tag: 7,
             type: :string
           }}
        end
      ),
      (
        def field_def(:hardware_vendor) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hardwareVendor",
             kind: {:scalar, ""},
             label: :optional,
             name: :hardware_vendor,
             tag: 8,
             type: :string
           }}
        end

        def field_def("hardwareVendor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hardwareVendor",
             kind: {:scalar, ""},
             label: :optional,
             name: :hardware_vendor,
             tag: 8,
             type: :string
           }}
        end

        def field_def("hardware_vendor") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hardwareVendor",
             kind: {:scalar, ""},
             label: :optional,
             name: :hardware_vendor,
             tag: 8,
             type: :string
           }}
        end
      ),
      (
        def field_def(:model_number) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modelNumber",
             kind: {:scalar, ""},
             label: :optional,
             name: :model_number,
             tag: 9,
             type: :string
           }}
        end

        def field_def("modelNumber") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modelNumber",
             kind: {:scalar, ""},
             label: :optional,
             name: :model_number,
             tag: 9,
             type: :string
           }}
        end

        def field_def("model_number") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "modelNumber",
             kind: {:scalar, ""},
             label: :optional,
             name: :model_number,
             tag: 9,
             type: :string
           }}
        end
      ),
      (
        def field_def(:screen_width) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenWidth",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_width,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("screenWidth") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenWidth",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_width,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("screen_width") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenWidth",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_width,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:screen_height) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenHeight",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_height,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("screenHeight") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenHeight",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_height,
             tag: 11,
             type: :uint32
           }}
        end

        def field_def("screen_height") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "screenHeight",
             kind: {:scalar, 0},
             label: :optional,
             name: :screen_height,
             tag: 11,
             type: :uint32
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

  (
    @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
    def unknown_fields(msg) do
      msg.__uf__
    end

    @spec unknown_fields_name() :: :__uf__
    def unknown_fields_name() do
      :__uf__
    end

    @spec clear_unknown_fields(struct) :: struct
    def clear_unknown_fields(msg) do
      struct!(msg, [{unknown_fields_name(), []}])
    end
  )

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto3
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:platform) do
      {:ok, ""}
    end,
    def default(:hardware) do
      {:ok, ""}
    end,
    def default(:os) do
      {:ok, ""}
    end,
    def default(:os_version) do
      {:ok, ""}
    end,
    def default(:is_browser) do
      {:ok, false}
    end,
    def default(:software) do
      {:ok, ""}
    end,
    def default(:sale_platform) do
      {:ok, ""}
    end,
    def default(:hardware_vendor) do
      {:ok, ""}
    end,
    def default(:model_number) do
      {:ok, ""}
    end,
    def default(:screen_width) do
      {:ok, 0}
    end,
    def default(:screen_height) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
