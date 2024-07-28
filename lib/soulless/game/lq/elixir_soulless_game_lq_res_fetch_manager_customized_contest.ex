# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchManagerCustomizedContest do
  @moduledoc false
  defstruct error: nil,
            name: "",
            open_show: 0,
            game_rule_setting: nil,
            start_time: 0,
            end_time: 0,
            auto_match: 0,
            rank_rule: 0,
            check_state: 0,
            checking_name: "",
            contest_setting: nil,
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
        |> encode_error(msg)
        |> encode_name(msg)
        |> encode_open_show(msg)
        |> encode_game_rule_setting(msg)
        |> encode_start_time(msg)
        |> encode_end_time(msg)
        |> encode_auto_match(msg)
        |> encode_rank_rule(msg)
        |> encode_check_state(msg)
        |> encode_checking_name(msg)
        |> encode_contest_setting(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_name(acc, msg) do
        try do
          if msg.name == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_open_show(acc, msg) do
        try do
          if msg.open_show == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.open_show)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:open_show, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_rule_setting(acc, msg) do
        try do
          if msg.game_rule_setting == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.game_rule_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_rule_setting, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_start_time(acc, msg) do
        try do
          if msg.start_time == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_end_time(acc, msg) do
        try do
          if msg.end_time == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.end_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:end_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_auto_match(acc, msg) do
        try do
          if msg.auto_match == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.auto_match)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:auto_match, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rank_rule(acc, msg) do
        try do
          if msg.rank_rule == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.rank_rule)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rank_rule, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_check_state(acc, msg) do
        try do
          if msg.check_state == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.check_state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:check_state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_checking_name(acc, msg) do
        try do
          if msg.checking_name == "" do
            acc
          else
            [acc, "R", Protox.Encode.encode_string(msg.checking_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:checking_name, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_contest_setting(acc, msg) do
        try do
          if msg.contest_setting == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.contest_setting)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_setting, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResFetchManagerCustomizedContest))
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

              {[
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[name: delimited], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[open_show: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 game_rule_setting:
                   Protox.MergeMessage.merge(
                     msg.game_rule_setting,
                     Soulless.Game.Lq.GameMode.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[end_time: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[auto_match: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rank_rule: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[check_state: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[checking_name: delimited], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 contest_setting:
                   Protox.MergeMessage.merge(
                     msg.contest_setting,
                     Soulless.Game.Lq.ContestSetting.decode!(delimited)
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
        Soulless.Game.Lq.ResFetchManagerCustomizedContest,
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

  (
    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:name, {:scalar, ""}, :string},
        3 => {:open_show, {:scalar, 0}, :uint32},
        4 => {:game_rule_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.GameMode}},
        5 => {:start_time, {:scalar, 0}, :uint32},
        6 => {:end_time, {:scalar, 0}, :uint32},
        7 => {:auto_match, {:scalar, 0}, :uint32},
        8 => {:rank_rule, {:scalar, 0}, :uint32},
        9 => {:check_state, {:scalar, 0}, :uint32},
        10 => {:checking_name, {:scalar, ""}, :string},
        11 => {:contest_setting, {:scalar, nil}, {:message, Soulless.Game.Lq.ContestSetting}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        auto_match: {7, {:scalar, 0}, :uint32},
        check_state: {9, {:scalar, 0}, :uint32},
        checking_name: {10, {:scalar, ""}, :string},
        contest_setting: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.ContestSetting}},
        end_time: {6, {:scalar, 0}, :uint32},
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        game_rule_setting: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.GameMode}},
        name: {2, {:scalar, ""}, :string},
        open_show: {3, {:scalar, 0}, :uint32},
        rank_rule: {8, {:scalar, 0}, :uint32},
        start_time: {5, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Game.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "name",
          kind: {:scalar, ""},
          label: :optional,
          name: :name,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "openShow",
          kind: {:scalar, 0},
          label: :optional,
          name: :open_show,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameRuleSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_rule_setting,
          tag: 4,
          type: {:message, Soulless.Game.Lq.GameMode}
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "endTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :end_time,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "autoMatch",
          kind: {:scalar, 0},
          label: :optional,
          name: :auto_match,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankRule",
          kind: {:scalar, 0},
          label: :optional,
          name: :rank_rule,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkState",
          kind: {:scalar, 0},
          label: :optional,
          name: :check_state,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkingName",
          kind: {:scalar, ""},
          label: :optional,
          name: :checking_name,
          tag: 10,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestSetting",
          kind: {:scalar, nil},
          label: :optional,
          name: :contest_setting,
          tag: 11,
          type: {:message, Soulless.Game.Lq.ContestSetting}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        def field_def("name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "name",
             kind: {:scalar, ""},
             label: :optional,
             name: :name,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def field_def(:open_show) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openShow",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_show,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("openShow") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openShow",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_show,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("open_show") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openShow",
             kind: {:scalar, 0},
             label: :optional,
             name: :open_show,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_rule_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end

        def field_def("gameRuleSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end

        def field_def("game_rule_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameRuleSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_rule_setting,
             tag: 4,
             type: {:message, Soulless.Game.Lq.GameMode}
           }}
        end
      ),
      (
        def field_def(:start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("startTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:end_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("endTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("end_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:auto_match) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("autoMatch") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("auto_match") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "autoMatch",
             kind: {:scalar, 0},
             label: :optional,
             name: :auto_match,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:rank_rule) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("rankRule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("rank_rule") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankRule",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank_rule,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:check_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("checkState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("check_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 9,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:checking_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 10,
             type: :string
           }}
        end

        def field_def("checkingName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 10,
             type: :string
           }}
        end

        def field_def("checking_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 10,
             type: :string
           }}
        end
      ),
      (
        def field_def(:contest_setting) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :contest_setting,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ContestSetting}
           }}
        end

        def field_def("contestSetting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :contest_setting,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ContestSetting}
           }}
        end

        def field_def("contest_setting") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestSetting",
             kind: {:scalar, nil},
             label: :optional,
             name: :contest_setting,
             tag: 11,
             type: {:message, Soulless.Game.Lq.ContestSetting}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]
  )

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

  (
    @spec required_fields() :: []
    def required_fields() do
      []
    end
  )

  (
    @spec syntax() :: atom()
    def syntax() do
      :proto3
    end
  )

  [
    @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
    def default(:error) do
      {:ok, nil}
    end,
    def default(:name) do
      {:ok, ""}
    end,
    def default(:open_show) do
      {:ok, 0}
    end,
    def default(:game_rule_setting) do
      {:ok, nil}
    end,
    def default(:start_time) do
      {:ok, 0}
    end,
    def default(:end_time) do
      {:ok, 0}
    end,
    def default(:auto_match) do
      {:ok, 0}
    end,
    def default(:rank_rule) do
      {:ok, 0}
    end,
    def default(:check_state) do
      {:ok, 0}
    end,
    def default(:checking_name) do
      {:ok, ""}
    end,
    def default(:contest_setting) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end