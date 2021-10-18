# credo:disable-for-this-file
defmodule(Soulless.Lq.ReqEmailLogin) do
  @moduledoc false
  (
    defstruct(
      email: "",
      password: "",
      reconnect: false,
      device: nil,
      random_key: "",
      client_version: "",
      gen_access_token: false,
      currency_platforms: [],
      __uf__: []
    )

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
          |> encode_email(msg)
          |> encode_password(msg)
          |> encode_reconnect(msg)
          |> encode_device(msg)
          |> encode_random_key(msg)
          |> encode_client_version(msg)
          |> encode_gen_access_token(msg)
          |> encode_currency_platforms(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_email(acc, msg)) do
          try do
            if(msg.email == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.email)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:email, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_password(acc, msg)) do
          try do
            if(msg.password == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.password)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:password, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_reconnect(acc, msg)) do
          try do
            if(msg.reconnect == false) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_bool(msg.reconnect)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:reconnect, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_device(acc, msg)) do
          try do
            if(msg.device == nil) do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.device)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:device, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_random_key(acc, msg)) do
          try do
            if(msg.random_key == "") do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.random_key)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:random_key, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_client_version(acc, msg)) do
          try do
            if(msg.client_version == "") do
              acc
            else
              [acc, "2", Protox.Encode.encode_string(msg.client_version)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:client_version, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_gen_access_token(acc, msg)) do
          try do
            if(msg.gen_access_token == false) do
              acc
            else
              [acc, "8", Protox.Encode.encode_bool(msg.gen_access_token)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:gen_access_token, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_currency_platforms(acc, msg)) do
          try do
            case(msg.currency_platforms) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "B",
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
                Protox.EncodingError.new(:currency_platforms, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.ReqEmailLogin))
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
                {[email: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[password: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[reconnect: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   device:
                     Protox.Message.merge(
                       msg.device,
                       Soulless.Lq.ClientDeviceInfo.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[random_key: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[client_version: delimited], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[gen_access_token: value], rest}

              {8, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   currency_platforms:
                     msg.currency_platforms ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[currency_platforms: msg.currency_platforms ++ [value]], rest}

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
          Soulless.Lq.ReqEmailLogin,
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
        1 => {:email, {:scalar, ""}, :string},
        2 => {:password, {:scalar, ""}, :string},
        3 => {:reconnect, {:scalar, false}, :bool},
        4 => {:device, {:scalar, nil}, {:message, Soulless.Lq.ClientDeviceInfo}},
        5 => {:random_key, {:scalar, ""}, :string},
        6 => {:client_version, {:scalar, ""}, :string},
        7 => {:gen_access_token, {:scalar, false}, :bool},
        8 => {:currency_platforms, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        client_version: {6, {:scalar, ""}, :string},
        currency_platforms: {8, :packed, :uint32},
        device: {4, {:scalar, nil}, {:message, Soulless.Lq.ClientDeviceInfo}},
        email: {1, {:scalar, ""}, :string},
        gen_access_token: {7, {:scalar, false}, :bool},
        password: {2, {:scalar, ""}, :string},
        random_key: {5, {:scalar, ""}, :string},
        reconnect: {3, {:scalar, false}, :bool}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "email",
          kind: {:scalar, ""},
          label: :optional,
          name: :email,
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
          json_name: "reconnect",
          kind: {:scalar, false},
          label: :optional,
          name: :reconnect,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "device",
          kind: {:scalar, nil},
          label: :optional,
          name: :device,
          tag: 4,
          type: {:message, Soulless.Lq.ClientDeviceInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "randomKey",
          kind: {:scalar, ""},
          label: :optional,
          name: :random_key,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "clientVersion",
          kind: {:scalar, ""},
          label: :optional,
          name: :client_version,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "genAccessToken",
          kind: {:scalar, false},
          label: :optional,
          name: :gen_access_token,
          tag: 7,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "currencyPlatforms",
          kind: :packed,
          label: :repeated,
          name: :currency_platforms,
          tag: 8,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:email)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "email",
             kind: {:scalar, ""},
             label: :optional,
             name: :email,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("email")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "email",
             kind: {:scalar, ""},
             label: :optional,
             name: :email,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:password)) do
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

        def(field_def("password")) do
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
        def(field_def(:reconnect)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reconnect",
             kind: {:scalar, false},
             label: :optional,
             name: :reconnect,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("reconnect")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reconnect",
             kind: {:scalar, false},
             label: :optional,
             name: :reconnect,
             tag: 3,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:device)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "device",
             kind: {:scalar, nil},
             label: :optional,
             name: :device,
             tag: 4,
             type: {:message, Soulless.Lq.ClientDeviceInfo}
           }}
        end

        def(field_def("device")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "device",
             kind: {:scalar, nil},
             label: :optional,
             name: :device,
             tag: 4,
             type: {:message, Soulless.Lq.ClientDeviceInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:random_key)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :random_key,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("randomKey")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :random_key,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("random_key")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomKey",
             kind: {:scalar, ""},
             label: :optional,
             name: :random_key,
             tag: 5,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:client_version)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("clientVersion")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("client_version")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "clientVersion",
             kind: {:scalar, ""},
             label: :optional,
             name: :client_version,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:gen_access_token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "genAccessToken",
             kind: {:scalar, false},
             label: :optional,
             name: :gen_access_token,
             tag: 7,
             type: :bool
           }}
        end

        def(field_def("genAccessToken")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "genAccessToken",
             kind: {:scalar, false},
             label: :optional,
             name: :gen_access_token,
             tag: 7,
             type: :bool
           }}
        end

        def(field_def("gen_access_token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "genAccessToken",
             kind: {:scalar, false},
             label: :optional,
             name: :gen_access_token,
             tag: 7,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:currency_platforms)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyPlatforms",
             kind: :packed,
             label: :repeated,
             name: :currency_platforms,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("currencyPlatforms")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyPlatforms",
             kind: :packed,
             label: :repeated,
             name: :currency_platforms,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("currency_platforms")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyPlatforms",
             kind: :packed,
             label: :repeated,
             name: :currency_platforms,
             tag: 8,
             type: :uint32
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
      def(default(:email)) do
        {:ok, ""}
      end,
      def(default(:password)) do
        {:ok, ""}
      end,
      def(default(:reconnect)) do
        {:ok, false}
      end,
      def(default(:device)) do
        {:ok, nil}
      end,
      def(default(:random_key)) do
        {:ok, ""}
      end,
      def(default(:client_version)) do
        {:ok, ""}
      end,
      def(default(:gen_access_token)) do
        {:ok, false}
      end,
      def(default(:currency_platforms)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end