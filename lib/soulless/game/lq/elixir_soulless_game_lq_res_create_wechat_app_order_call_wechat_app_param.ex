# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.ResCreateWechatAppOrder.CallWechatAppParam) do
  @moduledoc false
  (
    defstruct(
      appid: "",
      partnerid: "",
      prepayid: "",
      package: "",
      noncestr: "",
      timestamp: "",
      sign: "",
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
          |> encode_appid(msg)
          |> encode_partnerid(msg)
          |> encode_prepayid(msg)
          |> encode_package(msg)
          |> encode_noncestr(msg)
          |> encode_timestamp(msg)
          |> encode_sign(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_appid(acc, msg)) do
          try do
            if(msg.appid == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.appid)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:appid, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_partnerid(acc, msg)) do
          try do
            if(msg.partnerid == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.partnerid)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:partnerid, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_prepayid(acc, msg)) do
          try do
            if(msg.prepayid == "") do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_string(msg.prepayid)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:prepayid, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_package(acc, msg)) do
          try do
            if(msg.package == "") do
              acc
            else
              [acc, "\"", Protox.Encode.encode_string(msg.package)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:package, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_noncestr(acc, msg)) do
          try do
            if(msg.noncestr == "") do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.noncestr)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:noncestr, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_timestamp(acc, msg)) do
          try do
            if(msg.timestamp == "") do
              acc
            else
              [acc, "2", Protox.Encode.encode_string(msg.timestamp)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:timestamp, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_sign(acc, msg)) do
          try do
            if(msg.sign == "") do
              acc
            else
              [acc, ":", Protox.Encode.encode_string(msg.sign)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sign, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(
              bytes,
              struct(Soulless.Game.Lq.ResCreateWechatAppOrder.CallWechatAppParam)
            )
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
                {[appid: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[partnerid: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[prepayid: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[package: delimited], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[noncestr: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[timestamp: delimited], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[sign: delimited], rest}

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
          Soulless.Game.Lq.ResCreateWechatAppOrder.CallWechatAppParam,
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
        1 => {:appid, {:scalar, ""}, :string},
        2 => {:partnerid, {:scalar, ""}, :string},
        3 => {:prepayid, {:scalar, ""}, :string},
        4 => {:package, {:scalar, ""}, :string},
        5 => {:noncestr, {:scalar, ""}, :string},
        6 => {:timestamp, {:scalar, ""}, :string},
        7 => {:sign, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        appid: {1, {:scalar, ""}, :string},
        noncestr: {5, {:scalar, ""}, :string},
        package: {4, {:scalar, ""}, :string},
        partnerid: {2, {:scalar, ""}, :string},
        prepayid: {3, {:scalar, ""}, :string},
        sign: {7, {:scalar, ""}, :string},
        timestamp: {6, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "appid",
          kind: {:scalar, ""},
          label: :optional,
          name: :appid,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "partnerid",
          kind: {:scalar, ""},
          label: :optional,
          name: :partnerid,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "prepayid",
          kind: {:scalar, ""},
          label: :optional,
          name: :prepayid,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "package",
          kind: {:scalar, ""},
          label: :optional,
          name: :package,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "noncestr",
          kind: {:scalar, ""},
          label: :optional,
          name: :noncestr,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "timestamp",
          kind: {:scalar, ""},
          label: :optional,
          name: :timestamp,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "sign",
          kind: {:scalar, ""},
          label: :optional,
          name: :sign,
          tag: 7,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:appid)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "appid",
             kind: {:scalar, ""},
             label: :optional,
             name: :appid,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("appid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "appid",
             kind: {:scalar, ""},
             label: :optional,
             name: :appid,
             tag: 1,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:partnerid)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partnerid",
             kind: {:scalar, ""},
             label: :optional,
             name: :partnerid,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("partnerid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "partnerid",
             kind: {:scalar, ""},
             label: :optional,
             name: :partnerid,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:prepayid)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "prepayid",
             kind: {:scalar, ""},
             label: :optional,
             name: :prepayid,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("prepayid")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "prepayid",
             kind: {:scalar, ""},
             label: :optional,
             name: :prepayid,
             tag: 3,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:package)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "package",
             kind: {:scalar, ""},
             label: :optional,
             name: :package,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("package")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "package",
             kind: {:scalar, ""},
             label: :optional,
             name: :package,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:noncestr)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "noncestr",
             kind: {:scalar, ""},
             label: :optional,
             name: :noncestr,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("noncestr")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "noncestr",
             kind: {:scalar, ""},
             label: :optional,
             name: :noncestr,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:timestamp)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timestamp",
             kind: {:scalar, ""},
             label: :optional,
             name: :timestamp,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("timestamp")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "timestamp",
             kind: {:scalar, ""},
             label: :optional,
             name: :timestamp,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:sign)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sign",
             kind: {:scalar, ""},
             label: :optional,
             name: :sign,
             tag: 7,
             type: :string
           }}
        end

        def(field_def("sign")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sign",
             kind: {:scalar, ""},
             label: :optional,
             name: :sign,
             tag: 7,
             type: :string
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
      def(default(:appid)) do
        {:ok, ""}
      end,
      def(default(:partnerid)) do
        {:ok, ""}
      end,
      def(default(:prepayid)) do
        {:ok, ""}
      end,
      def(default(:package)) do
        {:ok, ""}
      end,
      def(default(:noncestr)) do
        {:ok, ""}
      end,
      def(default(:timestamp)) do
        {:ok, ""}
      end,
      def(default(:sign)) do
        {:ok, ""}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end