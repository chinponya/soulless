# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqCreateSteamOrder do
  @moduledoc false
  (
    defstruct language: "",
              account_id: 0,
              client_type: 0,
              goods_id: 0,
              steam_id: "",
              debt_order_id: "",
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
          |> encode_language(msg)
          |> encode_account_id(msg)
          |> encode_client_type(msg)
          |> encode_goods_id(msg)
          |> encode_steam_id(msg)
          |> encode_debt_order_id(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_language(acc, msg) do
          try do
            if msg.language == "" do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.language)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:language, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_account_id(acc, msg) do
          try do
            if msg.account_id == 0 do
              acc
            else
              [acc, "\x10", Protox.Encode.encode_uint32(msg.account_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:account_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_client_type(acc, msg) do
          try do
            if msg.client_type == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.client_type)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:client_type, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_goods_id(acc, msg) do
          try do
            if msg.goods_id == 0 do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.goods_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:goods_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_steam_id(acc, msg) do
          try do
            if msg.steam_id == "" do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.steam_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:steam_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_debt_order_id(acc, msg) do
          try do
            if msg.debt_order_id == "" do
              acc
            else
              [acc, "2", Protox.Encode.encode_string(msg.debt_order_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:debt_order_id, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ReqCreateSteamOrder))
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
                {[language: delimited], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[account_id: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[client_type: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[goods_id: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[steam_id: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[debt_order_id: delimited], rest}

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
          Soulless.Game.Lq.ReqCreateSteamOrder,
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

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:language, {:scalar, ""}, :string},
        2 => {:account_id, {:scalar, 0}, :uint32},
        3 => {:client_type, {:scalar, 0}, :uint32},
        4 => {:goods_id, {:scalar, 0}, :uint32},
        5 => {:steam_id, {:scalar, ""}, :string},
        6 => {:debt_order_id, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_id: {2, {:scalar, 0}, :uint32},
        client_type: {3, {:scalar, 0}, :uint32},
        debt_order_id: {6, {:scalar, ""}, :string},
        goods_id: {4, {:scalar, 0}, :uint32},
        language: {1, {:scalar, ""}, :string},
        steam_id: {5, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "language",
          kind: {:scalar, ""},
          label: :optional,
          name: :language,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientType",
          kind: {:scalar, 0},
          label: :optional,
          name: :client_type,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "goodsId",
          kind: {:scalar, 0},
          label: :optional,
          name: :goods_id,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "steamId",
          kind: {:scalar, ""},
          label: :optional,
          name: :steam_id,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "debtOrderId",
          kind: {:scalar, ""},
          label: :optional,
          name: :debt_order_id,
          tag: 6,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:language) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "language",
             kind: {:scalar, ""},
             label: :optional,
             name: :language,
             tag: 1,
             type: :string
           }}
        end

        def field_def("language") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "language",
             kind: {:scalar, ""},
             label: :optional,
             name: :language,
             tag: 1,
             type: :string
           }}
        end

        []
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
             tag: 2,
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
             tag: 2,
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
             tag: 2,
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
             tag: 3,
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
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:goods_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "goodsId",
             kind: {:scalar, 0},
             label: :optional,
             name: :goods_id,
             tag: 4,
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
             tag: 4,
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
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:steam_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "steamId",
             kind: {:scalar, ""},
             label: :optional,
             name: :steam_id,
             tag: 5,
             type: :string
           }}
        end

        def field_def("steamId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "steamId",
             kind: {:scalar, ""},
             label: :optional,
             name: :steam_id,
             tag: 5,
             type: :string
           }}
        end

        def field_def("steam_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "steamId",
             kind: {:scalar, ""},
             label: :optional,
             name: :steam_id,
             tag: 5,
             type: :string
           }}
        end
      ),
      (
        def field_def(:debt_order_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "debtOrderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :debt_order_id,
             tag: 6,
             type: :string
           }}
        end

        def field_def("debtOrderId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "debtOrderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :debt_order_id,
             tag: 6,
             type: :string
           }}
        end

        def field_def("debt_order_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "debtOrderId",
             kind: {:scalar, ""},
             label: :optional,
             name: :debt_order_id,
             tag: 6,
             type: :string
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]

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

    @spec required_fields() :: []
    def required_fields() do
      []
    end

    @spec syntax() :: atom
    def syntax() do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def default(:language) do
        {:ok, ""}
      end,
      def default(:account_id) do
        {:ok, 0}
      end,
      def default(:client_type) do
        {:ok, 0}
      end,
      def default(:goods_id) do
        {:ok, 0}
      end,
      def default(:steam_id) do
        {:ok, ""}
      end,
      def default(:debt_order_id) do
        {:ok, ""}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end