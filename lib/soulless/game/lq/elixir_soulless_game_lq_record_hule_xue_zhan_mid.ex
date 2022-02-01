# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RecordHuleXueZhanMid do
  @moduledoc false
  (
    defstruct hules: [],
              old_scores: [],
              delta_scores: [],
              scores: [],
              doras: [],
              muyu: nil,
              liqi: nil,
              zhenting: [],
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
          |> encode_hules(msg)
          |> encode_old_scores(msg)
          |> encode_delta_scores(msg)
          |> encode_scores(msg)
          |> encode_doras(msg)
          |> encode_muyu(msg)
          |> encode_liqi(msg)
          |> encode_zhenting(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_hules(acc, msg) do
          try do
            case msg.hules do
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
              reraise Protox.EncodingError.new(:hules, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_old_scores(acc, msg) do
          try do
            case msg.old_scores do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\x12",
                  (
                    {bytes, len} =
                      Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_int32(value)])
                        {[acc, value_bytes], len + byte_size(value_bytes)}
                      end)

                    [Protox.Varint.encode(len), bytes]
                  )
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:old_scores, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_delta_scores(acc, msg) do
          try do
            case msg.delta_scores do
              [] ->
                acc

              values ->
                [
                  acc,
                  "\x1A",
                  (
                    {bytes, len} =
                      Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_int32(value)])
                        {[acc, value_bytes], len + byte_size(value_bytes)}
                      end)

                    [Protox.Varint.encode(len), bytes]
                  )
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:delta_scores, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_scores(acc, msg) do
          try do
            case msg.scores do
              [] ->
                acc

              values ->
                [
                  acc,
                  "*",
                  (
                    {bytes, len} =
                      Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_int32(value)])
                        {[acc, value_bytes], len + byte_size(value_bytes)}
                      end)

                    [Protox.Varint.encode(len), bytes]
                  )
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:scores, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_doras(acc, msg) do
          try do
            case msg.doras do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, ":", Protox.Encode.encode_string(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:doras, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_muyu(acc, msg) do
          try do
            if msg.muyu == nil do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.muyu)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:muyu, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_liqi(acc, msg) do
          try do
            if msg.liqi == nil do
              acc
            else
              [acc, "J", Protox.Encode.encode_message(msg.liqi)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:liqi, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_zhenting(acc, msg) do
          try do
            case msg.zhenting do
              [] ->
                acc

              values ->
                [
                  acc,
                  "R",
                  (
                    {bytes, len} =
                      Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                        value_bytes = :binary.list_to_bin([Protox.Encode.encode_bool(value)])
                        {[acc, value_bytes], len + byte_size(value_bytes)}
                      end)

                    [Protox.Varint.encode(len), bytes]
                  )
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:zhenting, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.RecordHuleXueZhanMid))
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

                {[hules: msg.hules ++ [Soulless.Game.Lq.HuInfoXueZhanMid.decode!(delimited)]],
                 rest}

              {2, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   old_scores: msg.old_scores ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[old_scores: msg.old_scores ++ [value]], rest}

              {3, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   delta_scores:
                     msg.delta_scores ++ Protox.Decode.parse_repeated_int32([], delimited)
                 ], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[delta_scores: msg.delta_scores ++ [value]], rest}

              {5, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[scores: msg.scores ++ Protox.Decode.parse_repeated_int32([], delimited)], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int32(bytes)
                {[scores: msg.scores ++ [value]], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[doras: msg.doras ++ [delimited]], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   muyu:
                     Protox.MergeMessage.merge(
                       msg.muyu,
                       Soulless.Game.Lq.MuyuInfo.decode!(delimited)
                     )
                 ], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   liqi:
                     Protox.MergeMessage.merge(
                       msg.liqi,
                       Soulless.Game.Lq.LiQiSuccess.decode!(delimited)
                     )
                 ], rest}

              {10, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[zhenting: msg.zhenting ++ Protox.Decode.parse_repeated_bool([], delimited)],
                 rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[zhenting: msg.zhenting ++ [value]], rest}

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
          Soulless.Game.Lq.RecordHuleXueZhanMid,
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
        1 => {:hules, :unpacked, {:message, Soulless.Game.Lq.HuInfoXueZhanMid}},
        2 => {:old_scores, :packed, :int32},
        3 => {:delta_scores, :packed, :int32},
        5 => {:scores, :packed, :int32},
        7 => {:doras, :unpacked, :string},
        8 => {:muyu, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        9 => {:liqi, {:scalar, nil}, {:message, Soulless.Game.Lq.LiQiSuccess}},
        10 => {:zhenting, :packed, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        delta_scores: {3, :packed, :int32},
        doras: {7, :unpacked, :string},
        hules: {1, :unpacked, {:message, Soulless.Game.Lq.HuInfoXueZhanMid}},
        liqi: {9, {:scalar, nil}, {:message, Soulless.Game.Lq.LiQiSuccess}},
        muyu: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.MuyuInfo}},
        old_scores: {2, :packed, :int32},
        scores: {5, :packed, :int32},
        zhenting: {10, :packed, :bool}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "hules",
          kind: :unpacked,
          label: :repeated,
          name: :hules,
          tag: 1,
          type: {:message, Soulless.Game.Lq.HuInfoXueZhanMid}
        },
        %{
          __struct__: Protox.Field,
          json_name: "oldScores",
          kind: :packed,
          label: :repeated,
          name: :old_scores,
          tag: 2,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "deltaScores",
          kind: :packed,
          label: :repeated,
          name: :delta_scores,
          tag: 3,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "scores",
          kind: :packed,
          label: :repeated,
          name: :scores,
          tag: 5,
          type: :int32
        },
        %{
          __struct__: Protox.Field,
          json_name: "doras",
          kind: :unpacked,
          label: :repeated,
          name: :doras,
          tag: 7,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "muyu",
          kind: {:scalar, nil},
          label: :optional,
          name: :muyu,
          tag: 8,
          type: {:message, Soulless.Game.Lq.MuyuInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "liqi",
          kind: {:scalar, nil},
          label: :optional,
          name: :liqi,
          tag: 9,
          type: {:message, Soulless.Game.Lq.LiQiSuccess}
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhenting",
          kind: :packed,
          label: :repeated,
          name: :zhenting,
          tag: 10,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:hules) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hules",
             kind: :unpacked,
             label: :repeated,
             name: :hules,
             tag: 1,
             type: {:message, Soulless.Game.Lq.HuInfoXueZhanMid}
           }}
        end

        def field_def("hules") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hules",
             kind: :unpacked,
             label: :repeated,
             name: :hules,
             tag: 1,
             type: {:message, Soulless.Game.Lq.HuInfoXueZhanMid}
           }}
        end

        []
      ),
      (
        def field_def(:old_scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("oldScores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end

        def field_def("old_scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "oldScores",
             kind: :packed,
             label: :repeated,
             name: :old_scores,
             tag: 2,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:delta_scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("deltaScores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end

        def field_def("delta_scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "deltaScores",
             kind: :packed,
             label: :repeated,
             name: :delta_scores,
             tag: 3,
             type: :int32
           }}
        end
      ),
      (
        def field_def(:scores) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        def field_def("scores") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "scores",
             kind: :packed,
             label: :repeated,
             name: :scores,
             tag: 5,
             type: :int32
           }}
        end

        []
      ),
      (
        def field_def(:doras) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 7,
             type: :string
           }}
        end

        def field_def("doras") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doras",
             kind: :unpacked,
             label: :repeated,
             name: :doras,
             tag: 7,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:muyu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 8,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        def field_def("muyu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "muyu",
             kind: {:scalar, nil},
             label: :optional,
             name: :muyu,
             tag: 8,
             type: {:message, Soulless.Game.Lq.MuyuInfo}
           }}
        end

        []
      ),
      (
        def field_def(:liqi) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 9,
             type: {:message, Soulless.Game.Lq.LiQiSuccess}
           }}
        end

        def field_def("liqi") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "liqi",
             kind: {:scalar, nil},
             label: :optional,
             name: :liqi,
             tag: 9,
             type: {:message, Soulless.Game.Lq.LiQiSuccess}
           }}
        end

        []
      ),
      (
        def field_def(:zhenting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 10,
             type: :bool
           }}
        end

        def field_def("zhenting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhenting",
             kind: :packed,
             label: :repeated,
             name: :zhenting,
             tag: 10,
             type: :bool
           }}
        end

        []
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
      def default(:hules) do
        {:error, :no_default_value}
      end,
      def default(:old_scores) do
        {:error, :no_default_value}
      end,
      def default(:delta_scores) do
        {:error, :no_default_value}
      end,
      def default(:scores) do
        {:error, :no_default_value}
      end,
      def default(:doras) do
        {:error, :no_default_value}
      end,
      def default(:muyu) do
        {:ok, nil}
      end,
      def default(:liqi) do
        {:ok, nil}
      end,
      def default(:zhenting) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end