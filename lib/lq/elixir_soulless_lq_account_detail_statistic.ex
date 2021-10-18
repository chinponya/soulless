# credo:disable-for-this-file
defmodule(Soulless.Lq.AccountDetailStatistic) do
  @moduledoc false
  (
    defstruct(game_mode: [], fan: [], liujumanguan: 0, fan_achieved: [], __uf__: [])

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
          |> encode_game_mode(msg)
          |> encode_fan(msg)
          |> encode_liujumanguan(msg)
          |> encode_fan_achieved(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_game_mode(acc, msg)) do
          try do
            case(msg.game_mode) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\n", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:game_mode, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_fan(acc, msg)) do
          try do
            case(msg.fan) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:fan, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_liujumanguan(acc, msg)) do
          try do
            if(msg.liujumanguan == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.liujumanguan)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:liujumanguan, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_fan_achieved(acc, msg)) do
          try do
            case(msg.fan_achieved) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:fan_achieved, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.AccountDetailStatistic))
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

                {[
                   game_mode:
                     msg.game_mode ++ [Soulless.Lq.AccountStatisticByGameMode.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[fan: msg.fan ++ [Soulless.Lq.AccountStatisticByFan.decode!(delimited)]], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[liujumanguan: value], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   fan_achieved:
                     msg.fan_achieved ++ [Soulless.Lq.AccountFanAchieved.decode!(delimited)]
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
          Soulless.Lq.AccountDetailStatistic,
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
        1 => {:game_mode, :unpacked, {:message, Soulless.Lq.AccountStatisticByGameMode}},
        2 => {:fan, :unpacked, {:message, Soulless.Lq.AccountStatisticByFan}},
        3 => {:liujumanguan, {:scalar, 0}, :uint32},
        4 => {:fan_achieved, :unpacked, {:message, Soulless.Lq.AccountFanAchieved}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        fan: {2, :unpacked, {:message, Soulless.Lq.AccountStatisticByFan}},
        fan_achieved: {4, :unpacked, {:message, Soulless.Lq.AccountFanAchieved}},
        game_mode: {1, :unpacked, {:message, Soulless.Lq.AccountStatisticByGameMode}},
        liujumanguan: {3, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "gameMode",
          kind: :unpacked,
          label: :repeated,
          name: :game_mode,
          tag: 1,
          type: {:message, Soulless.Lq.AccountStatisticByGameMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "fan",
          kind: :unpacked,
          label: :repeated,
          name: :fan,
          tag: 2,
          type: {:message, Soulless.Lq.AccountStatisticByFan}
        },
        %{
          __struct__: Protox.Field,
          json_name: "liujumanguan",
          kind: {:scalar, 0},
          label: :optional,
          name: :liujumanguan,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "fanAchieved",
          kind: :unpacked,
          label: :repeated,
          name: :fan_achieved,
          tag: 4,
          type: {:message, Soulless.Lq.AccountFanAchieved}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:game_mode)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: :unpacked,
             label: :repeated,
             name: :game_mode,
             tag: 1,
             type: {:message, Soulless.Lq.AccountStatisticByGameMode}
           }}
        end

        def(field_def("gameMode")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: :unpacked,
             label: :repeated,
             name: :game_mode,
             tag: 1,
             type: {:message, Soulless.Lq.AccountStatisticByGameMode}
           }}
        end

        def(field_def("game_mode")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameMode",
             kind: :unpacked,
             label: :repeated,
             name: :game_mode,
             tag: 1,
             type: {:message, Soulless.Lq.AccountStatisticByGameMode}
           }}
        end
      ),
      (
        def(field_def(:fan)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fan",
             kind: :unpacked,
             label: :repeated,
             name: :fan,
             tag: 2,
             type: {:message, Soulless.Lq.AccountStatisticByFan}
           }}
        end

        def(field_def("fan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fan",
             kind: :unpacked,
             label: :repeated,
             name: :fan,
             tag: 2,
             type: {:message, Soulless.Lq.AccountStatisticByFan}
           }}
        end

        []
      ),
      (
        def(field_def(:liujumanguan)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujumanguan",
             kind: {:scalar, 0},
             label: :optional,
             name: :liujumanguan,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("liujumanguan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liujumanguan",
             kind: {:scalar, 0},
             label: :optional,
             name: :liujumanguan,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def(field_def(:fan_achieved)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanAchieved",
             kind: :unpacked,
             label: :repeated,
             name: :fan_achieved,
             tag: 4,
             type: {:message, Soulless.Lq.AccountFanAchieved}
           }}
        end

        def(field_def("fanAchieved")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanAchieved",
             kind: :unpacked,
             label: :repeated,
             name: :fan_achieved,
             tag: 4,
             type: {:message, Soulless.Lq.AccountFanAchieved}
           }}
        end

        def(field_def("fan_achieved")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "fanAchieved",
             kind: :unpacked,
             label: :repeated,
             name: :fan_achieved,
             tag: 4,
             type: {:message, Soulless.Lq.AccountFanAchieved}
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
      def(default(:game_mode)) do
        {:error, :no_default_value}
      end,
      def(default(:fan)) do
        {:error, :no_default_value}
      end,
      def(default(:liujumanguan)) do
        {:ok, 0}
      end,
      def(default(:fan_achieved)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end