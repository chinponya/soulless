# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResCreateDmmOrder do
  @moduledoc false
  defstruct error: nil,
            order_id: "",
            transaction_id: "",
            dmm_user_id: "",
            token: "",
            callback_url: "",
            request_time: "",
            dmm_app_id: "",
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
        |> encode_error(msg)
        |> encode_order_id(msg)
        |> encode_transaction_id(msg)
        |> encode_dmm_user_id(msg)
        |> encode_token(msg)
        |> encode_callback_url(msg)
        |> encode_request_time(msg)
        |> encode_dmm_app_id(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_order_id(acc, msg) do
        try do
          if msg.order_id == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.order_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:order_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_transaction_id(acc, msg) do
        try do
          if msg.transaction_id == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.transaction_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:transaction_id, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_dmm_user_id(acc, msg) do
        try do
          if msg.dmm_user_id == "" do
            acc
          else
            [acc, "\"", Protox.Encode.encode_string(msg.dmm_user_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dmm_user_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_token(acc, msg) do
        try do
          if msg.token == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.token)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:token, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_callback_url(acc, msg) do
        try do
          if msg.callback_url == "" do
            acc
          else
            [acc, "2", Protox.Encode.encode_string(msg.callback_url)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:callback_url, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_request_time(acc, msg) do
        try do
          if msg.request_time == "" do
            acc
          else
            [acc, "J", Protox.Encode.encode_string(msg.request_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:request_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dmm_app_id(acc, msg) do
        try do
          if msg.dmm_app_id == "" do
            acc
          else
            [acc, "R", Protox.Encode.encode_string(msg.dmm_app_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dmm_app_id, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResCreateDmmOrder))
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

              {[
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[order_id: delimited], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[transaction_id: delimited], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[dmm_user_id: delimited], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[token: delimited], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[callback_url: delimited], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[request_time: delimited], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[dmm_app_id: delimited], rest}

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
        Soulless.Game.Lq.ResCreateDmmOrder,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:order_id, {:scalar, ""}, :string},
        3 => {:transaction_id, {:scalar, ""}, :string},
        4 => {:dmm_user_id, {:scalar, ""}, :string},
        5 => {:token, {:scalar, ""}, :string},
        6 => {:callback_url, {:scalar, ""}, :string},
        9 => {:request_time, {:scalar, ""}, :string},
        10 => {:dmm_app_id, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        callback_url: {6, {:scalar, ""}, :string},
        dmm_app_id: {10, {:scalar, ""}, :string},
        dmm_user_id: {4, {:scalar, ""}, :string},
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        order_id: {2, {:scalar, ""}, :string},
        request_time: {9, {:scalar, ""}, :string},
        token: {5, {:scalar, ""}, :string},
        transaction_id: {3, {:scalar, ""}, :string}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Game.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "orderId",
          kind: {:scalar, ""},
          label: :optional,
          name: :order_id,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "transactionId",
          kind: {:scalar, ""},
          label: :optional,
          name: :transaction_id,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "dmmUserId",
          kind: {:scalar, ""},
          label: :optional,
          name: :dmm_user_id,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "token",
          kind: {:scalar, ""},
          label: :optional,
          name: :token,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "callbackUrl",
          kind: {:scalar, ""},
          label: :optional,
          name: :callback_url,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "requestTime",
          kind: {:scalar, ""},
          label: :optional,
          name: :request_time,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "dmmAppId",
          kind: {:scalar, ""},
          label: :optional,
          name: :dmm_app_id,
          tag: 10,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:order_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end

        def field_def("orderId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end

        def field_def("order_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :order_id,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:transaction_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 3,
             type: :string
           }}
        end

        def field_def("transactionId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 3,
             type: :string
           }}
        end

        def field_def("transaction_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "transactionId",
             kind: {:scalar, ""},
             label: :optional,
             name: :transaction_id,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:dmm_user_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmUserId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_user_id,
             tag: 4,
             type: :string
           }}
        end

        def field_def("dmmUserId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmUserId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_user_id,
             tag: 4,
             type: :string
           }}
        end

        def field_def("dmm_user_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmUserId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_user_id,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def field_def(:token) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 5,
             type: :string
           }}
        end

        def field_def("token") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "token",
             kind: {:scalar, ""},
             label: :optional,
             name: :token,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:callback_url) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callbackUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :callback_url,
             tag: 6,
             type: :string
           }}
        end

        def field_def("callbackUrl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callbackUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :callback_url,
             tag: 6,
             type: :string
           }}
        end

        def field_def("callback_url") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "callbackUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :callback_url,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def field_def(:request_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requestTime",
             kind: {:scalar, ""},
             label: :optional,
             name: :request_time,
             tag: 9,
             type: :string
           }}
        end

        def field_def("requestTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requestTime",
             kind: {:scalar, ""},
             label: :optional,
             name: :request_time,
             tag: 9,
             type: :string
           }}
        end

        def field_def("request_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "requestTime",
             kind: {:scalar, ""},
             label: :optional,
             name: :request_time,
             tag: 9,
             type: :string
           }}
        end
      ),
      (
        def field_def(:dmm_app_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmAppId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_app_id,
             tag: 10,
             type: :string
           }}
        end

        def field_def("dmmAppId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmAppId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_app_id,
             tag: 10,
             type: :string
           }}
        end

        def field_def("dmm_app_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dmmAppId",
             kind: {:scalar, ""},
             label: :optional,
             name: :dmm_app_id,
             tag: 10,
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
    def default(:error) do
      {:ok, nil}
    end,
    def default(:order_id) do
      {:ok, ""}
    end,
    def default(:transaction_id) do
      {:ok, ""}
    end,
    def default(:dmm_user_id) do
      {:ok, ""}
    end,
    def default(:token) do
      {:ok, ""}
    end,
    def default(:callback_url) do
      {:ok, ""}
    end,
    def default(:request_time) do
      {:ok, ""}
    end,
    def default(:dmm_app_id) do
      {:ok, ""}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end