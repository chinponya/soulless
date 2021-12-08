# credo:disable-for-this-file
defmodule Soulless.Game.Lq.GameMode do
  @moduledoc false
  (
    defstruct mode: 0,
              ai: false,
              extendinfo: "",
              detail_rule: nil,
              testing_environment: nil,
              game_setting: nil,
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
          |> encode_mode(msg)
          |> encode_ai(msg)
          |> encode_extendinfo(msg)
          |> encode_detail_rule(msg)
          |> encode_testing_environment(msg)
          |> encode_game_setting(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_mode(acc, msg) do
          try do
            if msg.mode == 0 do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.mode)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:mode, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_ai(acc, msg) do
          try do
            if msg.ai == false do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.ai)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:ai, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_extendinfo(acc, msg) do
          try do
            if msg.extendinfo == "" do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.extendinfo)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:extendinfo, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_detail_rule(acc, msg) do
          try do
            if msg.detail_rule == nil do
              acc
            else
              [acc, "2", Protox.Encode.encode_message(msg.detail_rule)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:detail_rule, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_testing_environment(acc, msg) do
          try do
            if msg.testing_environment == nil do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.testing_environment)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:testing_environment, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_game_setting(acc, msg) do
          try do
            if msg.game_setting == nil do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.game_setting)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:game_setting, "invalid field value"),
                      __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.GameMode))
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
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[mode: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[ai: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[extendinfo: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   detail_rule:
                     Protox.MergeMessage.merge(
                       msg.detail_rule,
                       Soulless.Game.Lq.GameDetailRule.decode!(delimited)
                     )
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   testing_environment:
                     Protox.MergeMessage.merge(
                       msg.testing_environment,
                       Soulless.Game.Lq.GameTestingEnvironmentSet.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_setting:
                     Protox.MergeMessage.merge(
                       msg.game_setting,
                       Soulless.Game.Lq.GameSetting.decode!(delimited)
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
          Soulless.Game.Lq.GameMode,
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
        1 => {:mode, {:scalar, 0}, :uint32},
        4 => {:ai, {:scalar, false}, :bool},
        5 => {:extendinfo, {:scalar, ""}, :string},
        6 => {:detail_rule, {:scalar, nil}, {:message, Soulless.Game.Lq.GameDetailRule}},
        7 =>
          {:testing_environment, {:scalar, nil},
           {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}},
        8 => {:game_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSetting}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        ai: {4, {:scalar, false}, :bool},
        detail_rule: {6, {:scalar, nil}, {:message, Soulless.Game.Lq.GameDetailRule}},
        extendinfo: {5, {:scalar, ""}, :string},
        game_setting: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSetting}},
        mode: {1, {:scalar, 0}, :uint32},
        testing_environment:
          {7, {:scalar, nil}, {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "mode",
          kind: {:scalar, 0},
          label: :optional,
          name: :mode,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ai",
          kind: {:scalar, false},
          label: :optional,
          name: :ai,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "extendinfo",
          kind: {:scalar, ""},
          label: :optional,
          name: :extendinfo,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "detailRule",
          kind: {:scalar, nil},
          label: :optional,
          name: :detail_rule,
          tag: 6,
          type: {:message, Soulless.Game.Lq.GameDetailRule}
        },
        %{
          __struct__: Protox.Field,
          json_name: "testingEnvironment",
          kind: {:scalar, nil},
          label: :optional,
          name: :testing_environment,
          tag: 7,
          type: {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_setting,
          tag: 8,
          type: {:message, Soulless.Game.Lq.GameSetting}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:mode) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("mode") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mode",
             kind: {:scalar, 0},
             label: :optional,
             name: :mode,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:ai) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ai",
             kind: {:scalar, false},
             label: :optional,
             name: :ai,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("ai") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ai",
             kind: {:scalar, false},
             label: :optional,
             name: :ai,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:extendinfo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extendinfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :extendinfo,
             tag: 5,
             type: :string
           }}
        end

        def field_def("extendinfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extendinfo",
             kind: {:scalar, ""},
             label: :optional,
             name: :extendinfo,
             tag: 5,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:detail_rule) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule,
             tag: 6,
             type: {:message, Soulless.Game.Lq.GameDetailRule}
           }}
        end

        def field_def("detailRule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule,
             tag: 6,
             type: {:message, Soulless.Game.Lq.GameDetailRule}
           }}
        end

        def field_def("detail_rule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "detailRule",
             kind: {:scalar, nil},
             label: :optional,
             name: :detail_rule,
             tag: 6,
             type: {:message, Soulless.Game.Lq.GameDetailRule}
           }}
        end
      ),
      (
        def field_def(:testing_environment) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testingEnvironment",
             kind: {:scalar, nil},
             label: :optional,
             name: :testing_environment,
             tag: 7,
             type: {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}
           }}
        end

        def field_def("testingEnvironment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testingEnvironment",
             kind: {:scalar, nil},
             label: :optional,
             name: :testing_environment,
             tag: 7,
             type: {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}
           }}
        end

        def field_def("testing_environment") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "testingEnvironment",
             kind: {:scalar, nil},
             label: :optional,
             name: :testing_environment,
             tag: 7,
             type: {:message, Soulless.Game.Lq.GameTestingEnvironmentSet}
           }}
        end
      ),
      (
        def field_def(:game_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_setting,
             tag: 8,
             type: {:message, Soulless.Game.Lq.GameSetting}
           }}
        end

        def field_def("gameSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_setting,
             tag: 8,
             type: {:message, Soulless.Game.Lq.GameSetting}
           }}
        end

        def field_def("game_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_setting,
             tag: 8,
             type: {:message, Soulless.Game.Lq.GameSetting}
           }}
        end
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
      def default(:mode) do
        {:ok, 0}
      end,
      def default(:ai) do
        {:ok, false}
      end,
      def default(:extendinfo) do
        {:ok, ""}
      end,
      def default(:detail_rule) do
        {:ok, nil}
      end,
      def default(:testing_environment) do
        {:ok, nil}
      end,
      def default(:game_setting) do
        {:ok, nil}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end