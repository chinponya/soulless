# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.ContestDetailRuleV2) do
  @moduledoc false
  (
    defstruct(game_rule: nil, extra_rule: nil, __uf__: [])

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
          [] |> encode_game_rule(msg) |> encode_extra_rule(msg) |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_game_rule(acc, msg)) do
          try do
            if(msg.game_rule == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.game_rule)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:game_rule, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_extra_rule(acc, msg)) do
          try do
            if(msg.extra_rule == nil) do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_message(msg.extra_rule)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:extra_rule, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.ContestDetailRuleV2))
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
                   game_rule:
                     Protox.Message.merge(
                       msg.game_rule,
                       Soulless.Tourney.Lq.ContestDetailRule.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   extra_rule:
                     Protox.Message.merge(
                       msg.extra_rule,
                       Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule.decode!(delimited)
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
          Soulless.Tourney.Lq.ContestDetailRuleV2,
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
        1 => {:game_rule, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ContestDetailRule}},
        2 =>
          {:extra_rule, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        extra_rule:
          {2, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}},
        game_rule: {1, {:scalar, nil}, {:message, Soulless.Tourney.Lq.ContestDetailRule}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "gameRule",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_rule,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.ContestDetailRule}
        },
        %{
          __struct__: Protox.Field,
          json_name: "extraRule",
          kind: {:scalar, nil},
          label: :optional,
          name: :extra_rule,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:game_rule)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRule}
           }}
        end

        def(field_def("gameRule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRule}
           }}
        end

        def(field_def("game_rule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRule}
           }}
        end
      ),
      (
        def(field_def(:extra_rule)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :extra_rule,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}
           }}
        end

        def(field_def("extraRule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :extra_rule,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}
           }}
        end

        def(field_def("extra_rule")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :extra_rule,
             tag: 2,
             type: {:message, Soulless.Tourney.Lq.ContestDetailRuleV2.ExtraRule}
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
      def(default(:game_rule)) do
        {:ok, nil}
      end,
      def(default(:extra_rule)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end