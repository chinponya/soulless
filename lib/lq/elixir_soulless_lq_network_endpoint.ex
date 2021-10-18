# credo:disable-for-this-file
defmodule(Soulless.Lq.NetworkEndpoint) do
  @moduledoc false
  (
    defstruct(family: "", address: "", port: 0, __uf__: [])

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
          |> encode_family(msg)
          |> encode_address(msg)
          |> encode_port(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_family(acc, msg)) do
          try do
            if(msg.family == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.family)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:family, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_address(acc, msg)) do
          try do
            if(msg.address == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.address)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:address, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_port(acc, msg)) do
          try do
            if(msg.port == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.port)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:port, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Lq.NetworkEndpoint))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[family: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[address: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[port: value], rest}

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
          Soulless.Lq.NetworkEndpoint,
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
        1 => {:family, {:scalar, ""}, :string},
        2 => {:address, {:scalar, ""}, :string},
        3 => {:port, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        address: {2, {:scalar, ""}, :string},
        family: {1, {:scalar, ""}, :string},
        port: {3, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "family",
          kind: {:scalar, ""},
          label: :optional,
          name: :family,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "address",
          kind: {:scalar, ""},
          label: :optional,
          name: :address,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "port",
          kind: {:scalar, 0},
          label: :optional,
          name: :port,
          tag: 3,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:family)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "family",
             kind: {:scalar, ""},
             label: :optional,
             name: :family,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("family")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "family",
             kind: {:scalar, ""},
             label: :optional,
             name: :family,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:address)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "address",
             kind: {:scalar, ""},
             label: :optional,
             name: :address,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("address")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "address",
             kind: {:scalar, ""},
             label: :optional,
             name: :address,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:port)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "port",
             kind: {:scalar, 0},
             label: :optional,
             name: :port,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("port")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "port",
             kind: {:scalar, 0},
             label: :optional,
             name: :port,
             tag: 3,
             type: :uint32
           }}
        end

        []
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
      def(default(:family)) do
        {:ok, ""}
      end,
      def(default(:address)) do
        {:ok, ""}
      end,
      def(default(:port)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end