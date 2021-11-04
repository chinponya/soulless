# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.GameSnapshot.PlayerSnapshot) do
  @moduledoc false
  (
    defstruct(score: 0, liqiposition: 0, tilenum: 0, qipais: [], mings: [], __uf__: [])

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
          |> encode_score(msg)
          |> encode_liqiposition(msg)
          |> encode_tilenum(msg)
          |> encode_qipais(msg)
          |> encode_mings(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_score(acc, msg)) do
          try do
            if(msg.score == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_int32(msg.score)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:score, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqiposition(acc, msg)) do
          try do
            if(msg.liqiposition == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_int32(msg.liqiposition)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:liqiposition, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_tilenum(acc, msg)) do
          try do
            if(msg.tilenum == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.tilenum)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tilenum, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_qipais(acc, msg)) do
          try do
            case(msg.qipais) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:qipais, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_mings(acc, msg)) do
          try do
            case(msg.mings) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "*", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:mings, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.GameSnapshot.PlayerSnapshot))
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
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[score: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[liqiposition: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[tilenum: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[qipais: msg.qipais ++ [delimited]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   mings:
                     msg.mings ++
                       [Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu.decode!(delimited)]
                 ], rest}

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
          Soulless.Game.Lq.GameSnapshot.PlayerSnapshot,
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
        1 => {:score, {:scalar, 0}, :int32},
        2 => {:liqiposition, {:scalar, 0}, :int32},
        3 => {:tilenum, {:scalar, 0}, :uint32},
        4 => {:qipais, :unpacked, :string},
        5 => {:mings, :unpacked, {:message, Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        liqiposition: {2, {:scalar, 0}, :int32},
        mings: {5, :unpacked, {:message, Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu}},
        qipais: {4, :unpacked, :string},
        score: {1, {:scalar, 0}, :int32},
        tilenum: {3, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "score",
          kind: {:scalar, 0},
          label: :optional,
          name: :score,
          tag: 1,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqiposition",
          kind: {:scalar, 0},
          label: :optional,
          name: :liqiposition,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tilenum",
          kind: {:scalar, 0},
          label: :optional,
          name: :tilenum,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "qipais",
          kind: :unpacked,
          label: :repeated,
          name: :qipais,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "mings",
          kind: :unpacked,
          label: :repeated,
          name: :mings,
          tag: 5,
          type: {:message, Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:score)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 1,
             type: :int32
           }}
        end

        def(field_def("score")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "score",
             kind: {:scalar, 0},
             label: :optional,
             name: :score,
             tag: 1,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:liqiposition)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiposition",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqiposition,
             tag: 2,
             type: :int32
           }}
        end

        def(field_def("liqiposition")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqiposition",
             kind: {:scalar, 0},
             label: :optional,
             name: :liqiposition,
             tag: 2,
             type: :int32
           }}
        end

        []
      ),
      (
        def(field_def(:tilenum)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tilenum",
             kind: {:scalar, 0},
             label: :optional,
             name: :tilenum,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("tilenum")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tilenum",
             kind: {:scalar, 0},
             label: :optional,
             name: :tilenum,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:qipais)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qipais",
             kind: :unpacked,
             label: :repeated,
             name: :qipais,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("qipais")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "qipais",
             kind: :unpacked,
             label: :repeated,
             name: :qipais,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:mings)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mings",
             kind: :unpacked,
             label: :repeated,
             name: :mings,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu}
           }}
        end

        def(field_def("mings")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mings",
             kind: :unpacked,
             label: :repeated,
             name: :mings,
             tag: 5,
             type: {:message, Soulless.Game.Lq.GameSnapshot.PlayerSnapshot.Fulu}
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
      def(default(:score)) do
        {:ok, 0}
      end,
      def(default(:liqiposition)) do
        {:ok, 0}
      end,
      def(default(:tilenum)) do
        {:ok, 0}
      end,
      def(default(:qipais)) do
        {:error, :no_default_value}
      end,
      def(default(:mings)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end