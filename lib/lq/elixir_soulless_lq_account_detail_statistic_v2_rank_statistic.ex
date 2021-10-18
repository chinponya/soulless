# credo:disable-for-this-file
defmodule(Soulless.Lq.AccountDetailStatisticV2.RankStatistic) do
  @moduledoc false
  (
    defstruct(total_statistic: nil, month_statistic: nil, month_refresh_time: 0, __uf__: [])

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
          |> encode_total_statistic(msg)
          |> encode_month_statistic(msg)
          |> encode_month_refresh_time(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_total_statistic(acc, msg)) do
          try do
            if(msg.total_statistic == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.total_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:total_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_month_statistic(acc, msg)) do
          try do
            if(msg.month_statistic == nil) do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_message(msg.month_statistic)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:month_statistic, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_month_refresh_time(acc, msg)) do
          try do
            if(msg.month_refresh_time == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.month_refresh_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:month_refresh_time, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.AccountDetailStatisticV2.RankStatistic))
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
                   total_statistic:
                     Protox.Message.merge(
                       msg.total_statistic,
                       Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData.decode!(
                         delimited
                       )
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   month_statistic:
                     Protox.Message.merge(
                       msg.month_statistic,
                       Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData.decode!(
                         delimited
                       )
                     )
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[month_refresh_time: value], rest}

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
          Soulless.Lq.AccountDetailStatisticV2.RankStatistic,
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
        1 =>
          {:total_statistic, {:scalar, nil},
           {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}},
        2 =>
          {:month_statistic, {:scalar, nil},
           {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}},
        3 => {:month_refresh_time, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        month_refresh_time: {3, {:scalar, 0}, :uint32},
        month_statistic:
          {2, {:scalar, nil},
           {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}},
        total_statistic:
          {1, {:scalar, nil},
           {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "totalStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :total_statistic,
          tag: 1,
          type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthStatistic",
          kind: {:scalar, nil},
          label: :optional,
          name: :month_statistic,
          tag: 2,
          type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthRefreshTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :month_refresh_time,
          tag: 3,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:total_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :total_statistic,
             tag: 1,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end

        def(field_def("totalStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :total_statistic,
             tag: 1,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end

        def(field_def("total_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :total_statistic,
             tag: 1,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end
      ),
      (
        def(field_def(:month_statistic)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_statistic,
             tag: 2,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end

        def(field_def("monthStatistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_statistic,
             tag: 2,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end

        def(field_def("month_statistic")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthStatistic",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_statistic,
             tag: 2,
             type: {:message, Soulless.Lq.AccountDetailStatisticV2.RankStatistic.RankData}
           }}
        end
      ),
      (
        def(field_def(:month_refresh_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthRefreshTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :month_refresh_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("monthRefreshTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthRefreshTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :month_refresh_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("month_refresh_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthRefreshTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :month_refresh_time,
             tag: 3,
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
      def(default(:total_statistic)) do
        {:ok, nil}
      end,
      def(default(:month_statistic)) do
        {:ok, nil}
      end,
      def(default(:month_refresh_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end