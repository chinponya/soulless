# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqSignupAccount do
  @moduledoc false
  defstruct account: "",
            password: "",
            code: "",
            type: 0,
            device: nil,
            client_version_string: "",
            tag: "",
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
        |> encode_account(msg)
        |> encode_password(msg)
        |> encode_code(msg)
        |> encode_type(msg)
        |> encode_device(msg)
        |> encode_client_version_string(msg)
        |> encode_tag(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_account(acc, msg) do
        try do
          if msg.account == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.account)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:account, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_password(acc, msg) do
        try do
          if msg.password == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.password)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:password, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_code(acc, msg) do
        try do
          if msg.code == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.code)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:code, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type(acc, msg) do
        try do
          if msg.type == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_device(acc, msg) do
        try do
          if msg.device == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.device)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:device, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_client_version_string(acc, msg) do
        try do
          if msg.client_version_string == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.client_version_string)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:client_version_string, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_tag(acc, msg) do
        try do
          if msg.tag == "" do
            acc
          else
            [acc, ":", Protox.Encode.encode_string(msg.tag)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:tag, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqSignupAccount))
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
              {[account: Protox.Decode.validate_string(delimited)], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[password: Protox.Decode.validate_string(delimited)], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[code: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 device:
                   Protox.MergeMessage.merge(
                     msg.device,
                     Soulless.Game.Lq.ClientDeviceInfo.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[client_version_string: Protox.Decode.validate_string(delimited)], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[tag: Protox.Decode.validate_string(delimited)], rest}

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
        Soulless.Game.Lq.ReqSignupAccount,
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
        1 => {:account, {:scalar, ""}, :string},
        2 => {:password, {:scalar, ""}, :string},
        3 => {:code, {:scalar, ""}, :string},
        4 => {:type, {:scalar, 0}, :uint32},
        5 => {:device, {:scalar, nil}, {:message, Soulless.Game.Lq.ClientDeviceInfo}},
        6 => {:client_version_string, {:scalar, ""}, :string},
        7 => {:tag, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account: {1, {:scalar, ""}, :string},
        client_version_string: {6, {:scalar, ""}, :string},
        code: {3, {:scalar, ""}, :string},
        device: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.ClientDeviceInfo}},
        password: {2, {:scalar, ""}, :string},
        tag: {7, {:scalar, ""}, :string},
        type: {4, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "account",
          kind: {:scalar, ""},
          label: :optional,
          name: :account,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "password",
          kind: {:scalar, ""},
          label: :optional,
          name: :password,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "code",
          kind: {:scalar, ""},
          label: :optional,
          name: :code,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "device",
          kind: {:scalar, nil},
          label: :optional,
          name: :device,
          tag: 5,
          type: {:message, Soulless.Game.Lq.ClientDeviceInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientVersionString",
          kind: {:scalar, ""},
          label: :optional,
          name: :client_version_string,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "tag",
          kind: {:scalar, ""},
          label: :optional,
          name: :tag,
          tag: 7,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:account) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "account",
             kind: {:scalar, ""},
             label: :optional,
             name: :account,
             tag: 1,
             type: :string
           }}
        end

        def field_def("account") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "account",
             kind: {:scalar, ""},
             label: :optional,
             name: :account,
             tag: 1,
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
             tag: 2,
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
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:code) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "code",
             kind: {:scalar, ""},
             label: :optional,
             name: :code,
             tag: 3,
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
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:device) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "device",
             kind: {:scalar, nil},
             label: :optional,
             name: :device,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ClientDeviceInfo}
           }}
        end

        def field_def("device") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "device",
             kind: {:scalar, nil},
             label: :optional,
             name: :device,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ClientDeviceInfo}
           }}
        end

        []
      ),
      (
        def field_def(:client_version_string) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersionString",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version_string,
             tag: 6,
             type: :string
           }}
        end

        def field_def("clientVersionString") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersionString",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version_string,
             tag: 6,
             type: :string
           }}
        end

        def field_def("client_version_string") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersionString",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version_string,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def field_def(:tag) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tag",
             kind: {:scalar, ""},
             label: :optional,
             name: :tag,
             tag: 7,
             type: :string
           }}
        end

        def field_def("tag") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tag",
             kind: {:scalar, ""},
             label: :optional,
             name: :tag,
             tag: 7,
             type: :string
           }}
        end

        []
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
    def default(:account) do
      {:ok, ""}
    end,
    def default(:password) do
      {:ok, ""}
    end,
    def default(:code) do
      {:ok, ""}
    end,
    def default(:type) do
      {:ok, 0}
    end,
    def default(:device) do
      {:ok, nil}
    end,
    def default(:client_version_string) do
      {:ok, ""}
    end,
    def default(:tag) do
      {:ok, ""}
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
