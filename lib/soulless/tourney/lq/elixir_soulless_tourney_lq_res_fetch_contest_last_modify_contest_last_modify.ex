# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.ResFetchContestLastModify.ContestLastModify) do
  @moduledoc false
  (
    defstruct(
      contest_name: "",
      external_notice: "",
      internal_notice: "",
      manager_notice: "",
      reason: "",
      status: 0,
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
          |> encode_contest_name(msg)
          |> encode_external_notice(msg)
          |> encode_internal_notice(msg)
          |> encode_manager_notice(msg)
          |> encode_reason(msg)
          |> encode_status(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_contest_name(acc, msg)) do
          try do
            if(msg.contest_name == "") do
              acc
            else
              [acc, "\n", Protox.Encode.encode_string(msg.contest_name)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:contest_name, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_external_notice(acc, msg)) do
          try do
            if(msg.external_notice == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.external_notice)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:external_notice, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_internal_notice(acc, msg)) do
          try do
            if(msg.internal_notice == "") do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_string(msg.internal_notice)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:internal_notice, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_manager_notice(acc, msg)) do
          try do
            if(msg.manager_notice == "") do
              acc
            else
              [acc, "\"", Protox.Encode.encode_string(msg.manager_notice)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:manager_notice, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_reason(acc, msg)) do
          try do
            if(msg.reason == "") do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.reason)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:reason, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_status(acc, msg)) do
          try do
            if(msg.status == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.status)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:status, "invalid field value"), __STACKTRACE__)
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
              struct(Soulless.Tourney.Lq.ResFetchContestLastModify.ContestLastModify)
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
                {[contest_name: delimited], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[external_notice: delimited], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[internal_notice: delimited], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[manager_notice: delimited], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[reason: delimited], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[status: value], rest}

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
          Soulless.Tourney.Lq.ResFetchContestLastModify.ContestLastModify,
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
        1 => {:contest_name, {:scalar, ""}, :string},
        2 => {:external_notice, {:scalar, ""}, :string},
        3 => {:internal_notice, {:scalar, ""}, :string},
        4 => {:manager_notice, {:scalar, ""}, :string},
        5 => {:reason, {:scalar, ""}, :string},
        6 => {:status, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        contest_name: {1, {:scalar, ""}, :string},
        external_notice: {2, {:scalar, ""}, :string},
        internal_notice: {3, {:scalar, ""}, :string},
        manager_notice: {4, {:scalar, ""}, :string},
        reason: {5, {:scalar, ""}, :string},
        status: {6, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "contestName",
          kind: {:scalar, ""},
          label: :optional,
          name: :contest_name,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "externalNotice",
          kind: {:scalar, ""},
          label: :optional,
          name: :external_notice,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "internalNotice",
          kind: {:scalar, ""},
          label: :optional,
          name: :internal_notice,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "managerNotice",
          kind: {:scalar, ""},
          label: :optional,
          name: :manager_notice,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "reason",
          kind: {:scalar, ""},
          label: :optional,
          name: :reason,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "status",
          kind: {:scalar, 0},
          label: :optional,
          name: :status,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:contest_name)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("contestName")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
           }}
        end

        def(field_def("contest_name")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:external_notice)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "externalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :external_notice,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("externalNotice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "externalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :external_notice,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("external_notice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "externalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :external_notice,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:internal_notice)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "internalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :internal_notice,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("internalNotice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "internalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :internal_notice,
             tag: 3,
             type: :string
           }}
        end

        def(field_def("internal_notice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "internalNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :internal_notice,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:manager_notice)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "managerNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :manager_notice,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("managerNotice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "managerNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :manager_notice,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("manager_notice")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "managerNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :manager_notice,
             tag: 4,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:reason)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reason",
             kind: {:scalar, ""},
             label: :optional,
             name: :reason,
             tag: 5,
             type: :string
           }}
        end

        def(field_def("reason")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reason",
             kind: {:scalar, ""},
             label: :optional,
             name: :reason,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:status)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "status",
             kind: {:scalar, 0},
             label: :optional,
             name: :status,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("status")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "status",
             kind: {:scalar, 0},
             label: :optional,
             name: :status,
             tag: 6,
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
      def(default(:contest_name)) do
        {:ok, ""}
      end,
      def(default(:external_notice)) do
        {:ok, ""}
      end,
      def(default(:internal_notice)) do
        {:ok, ""}
      end,
      def(default(:manager_notice)) do
        {:ok, ""}
      end,
      def(default(:reason)) do
        {:ok, ""}
      end,
      def(default(:status)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end