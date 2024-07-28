# credo:disable-for-this-file
defmodule Soulless.Game.Lq.VillageTripData do
  @moduledoc false
  defstruct start_round: 0, dest_id: 0, reward: [], level: 0, info: nil, __uf__: []

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
        |> encode_start_round(msg)
        |> encode_dest_id(msg)
        |> encode_reward(msg)
        |> encode_level(msg)
        |> encode_info(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_start_round(acc, msg) do
        try do
          if msg.start_round == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.start_round)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_round, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dest_id(acc, msg) do
        try do
          if msg.dest_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.dest_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dest_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reward(acc, msg) do
        try do
          case msg.reward do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x1A", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:reward, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_level(acc, msg) do
        try do
          if msg.level == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.level)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:level, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_info(acc, msg) do
        try do
          if msg.info == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:info, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.VillageTripData))
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
              {[start_round: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[dest_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[reward: msg.reward ++ [Soulless.Game.Lq.VillageReward.decode!(delimited)]], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[level: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 info:
                   Protox.MergeMessage.merge(
                     msg.info,
                     Soulless.Game.Lq.VillageTargetInfo.decode!(delimited)
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
        Soulless.Game.Lq.VillageTripData,
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
        1 => {:start_round, {:scalar, 0}, :uint32},
        2 => {:dest_id, {:scalar, 0}, :uint32},
        3 => {:reward, :unpacked, {:message, Soulless.Game.Lq.VillageReward}},
        4 => {:level, {:scalar, 0}, :uint32},
        5 => {:info, {:scalar, nil}, {:message, Soulless.Game.Lq.VillageTargetInfo}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        dest_id: {2, {:scalar, 0}, :uint32},
        info: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.VillageTargetInfo}},
        level: {4, {:scalar, 0}, :uint32},
        reward: {3, :unpacked, {:message, Soulless.Game.Lq.VillageReward}},
        start_round: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "startRound",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_round,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "destId",
          kind: {:scalar, 0},
          label: :optional,
          name: :dest_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "reward",
          kind: :unpacked,
          label: :repeated,
          name: :reward,
          tag: 3,
          type: {:message, Soulless.Game.Lq.VillageReward}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, 0},
          label: :optional,
          name: :level,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "info",
          kind: {:scalar, nil},
          label: :optional,
          name: :info,
          tag: 5,
          type: {:message, Soulless.Game.Lq.VillageTargetInfo}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:start_round) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startRound",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_round,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("startRound") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startRound",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_round,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("start_round") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startRound",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_round,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:dest_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "destId",
             kind: {:scalar, 0},
             label: :optional,
             name: :dest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("destId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "destId",
             kind: {:scalar, 0},
             label: :optional,
             name: :dest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("dest_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "destId",
             kind: {:scalar, 0},
             label: :optional,
             name: :dest_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:reward) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reward",
             kind: :unpacked,
             label: :repeated,
             name: :reward,
             tag: 3,
             type: {:message, Soulless.Game.Lq.VillageReward}
           }}
        end

        def field_def("reward") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "reward",
             kind: :unpacked,
             label: :repeated,
             name: :reward,
             tag: 3,
             type: {:message, Soulless.Game.Lq.VillageReward}
           }}
        end

        []
      ),
      (
        def field_def(:level) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level",
             kind: {:scalar, 0},
             label: :optional,
             name: :level,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("level") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "level",
             kind: {:scalar, 0},
             label: :optional,
             name: :level,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "info",
             kind: {:scalar, nil},
             label: :optional,
             name: :info,
             tag: 5,
             type: {:message, Soulless.Game.Lq.VillageTargetInfo}
           }}
        end

        def field_def("info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "info",
             kind: {:scalar, nil},
             label: :optional,
             name: :info,
             tag: 5,
             type: {:message, Soulless.Game.Lq.VillageTargetInfo}
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
    def default(:start_round) do
      {:ok, 0}
    end,
    def default(:dest_id) do
      {:ok, 0}
    end,
    def default(:reward) do
      {:error, :no_default_value}
    end,
    def default(:level) do
      {:ok, 0}
    end,
    def default(:info) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]

  (
    @spec file_options() :: nil
    def file_options() do
      nil
    end
  )
end
