# credo:disable-for-this-file
defmodule(Soulless.Lq.Error) do
  @moduledoc false
  (
    defstruct(code: 0, u32_params: [], str_params: [], json_param: "", __uf__: [])

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_code(msg)
          |> encode_u32_params(msg)
          |> encode_str_params(msg)
          |> encode_json_param(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_code(acc, msg)) do
          try do
            if(msg.code == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.code)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:code, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_u32_params(acc, msg)) do
          try do
            case(msg.u32_params) do
              [] ->
                acc

              values ->
                [
                  acc,
                  <<18>>,
                  (
                    {bytes, len} =
                      Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint32(value)])
                        {[acc, value_bytes], len + byte_size(value_bytes)}
                      end)

                    [Protox.Varint.encode(len), bytes]
                  )
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:u32_params, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_str_params(acc, msg)) do
          try do
            case(msg.str_params) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:str_params, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_json_param(acc, msg)) do
          try do
            if(msg.json_param == "") do
              acc
            else
              [acc, "\"", Protox.Encode.encode_string(msg.json_param)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:json_param, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      defp(encode_unknown_fields(acc, msg)) do
        Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
          case(wire_type) do
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
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(Soulless.Lq.Error))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[code: value], rest}

              {2, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   u32_params:
                     msg.u32_params ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[u32_params: msg.u32_params ++ [value]], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[str_params: msg.str_params ++ [delimited]], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[json_param: delimited], rest}

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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          Soulless.Lq.Error,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:code, {:scalar, 0}, :uint32},
        2 => {:u32_params, :packed, :uint32},
        3 => {:str_params, :unpacked, :string},
        4 => {:json_param, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        code: {1, {:scalar, 0}, :uint32},
        json_param: {4, {:scalar, ""}, :string},
        str_params: {3, :unpacked, :string},
        u32_params: {2, :packed, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "code",
          kind: {:scalar, 0},
          label: :optional,
          name: :code,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "u32Params",
          kind: :packed,
          label: :repeated,
          name: :u32_params,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "strParams",
          kind: :unpacked,
          label: :repeated,
          name: :str_params,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "jsonParam",
          kind: {:scalar, ""},
          label: :optional,
          name: :json_param,
          tag: 4,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:code)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "code",
             kind: {:scalar, 0},
             label: :optional,
             name: :code,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("code")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "code",
             kind: {:scalar, 0},
             label: :optional,
             name: :code,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:u32_params)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "u32Params",
             kind: :packed,
             label: :repeated,
             name: :u32_params,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("u32Params")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "u32Params",
             kind: :packed,
             label: :repeated,
             name: :u32_params,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("u32_params")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "u32Params",
             kind: :packed,
             label: :repeated,
             name: :u32_params,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:str_params)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strParams",
             kind: :unpacked,
             label: :repeated,
             name: :str_params,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("strParams")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strParams",
             kind: :unpacked,
             label: :repeated,
             name: :str_params,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("str_params")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "strParams",
             kind: :unpacked,
             label: :repeated,
             name: :str_params,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:json_param)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jsonParam",
             kind: {:scalar, ""},
             label: :optional,
             name: :json_param,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("jsonParam")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jsonParam",
             kind: {:scalar, ""},
             label: :optional,
             name: :json_param,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("json_param")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "jsonParam",
             kind: {:scalar, ""},
             label: :optional,
             name: :json_param,
             tag: 4,
             type: :string
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    (
      @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
      def(unknown_fields(msg)) do
        msg.__uf__
      end

      @spec unknown_fields_name() :: :__uf__
      def(unknown_fields_name()) do
        :__uf__
      end

      @spec clear_unknown_fields(struct) :: struct
      def(clear_unknown_fields(msg)) do
        struct!(msg, [{unknown_fields_name(), []}])
      end
    )

    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:code)) do
        {:ok, 0}
      end,
      def(default(:u32_params)) do
        {:error, :no_default_value}
      end,
      def(default(:str_params)) do
        {:error, :no_default_value}
      end,
      def(default(:json_param)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end