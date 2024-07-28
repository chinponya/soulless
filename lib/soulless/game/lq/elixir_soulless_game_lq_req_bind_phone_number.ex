# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqBindPhoneNumber do
  @moduledoc false
  defstruct code: "", phone: "", password: "", multi_bind_version: false, __uf__: []

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
        |> encode_code(msg)
        |> encode_phone(msg)
        |> encode_password(msg)
        |> encode_multi_bind_version(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_code(acc, msg) do
        try do
          if msg.code == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.code)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:code, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_phone(acc, msg) do
        try do
          if msg.phone == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.phone)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:phone, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_password(acc, msg) do
        try do
          if msg.password == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.password)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:password, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_multi_bind_version(acc, msg) do
        try do
          if msg.multi_bind_version == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.multi_bind_version)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:multi_bind_version, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqBindPhoneNumber))
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
              {[code: Protox.Decode.validate_string(delimited)], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[phone: Protox.Decode.validate_string(delimited)], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[password: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[multi_bind_version: value], rest}

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
        Soulless.Game.Lq.ReqBindPhoneNumber,
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
        1 => {:code, {:scalar, ""}, :string},
        2 => {:phone, {:scalar, ""}, :string},
        3 => {:password, {:scalar, ""}, :string},
        4 => {:multi_bind_version, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        code: {1, {:scalar, ""}, :string},
        multi_bind_version: {4, {:scalar, false}, :bool},
        password: {3, {:scalar, ""}, :string},
        phone: {2, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "code",
          kind: {:scalar, ""},
          label: :optional,
          name: :code,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "phone",
          kind: {:scalar, ""},
          label: :optional,
          name: :phone,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "password",
          kind: {:scalar, ""},
          label: :optional,
          name: :password,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "multiBindVersion",
          kind: {:scalar, false},
          label: :optional,
          name: :multi_bind_version,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:code) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "code",
             kind: {:scalar, ""},
             label: :optional,
             name: :code,
             tag: 1,
             type: :string
           }}
        end

        def field_def("code") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "code",
             kind: {:scalar, ""},
             label: :optional,
             name: :code,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:phone) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phone",
             kind: {:scalar, ""},
             label: :optional,
             name: :phone,
             tag: 2,
             type: :string
           }}
        end

        def field_def("phone") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "phone",
             kind: {:scalar, ""},
             label: :optional,
             name: :phone,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:password) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "password",
             kind: {:scalar, ""},
             label: :optional,
             name: :password,
             tag: 3,
             type: :string
           }}
        end

        def field_def("password") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "password",
             kind: {:scalar, ""},
             label: :optional,
             name: :password,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:multi_bind_version) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiBindVersion",
             kind: {:scalar, false},
             label: :optional,
             name: :multi_bind_version,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("multiBindVersion") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiBindVersion",
             kind: {:scalar, false},
             label: :optional,
             name: :multi_bind_version,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("multi_bind_version") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "multiBindVersion",
             kind: {:scalar, false},
             label: :optional,
             name: :multi_bind_version,
             tag: 4,
             type: :bool
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
    def default(:code) do
      {:ok, ""}
    end,
    def default(:phone) do
      {:ok, ""}
    end,
    def default(:password) do
      {:ok, ""}
    end,
    def default(:multi_bind_version) do
      {:ok, false}
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
