# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.AccountAchievementSnapshot do
  @moduledoc false
  defstruct achievements: [], rewarded_group: nil, version: nil, __uf__: []

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
        |> encode_achievements(msg)
        |> encode_rewarded_group(msg)
        |> encode_version(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_achievements(acc, msg) do
        try do
          case msg.achievements do
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
            reraise Protox.EncodingError.new(:achievements, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rewarded_group(acc, msg) do
        try do
          if msg.rewarded_group == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.rewarded_group)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rewarded_group, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_version(acc, msg) do
        try do
          if msg.version == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.version)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:version, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.AccountAchievementSnapshot))
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
                 achievements:
                   msg.achievements ++
                     [Soulless.Tourney.Lq.AchievementProgress.decode!(delimited)]
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 rewarded_group:
                   Protox.MergeMessage.merge(
                     msg.rewarded_group,
                     Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot.decode!(
                       delimited
                     )
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 version:
                   Protox.MergeMessage.merge(
                     msg.version,
                     Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion.decode!(
                       delimited
                     )
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
        Soulless.Tourney.Lq.AccountAchievementSnapshot,
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
        1 => {:achievements, :unpacked, {:message, Soulless.Tourney.Lq.AchievementProgress}},
        2 =>
          {:rewarded_group, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}},
        3 =>
          {:version, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        achievements: {1, :unpacked, {:message, Soulless.Tourney.Lq.AchievementProgress}},
        rewarded_group:
          {2, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}},
        version:
          {3, {:scalar, nil},
           {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "achievements",
          kind: :unpacked,
          label: :repeated,
          name: :achievements,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.AchievementProgress}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewardedGroup",
          kind: {:scalar, nil},
          label: :optional,
          name: :rewarded_group,
          tag: 2,
          type: {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "version",
          kind: {:scalar, nil},
          label: :optional,
          name: :version,
          tag: 3,
          type: {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:achievements) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievements",
             kind: :unpacked,
             label: :repeated,
             name: :achievements,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.AchievementProgress}
           }}
        end

        def field_def("achievements") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievements",
             kind: :unpacked,
             label: :repeated,
             name: :achievements,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.AchievementProgress}
           }}
        end

        []
      ),
      (
        def field_def(:rewarded_group) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedGroup",
             kind: {:scalar, nil},
             label: :optional,
             name: :rewarded_group,
             tag: 2,
             type:
               {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}
           }}
        end

        def field_def("rewardedGroup") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedGroup",
             kind: {:scalar, nil},
             label: :optional,
             name: :rewarded_group,
             tag: 2,
             type:
               {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}
           }}
        end

        def field_def("rewarded_group") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedGroup",
             kind: {:scalar, nil},
             label: :optional,
             name: :rewarded_group,
             tag: 2,
             type:
               {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.RewardedGroupSnapshot}
           }}
        end
      ),
      (
        def field_def(:version) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, nil},
             label: :optional,
             name: :version,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion}
           }}
        end

        def field_def("version") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "version",
             kind: {:scalar, nil},
             label: :optional,
             name: :version,
             tag: 3,
             type: {:message, Soulless.Tourney.Lq.AccountAchievementSnapshot.AchievementVersion}
           }}
        end

        []
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
    def default(:achievements) do
      {:error, :no_default_value}
    end,
    def default(:rewarded_group) do
      {:ok, nil}
    end,
    def default(:version) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end