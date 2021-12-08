# credo:disable-for-this-file
defmodule Soulless.Game.Lq.RPGActivity do
  @moduledoc false
  (
    defstruct activity_id: 0,
              last_show_uuid: "",
              last_played_uuid: "",
              current_state: nil,
              last_show_state: nil,
              received_rewards: [],
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
          |> encode_last_show_uuid(msg)
          |> encode_last_played_uuid(msg)
          |> encode_current_state(msg)
          |> encode_last_show_state(msg)
          |> encode_received_rewards(msg)
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
              reraise Protox.EncodingError.new(:activity_id, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_last_show_uuid(acc, msg) do
          try do
            if msg.last_show_uuid == "" do
              acc
            else
              [acc, "*", Protox.Encode.encode_string(msg.last_show_uuid)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:last_show_uuid, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_last_played_uuid(acc, msg) do
          try do
            if msg.last_played_uuid == "" do
              acc
            else
              [acc, "2", Protox.Encode.encode_string(msg.last_played_uuid)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:last_played_uuid, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_current_state(acc, msg) do
          try do
            if msg.current_state == nil do
              acc
            else
              [acc, ":", Protox.Encode.encode_message(msg.current_state)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:current_state, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_last_show_state(acc, msg) do
          try do
            if msg.last_show_state == nil do
              acc
            else
              [acc, "B", Protox.Encode.encode_message(msg.last_show_state)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:last_show_state, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_received_rewards(acc, msg) do
          try do
            case msg.received_rewards do
              [] ->
                acc

              values ->
                [
                  acc,
                  "J",
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
              reraise Protox.EncodingError.new(:received_rewards, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.RPGActivity))
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

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[last_show_uuid: delimited], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[last_played_uuid: delimited], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   current_state:
                     Protox.MergeMessage.merge(
                       msg.current_state,
                       Soulless.Game.Lq.RPGState.decode!(delimited)
                     )
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   last_show_state:
                     Protox.MergeMessage.merge(
                       msg.last_show_state,
                       Soulless.Game.Lq.RPGState.decode!(delimited)
                     )
                 ], rest}

              {9, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   received_rewards:
                     msg.received_rewards ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {9, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[received_rewards: msg.received_rewards ++ [value]], rest}

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
          Soulless.Game.Lq.RPGActivity,
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
        1 => {:activity_id, {:scalar, 0}, :uint32},
        5 => {:last_show_uuid, {:scalar, ""}, :string},
        6 => {:last_played_uuid, {:scalar, ""}, :string},
        7 => {:current_state, {:scalar, nil}, {:message, Soulless.Game.Lq.RPGState}},
        8 => {:last_show_state, {:scalar, nil}, {:message, Soulless.Game.Lq.RPGState}},
        9 => {:received_rewards, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        activity_id: {1, {:scalar, 0}, :uint32},
        current_state: {7, {:scalar, nil}, {:message, Soulless.Game.Lq.RPGState}},
        last_played_uuid: {6, {:scalar, ""}, :string},
        last_show_state: {8, {:scalar, nil}, {:message, Soulless.Game.Lq.RPGState}},
        last_show_uuid: {5, {:scalar, ""}, :string},
        received_rewards: {9, :packed, :uint32}
      }
    end

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
          json_name: "lastShowUuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :last_show_uuid,
          tag: 5,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastPlayedUuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :last_played_uuid,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "currentState",
          kind: {:scalar, nil},
          label: :optional,
          name: :current_state,
          tag: 7,
          type: {:message, Soulless.Game.Lq.RPGState}
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastShowState",
          kind: {:scalar, nil},
          label: :optional,
          name: :last_show_state,
          tag: 8,
          type: {:message, Soulless.Game.Lq.RPGState}
        },
        %{
          __struct__: Protox.Field,
          json_name: "receivedRewards",
          kind: :packed,
          label: :repeated,
          name: :received_rewards,
          tag: 9,
          type: :uint32
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
        def field_def(:last_show_uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_show_uuid,
             tag: 5,
             type: :string
           }}
        end

        def field_def("lastShowUuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_show_uuid,
             tag: 5,
             type: :string
           }}
        end

        def field_def("last_show_uuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_show_uuid,
             tag: 5,
             type: :string
           }}
        end
      ),
      (
        def field_def(:last_played_uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPlayedUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_played_uuid,
             tag: 6,
             type: :string
           }}
        end

        def field_def("lastPlayedUuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPlayedUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_played_uuid,
             tag: 6,
             type: :string
           }}
        end

        def field_def("last_played_uuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastPlayedUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :last_played_uuid,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def field_def(:current_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentState",
             kind: {:scalar, nil},
             label: :optional,
             name: :current_state,
             tag: 7,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end

        def field_def("currentState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentState",
             kind: {:scalar, nil},
             label: :optional,
             name: :current_state,
             tag: 7,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end

        def field_def("current_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentState",
             kind: {:scalar, nil},
             label: :optional,
             name: :current_state,
             tag: 7,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end
      ),
      (
        def field_def(:last_show_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowState",
             kind: {:scalar, nil},
             label: :optional,
             name: :last_show_state,
             tag: 8,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end

        def field_def("lastShowState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowState",
             kind: {:scalar, nil},
             label: :optional,
             name: :last_show_state,
             tag: 8,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end

        def field_def("last_show_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastShowState",
             kind: {:scalar, nil},
             label: :optional,
             name: :last_show_state,
             tag: 8,
             type: {:message, Soulless.Game.Lq.RPGState}
           }}
        end
      ),
      (
        def field_def(:received_rewards) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receivedRewards",
             kind: :packed,
             label: :repeated,
             name: :received_rewards,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("receivedRewards") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receivedRewards",
             kind: :packed,
             label: :repeated,
             name: :received_rewards,
             tag: 9,
             type: :uint32
           }}
        end

        def field_def("received_rewards") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "receivedRewards",
             kind: :packed,
             label: :repeated,
             name: :received_rewards,
             tag: 9,
             type: :uint32
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
      def default(:activity_id) do
        {:ok, 0}
      end,
      def default(:last_show_uuid) do
        {:ok, ""}
      end,
      def default(:last_played_uuid) do
        {:ok, ""}
      end,
      def default(:current_state) do
        {:ok, nil}
      end,
      def default(:last_show_state) do
        {:ok, nil}
      end,
      def default(:received_rewards) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end