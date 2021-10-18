# credo:disable-for-this-file
defmodule(Soulless.Lq.RecordLiuJu) do
  @moduledoc false
  (
    defstruct(
      type: 0,
      gameend: nil,
      seat: 0,
      tiles: [],
      liqi: nil,
      allplayertiles: [],
      muyu: nil,
      hules_history: [],
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
          |> encode_type(msg)
          |> encode_gameend(msg)
          |> encode_seat(msg)
          |> encode_tiles(msg)
          |> encode_liqi(msg)
          |> encode_allplayertiles(msg)
          |> encode_muyu(msg)
          |> encode_hules_history(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_type(acc, msg)) do
          try do
            if(msg.type == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.type)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_gameend(acc, msg)) do
          try do
            if(msg.gameend == nil) do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_message(msg.gameend)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:gameend, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_seat(acc, msg)) do
          try do
            if(msg.seat == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.seat)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tiles(acc, msg)) do
          try do
            case(msg.tiles) do
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
              reraise(Protox.EncodingError.new(:tiles, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liqi(acc, msg)) do
          try do
            if(msg.liqi == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.liqi)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:liqi, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_allplayertiles(acc, msg)) do
          try do
            case(msg.allplayertiles) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "2", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:allplayertiles, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_muyu(acc, msg)) do
          try do
            if(msg.muyu == nil) do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.muyu)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_hules_history(acc, msg)) do
          try do
            case(msg.hules_history) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "J", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:hules_history, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.RecordLiuJu))
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
                {[type: value], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   gameend:
                     Protox.Message.merge(msg.gameend, Soulless.Lq.GameEnd.decode!(delimited))
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seat: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tiles: msg.tiles ++ [delimited]], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   liqi:
                     Protox.Message.merge(msg.liqi, Soulless.Lq.LiQiSuccess.decode!(delimited))
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[allplayertiles: msg.allplayertiles ++ [delimited]], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[muyu: Protox.Message.merge(msg.muyu, Soulless.Lq.MuyuInfo.decode!(delimited))],
                 rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[hules_history: msg.hules_history ++ [Soulless.Lq.HuleInfo.decode!(delimited)]],
                 rest}

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
          Soulless.Lq.RecordLiuJu,
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
        1 => {:type, {:scalar, 0}, :uint32},
        2 => {:gameend, {:scalar, nil}, {:message, Soulless.Lq.GameEnd}},
        3 => {:seat, {:scalar, 0}, :uint32},
        4 => {:tiles, :unpacked, :string},
        5 => {:liqi, {:scalar, nil}, {:message, Soulless.Lq.LiQiSuccess}},
        6 => {:allplayertiles, :unpacked, :string},
        7 => {:muyu, {:scalar, nil}, {:message, Soulless.Lq.MuyuInfo}},
        9 => {:hules_history, :unpacked, {:message, Soulless.Lq.HuleInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        allplayertiles: {6, :unpacked, :string},
        gameend: {2, {:scalar, nil}, {:message, Soulless.Lq.GameEnd}},
        hules_history: {9, :unpacked, {:message, Soulless.Lq.HuleInfo}},
        liqi: {5, {:scalar, nil}, {:message, Soulless.Lq.LiQiSuccess}},
        muyu: {7, {:scalar, nil}, {:message, Soulless.Lq.MuyuInfo}},
        seat: {3, {:scalar, 0}, :uint32},
        tiles: {4, :unpacked, :string},
        type: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameend",
          kind: {:scalar, nil},
          label: :optional,
          name: :gameend,
          tag: 2,
          type: {:message, Soulless.Lq.GameEnd}
        },
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "tiles",
          kind: :unpacked,
          label: :repeated,
          name: :tiles,
          tag: 4,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqi",
          kind: {:scalar, nil},
          label: :optional,
          name: :liqi,
          tag: 5,
          type: {:message, Soulless.Lq.LiQiSuccess}
        },
        %{
          __struct__: Protox.Field,
          json_name: "allplayertiles",
          kind: :unpacked,
          label: :repeated,
          name: :allplayertiles,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 7,
          type: {:message, Soulless.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hulesHistory",
          kind: :unpacked,
          label: :repeated,
          name: :hules_history,
          tag: 9,
          type: {:message, Soulless.Lq.HuleInfo}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:gameend)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameend",
             kind: {:scalar, nil},
             label: :optional,
             name: :gameend,
             tag: 2,
             type: {:message, Soulless.Lq.GameEnd}
           }}
        end

        def(field_def("gameend")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameend",
             kind: {:scalar, nil},
             label: :optional,
             name: :gameend,
             tag: 2,
             type: {:message, Soulless.Lq.GameEnd}
           }}
        end

        []
      ),
      (
        def(field_def(:seat)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 3,
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
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:tiles)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles",
             kind: :unpacked,
             label: :repeated,
             name: :tiles,
             tag: 4,
             type: :string
           }}
        end

        def(field_def("tiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tiles",
             kind: :unpacked,
             label: :repeated,
             name: :tiles,
             tag: 4,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:liqi)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Lq.LiQiSuccess}
           }}
        end

        def(field_def("liqi")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 5,
             type: {:message, Soulless.Lq.LiQiSuccess}
           }}
        end

        []
      ),
      (
        def(field_def(:allplayertiles)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "allplayertiles",
             kind: :unpacked,
             label: :repeated,
             name: :allplayertiles,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("allplayertiles")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "allplayertiles",
             kind: :unpacked,
             label: :repeated,
             name: :allplayertiles,
             tag: 6,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:muyu)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 7,
             type: {:message, Soulless.Lq.MuyuInfo}
           }}
        end

        def(field_def("muyu")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 7,
             type: {:message, Soulless.Lq.MuyuInfo}
           }}
        end

        []
      ),
      (
        def(field_def(:hules_history)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Lq.HuleInfo}
           }}
        end

        def(field_def("hulesHistory")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Lq.HuleInfo}
           }}
        end

        def(field_def("hules_history")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hulesHistory",
             kind: :unpacked,
             label: :repeated,
             name: :hules_history,
             tag: 9,
             type: {:message, Soulless.Lq.HuleInfo}
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
      def(default(:type)) do
        {:ok, 0}
      end,
      def(default(:gameend)) do
        {:ok, nil}
      end,
      def(default(:seat)) do
        {:ok, 0}
      end,
      def(default(:tiles)) do
        {:error, :no_default_value}
      end,
      def(default(:liqi)) do
        {:ok, nil}
      end,
      def(default(:allplayertiles)) do
        {:error, :no_default_value}
      end,
      def(default(:muyu)) do
        {:ok, nil}
      end,
      def(default(:hules_history)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end