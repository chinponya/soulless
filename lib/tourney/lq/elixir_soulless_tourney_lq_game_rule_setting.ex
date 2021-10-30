# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.GameRuleSetting) do
  @moduledoc false
  (
    defstruct(
      round_type: 0,
      shiduan: false,
      dora_count: 0,
      thinking_type: 0,
      use_detail_rule: false,
      detail_rule_v2: nil,
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
          |> encode_round_type(msg)
          |> encode_shiduan(msg)
          |> encode_dora_count(msg)
          |> encode_thinking_type(msg)
          |> encode_use_detail_rule(msg)
          |> encode_detail_rule_v2(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_round_type(acc, msg)) do
          try do
            if(msg.round_type == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.round_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:round_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_shiduan(acc, msg)) do
          try do
            if(msg.shiduan == false) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_bool(msg.shiduan)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:shiduan, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_dora_count(acc, msg)) do
          try do
            if(msg.dora_count == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.dora_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:dora_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_thinking_type(acc, msg)) do
          try do
            if(msg.thinking_type == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.thinking_type)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:thinking_type, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_use_detail_rule(acc, msg)) do
          try do
            if(msg.use_detail_rule == false) do
              acc
            else
              [acc, "(", Protox.Encode.encode_bool(msg.use_detail_rule)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:use_detail_rule, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_detail_rule_v2(acc, msg)) do
          try do
            if(msg.detail_rule_v2 == nil) do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.detail_rule_v2)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:detail_rule_v2, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.GameRuleSetting))
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
                {[round_type: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[shiduan: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[dora_count: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[thinking_type: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[use_detail_rule: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   detail_rule_v2:
                     Protox.Message.merge(
                       msg.detail_rule_v2,
                       Soulless.Tourney.Lq.ContestDetailRuleV2.decode!(delimited)
                     )
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
          Soulless.Tourney.Lq.GameRuleSetting,
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
        1 => {:round_type, {:scalar, 0}, :uint32},
        2 => {:shiduan, {:scalar, false}, :bool},
        3 => {:dora_count, {:scalar, 0}, :uint32},
        4 => {:thinking_type, {:scalar, 0}, :uint32},
        5 => {:use_detail_rule, {:scalar, false}, :bool},
        6 =>
          {:detail_rule_v2, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        detail_rule_v2: {6, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}},
        dora_count: {3, {:scalar, 0}, :uint32},
        round_type: {1, {:scalar, 0}, :uint32},
        shiduan: {2, {:scalar, false}, :bool},
        thinking_type: {4, {:scalar, 0}, :uint32},
        use_detail_rule: {5, {:scalar, false}, :bool}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "roundType",
          kind: {:scalar, 0},
          label: :optional,
          name: :round_type,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "shiduan",
          kind: {:scalar, false},
          label: :optional,
          name: :shiduan,
          tag: 2,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "doraCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :dora_count,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "thinkingType",
          kind: {:scalar, 0},
          label: :optional,
          name: :thinking_type,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "useDetailRule",
          kind: {:scalar, false},
          label: :optional,
          name: :use_detail_rule,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "detailRuleV2",
          kind: {:scalar, nil},
          label: :optional,
          name: :detail_rule_v2,
          tag: 6,
          type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:round_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundType",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_type,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("roundType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundType",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_type,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("round_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "roundType",
             kind: {:scalar, 0},
             label: :optional,
             name: :round_type,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:shiduan)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shiduan",
             kind: {:scalar, false},
             label: :optional,
             name: :shiduan,
             tag: 2,
             type: :bool
           }}
        end

        def(field_def("shiduan")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shiduan",
             kind: {:scalar, false},
             label: :optional,
             name: :shiduan,
             tag: 2,
             type: :bool
           }}
        end

        []
      ),
      (
        def(field_def(:dora_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora_count,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("doraCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora_count,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("dora_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "doraCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :dora_count,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:thinking_type)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "thinkingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :thinking_type,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("thinkingType")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "thinkingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :thinking_type,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("thinking_type")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "thinkingType",
             kind: {:scalar, 0},
             label: :optional,
             name: :thinking_type,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:use_detail_rule)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useDetailRule",
             kind: {:scalar, false},
             label: :optional,
             name: :use_detail_rule,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("useDetailRule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useDetailRule",
             kind: {:scalar, false},
             label: :optional,
             name: :use_detail_rule,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("use_detail_rule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "useDetailRule",
             kind: {:scalar, false},
             label: :optional,
             name: :use_detail_rule,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:detail_rule_v2)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRuleV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule_v2,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}
           }}
        end

        def(field_def("detailRuleV2")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRuleV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule_v2,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}
           }}
        end

        def(field_def("detail_rule_v2")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRuleV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule_v2,
             tag: 6,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2}
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
      def(default(:round_type)) do
        {:ok, 0}
      end,
      def(default(:shiduan)) do
        {:ok, false}
      end,
      def(default(:dora_count)) do
        {:ok, 0}
      end,
      def(default(:thinking_type)) do
        {:ok, 0}
      end,
      def(default(:use_detail_rule)) do
        {:ok, false}
      end,
      def(default(:detail_rule_v2)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end