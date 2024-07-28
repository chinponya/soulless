# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ActivityFestivalData do
  @moduledoc false
  defstruct activity_id: 0,
            level: 0,
            proposal_list: [],
            event_list: [],
            buy_record: nil,
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
        |> encode_activity_id(msg)
        |> encode_level(msg)
        |> encode_proposal_list(msg)
        |> encode_event_list(msg)
        |> encode_buy_record(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_activity_id(acc, msg) do
        try do
          if msg.activity_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.activity_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:activity_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_level(acc, msg) do
        try do
          if msg.level == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.level)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:level, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_proposal_list(acc, msg) do
        try do
          case msg.proposal_list do
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
            reraise Protox.EncodingError.new(:proposal_list, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_event_list(acc, msg) do
        try do
          case msg.event_list do
            [] ->
              acc

            values ->
              [
                acc,
                "\"",
                (
                  {bytes, len} =
                    Enum.reduce(values, {[], 0}, fn value, {acc, len} ->
                      value_bytes = :binary.list_to_bin([Protox.Encode.encode_uint32(value)])
                      {[acc, value_bytes], len + byte_size(value_bytes)}
                    end)

                  [Protox.Varint.encode(len), bytes]
                )
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:event_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_buy_record(acc, msg) do
        try do
          if msg.buy_record == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.buy_record)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:buy_record, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ActivityFestivalData))
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
              {[activity_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[level: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 proposal_list:
                   msg.proposal_list ++ [Soulless.Game.Lq.FestivalProposalData.decode!(delimited)]
               ], rest}

            {4, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[event_list: msg.event_list ++ Protox.Decode.parse_repeated_uint32([], delimited)],
               rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[event_list: msg.event_list ++ [value]], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 buy_record:
                   Protox.MergeMessage.merge(
                     msg.buy_record,
                     Soulless.Game.Lq.SignedTimeCounterData.decode!(delimited)
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
        Soulless.Game.Lq.ActivityFestivalData,
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
        1 => {:activity_id, {:scalar, 0}, :uint32},
        2 => {:level, {:scalar, 0}, :uint32},
        3 => {:proposal_list, :unpacked, {:message, Soulless.Game.Lq.FestivalProposalData}},
        4 => {:event_list, :packed, :uint32},
        5 => {:buy_record, {:scalar, nil}, {:message, Soulless.Game.Lq.SignedTimeCounterData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        activity_id: {1, {:scalar, 0}, :uint32},
        buy_record: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.SignedTimeCounterData}},
        event_list: {4, :packed, :uint32},
        level: {2, {:scalar, 0}, :uint32},
        proposal_list: {3, :unpacked, {:message, Soulless.Game.Lq.FestivalProposalData}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "activityId",
          kind: {:scalar, 0},
          label: :optional,
          name: :activity_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, 0},
          label: :optional,
          name: :level,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "proposalList",
          kind: :unpacked,
          label: :repeated,
          name: :proposal_list,
          tag: 3,
          type: {:message, Soulless.Game.Lq.FestivalProposalData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "eventList",
          kind: :packed,
          label: :repeated,
          name: :event_list,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buyRecord",
          kind: {:scalar, nil},
          label: :optional,
          name: :buy_record,
          tag: 5,
          type: {:message, Soulless.Game.Lq.SignedTimeCounterData}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:activity_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("activityId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("activity_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 1,
             type: :uint32
           }}
        end
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
             tag: 2,
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
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:proposal_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "proposalList",
             kind: :unpacked,
             label: :repeated,
             name: :proposal_list,
             tag: 3,
             type: {:message, Soulless.Game.Lq.FestivalProposalData}
           }}
        end

        def field_def("proposalList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "proposalList",
             kind: :unpacked,
             label: :repeated,
             name: :proposal_list,
             tag: 3,
             type: {:message, Soulless.Game.Lq.FestivalProposalData}
           }}
        end

        def field_def("proposal_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "proposalList",
             kind: :unpacked,
             label: :repeated,
             name: :proposal_list,
             tag: 3,
             type: {:message, Soulless.Game.Lq.FestivalProposalData}
           }}
        end
      ),
      (
        def field_def(:event_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eventList",
             kind: :packed,
             label: :repeated,
             name: :event_list,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("eventList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eventList",
             kind: :packed,
             label: :repeated,
             name: :event_list,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("event_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "eventList",
             kind: :packed,
             label: :repeated,
             name: :event_list,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:buy_record) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecord",
             kind: {:scalar, nil},
             label: :optional,
             name: :buy_record,
             tag: 5,
             type: {:message, Soulless.Game.Lq.SignedTimeCounterData}
           }}
        end

        def field_def("buyRecord") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecord",
             kind: {:scalar, nil},
             label: :optional,
             name: :buy_record,
             tag: 5,
             type: {:message, Soulless.Game.Lq.SignedTimeCounterData}
           }}
        end

        def field_def("buy_record") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyRecord",
             kind: {:scalar, nil},
             label: :optional,
             name: :buy_record,
             tag: 5,
             type: {:message, Soulless.Game.Lq.SignedTimeCounterData}
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
    def default(:activity_id) do
      {:ok, 0}
    end,
    def default(:level) do
      {:ok, 0}
    end,
    def default(:proposal_list) do
      {:error, :no_default_value}
    end,
    def default(:event_list) do
      {:error, :no_default_value}
    end,
    def default(:buy_record) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end