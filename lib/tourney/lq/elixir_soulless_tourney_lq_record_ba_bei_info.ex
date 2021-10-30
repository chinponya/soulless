# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.RecordBaBeiInfo) do
  @moduledoc false
  (
    defstruct(seat: 0, is_zi_mo: false, is_chong: false, is_bei: false, __uf__: [])

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
          |> encode_seat(msg)
          |> encode_is_zi_mo(msg)
          |> encode_is_chong(msg)
          |> encode_is_bei(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_seat(acc, msg)) do
          try do
            if(msg.seat == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.seat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_zi_mo(acc, msg)) do
          try do
            if(msg.is_zi_mo == false) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_bool(msg.is_zi_mo)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_zi_mo, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_chong(acc, msg)) do
          try do
            if(msg.is_chong == false) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_bool(msg.is_chong)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_chong, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_is_bei(acc, msg)) do
          try do
            if(msg.is_bei == false) do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.is_bei)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_bei, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.RecordBaBeiInfo))
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
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seat: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_zi_mo: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_chong: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_bei: value], rest}

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
          Soulless.Tourney.Lq.RecordBaBeiInfo,
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
        1 => {:seat, {:scalar, 0}, :uint32},
        2 => {:is_zi_mo, {:scalar, false}, :bool},
        3 => {:is_chong, {:scalar, false}, :bool},
        4 => {:is_bei, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        is_bei: {4, {:scalar, false}, :bool},
        is_chong: {3, {:scalar, false}, :bool},
        is_zi_mo: {2, {:scalar, false}, :bool},
        seat: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isZiMo",
          kind: {:scalar, false},
          label: :optional,
          name: :is_zi_mo,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isChong",
          kind: {:scalar, false},
          label: :optional,
          name: :is_chong,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "isBei",
          kind: {:scalar, false},
          label: :optional,
          name: :is_bei,
          tag: 4,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:seat)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("seat")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:is_zi_mo)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZiMo",
             kind: {:scalar, false},
             label: :optional,
             name: :is_zi_mo,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("isZiMo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZiMo",
             kind: {:scalar, false},
             label: :optional,
             name: :is_zi_mo,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("is_zi_mo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isZiMo",
             kind: {:scalar, false},
             label: :optional,
             name: :is_zi_mo,
             tag: 2,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:is_chong)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isChong",
             kind: {:scalar, false},
             label: :optional,
             name: :is_chong,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("isChong")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isChong",
             kind: {:scalar, false},
             label: :optional,
             name: :is_chong,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("is_chong")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isChong",
             kind: {:scalar, false},
             label: :optional,
             name: :is_chong,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:is_bei)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBei",
             kind: {:scalar, false},
             label: :optional,
             name: :is_bei,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("isBei")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBei",
             kind: {:scalar, false},
             label: :optional,
             name: :is_bei,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("is_bei")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isBei",
             kind: {:scalar, false},
             label: :optional,
             name: :is_bei,
             tag: 4,
             type: :bool
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
      def(default(:seat)) do
        {:ok, 0}
      end,
      def(default(:is_zi_mo)) do
        {:ok, false}
      end,
      def(default(:is_chong)) do
        {:ok, false}
      end,
      def(default(:is_bei)) do
        {:ok, false}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end