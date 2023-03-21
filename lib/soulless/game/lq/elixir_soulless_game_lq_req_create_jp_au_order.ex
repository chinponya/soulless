# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqCreateJPAuOrder do
  @moduledoc false
  defstruct goods_id: 0,
            client_type: 0,
            account_id: 0,
            return_url: "",
            access_token: "",
            client_version_string: "",
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
        |> encode_goods_id(msg)
        |> encode_client_type(msg)
        |> encode_account_id(msg)
        |> encode_return_url(msg)
        |> encode_access_token(msg)
        |> encode_client_version_string(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_goods_id(acc, msg) do
        try do
          if msg.goods_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.goods_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:goods_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_client_type(acc, msg) do
        try do
          if msg.client_type == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.client_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:client_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_account_id(acc, msg) do
        try do
          if msg.account_id == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.account_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:account_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_return_url(acc, msg) do
        try do
          if msg.return_url == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.return_url)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:return_url, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_access_token(acc, msg) do
        try do
          if msg.access_token == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.access_token)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:access_token, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqCreateJPAuOrder))
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
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[goods_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[client_type: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[account_id: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[return_url: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[access_token: delimited], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[client_version_string: delimited], rest}

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
        Soulless.Game.Lq.ReqCreateJPAuOrder,
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
        1 => {:goods_id, {:scalar, 0}, :uint32},
        2 => {:client_type, {:scalar, 0}, :uint32},
        3 => {:account_id, {:scalar, 0}, :uint32},
        4 => {:return_url, {:scalar, ""}, :string},
        5 => {:access_token, {:scalar, ""}, :string},
        6 => {:client_version_string, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        access_token: {5, {:scalar, ""}, :string},
        account_id: {3, {:scalar, 0}, :uint32},
        client_type: {2, {:scalar, 0}, :uint32},
        client_version_string: {6, {:scalar, ""}, :string},
        goods_id: {1, {:scalar, 0}, :uint32},
        return_url: {4, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "goodsId",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientType",
          kind: {:scalar, 0},
          label: :optional,
          name: :client_type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "returnUrl",
          kind: {:scalar, ""},
          label: :optional,
          name: :return_url,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_token,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientVersionString",
          kind: {:scalar, ""},
          label: :optional,
          name: :client_version_string,
          tag: 6,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:goods_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("goodsId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("goods_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:client_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientType",
             kind: {:scalar, 0},
             label: :optional,
             name: :client_type,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("clientType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientType",
             kind: {:scalar, 0},
             label: :optional,
             name: :client_type,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("client_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientType",
             kind: {:scalar, 0},
             label: :optional,
             name: :client_type,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:account_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("accountId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("account_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:return_url) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :return_url,
             tag: 4,
             type: :string
           }}
        end

        def field_def("returnUrl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :return_url,
             tag: 4,
             type: :string
           }}
        end

        def field_def("return_url") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "returnUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :return_url,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:access_token) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 5,
             type: :string
           }}
        end

        def field_def("accessToken") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 5,
             type: :string
           }}
        end

        def field_def("access_token") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 5,
             type: :string
           }}
        end
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
    def default(:goods_id) do
      {:ok, 0}
    end,
    def default(:client_type) do
      {:ok, 0}
    end,
    def default(:account_id) do
      {:ok, 0}
    end,
    def default(:return_url) do
      {:ok, ""}
    end,
    def default(:access_token) do
      {:ok, ""}
    end,
    def default(:client_version_string) do
      {:ok, ""}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end