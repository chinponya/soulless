# credo:disable-for-this-file
defmodule(Soulless.Lq.ResFetchCommentList) do
  @moduledoc false
  (
    defstruct(error: nil, comment_allow: 0, comment_id_list: [], last_read_id: 0, __uf__: [])

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
          |> encode_error(msg)
          |> encode_comment_allow(msg)
          |> encode_comment_id_list(msg)
          |> encode_last_read_id(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_error(acc, msg)) do
          try do
            if(msg.error == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.error)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_comment_allow(acc, msg)) do
          try do
            if(msg.comment_allow == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.comment_allow)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:comment_allow, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_comment_id_list(acc, msg)) do
          try do
            case(msg.comment_id_list) do
              [] ->
                acc

              values ->
                [
                  acc,
                  <<26>>,
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
                Protox.EncodingError.new(:comment_id_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_last_read_id(acc, msg)) do
          try do
            if(msg.last_read_id == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.last_read_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:last_read_id, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.ResFetchCommentList))
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

                {[error: Protox.Message.merge(msg.error, Soulless.Lq.Error.decode!(delimited))],
                 rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[comment_allow: value], rest}

              {3, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   comment_id_list:
                     msg.comment_id_list ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[comment_id_list: msg.comment_id_list ++ [value]], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[last_read_id: value], rest}

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
          Soulless.Lq.ResFetchCommentList,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Lq.Error}},
        2 => {:comment_allow, {:scalar, 0}, :uint32},
        3 => {:comment_id_list, :packed, :uint32},
        4 => {:last_read_id, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        comment_allow: {2, {:scalar, 0}, :uint32},
        comment_id_list: {3, :packed, :uint32},
        error: {1, {:scalar, nil}, {:message, Soulless.Lq.Error}},
        last_read_id: {4, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "commentAllow",
          kind: {:scalar, 0},
          label: :optional,
          name: :comment_allow,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "commentIdList",
          kind: :packed,
          label: :repeated,
          name: :comment_id_list,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastReadId",
          kind: {:scalar, 0},
          label: :optional,
          name: :last_read_id,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:error)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Lq.Error}
           }}
        end

        def(field_def("error")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Lq.Error}
           }}
        end

        []
      ),
      (
        def(field_def(:comment_allow)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentAllow",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_allow,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("commentAllow")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentAllow",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_allow,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("comment_allow")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentAllow",
             kind: {:scalar, 0},
             label: :optional,
             name: :comment_allow,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:comment_id_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentIdList",
             kind: :packed,
             label: :repeated,
             name: :comment_id_list,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("commentIdList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentIdList",
             kind: :packed,
             label: :repeated,
             name: :comment_id_list,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("comment_id_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "commentIdList",
             kind: :packed,
             label: :repeated,
             name: :comment_id_list,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:last_read_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastReadId",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_read_id,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("lastReadId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastReadId",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_read_id,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("last_read_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastReadId",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_read_id,
             tag: 4,
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
      def(default(:error)) do
        {:ok, nil}
      end,
      def(default(:comment_allow)) do
        {:ok, 0}
      end,
      def(default(:comment_id_list)) do
        {:error, :no_default_value}
      end,
      def(default(:last_read_id)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end