# credo:disable-for-this-file
defmodule Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData do
  @moduledoc false
  defstruct activity_id: 0,
            feed_count: 0,
            friend_receive_data: nil,
            friend_send_data: nil,
            gift_inbox: [],
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
        |> encode_feed_count(msg)
        |> encode_friend_receive_data(msg)
        |> encode_friend_send_data(msg)
        |> encode_gift_inbox(msg)
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
      defp encode_feed_count(acc, msg) do
        try do
          if msg.feed_count == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.feed_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:feed_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_friend_receive_data(acc, msg) do
        try do
          if msg.friend_receive_data == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.friend_receive_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:friend_receive_data, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_friend_send_data(acc, msg) do
        try do
          if msg.friend_send_data == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.friend_send_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:friend_send_data, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_gift_inbox(acc, msg) do
        try do
          case msg.gift_inbox do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "*", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gift_inbox, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData))
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
              {[feed_count: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 friend_receive_data:
                   Protox.MergeMessage.merge(
                     msg.friend_receive_data,
                     Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData.decode!(
                       delimited
                     )
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 friend_send_data:
                   Protox.MergeMessage.merge(
                     msg.friend_send_data,
                     Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData.decode!(
                       delimited
                     )
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 gift_inbox:
                   msg.gift_inbox ++
                     [
                       Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData.decode!(
                         delimited
                       )
                     ]
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
        Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData,
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
        2 => {:feed_count, {:scalar, 0}, :uint32},
        3 =>
          {:friend_receive_data, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}},
        4 =>
          {:friend_send_data, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}},
        5 =>
          {:gift_inbox, :unpacked,
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        activity_id: {1, {:scalar, 0}, :uint32},
        feed_count: {2, {:scalar, 0}, :uint32},
        friend_receive_data:
          {3, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}},
        friend_send_data:
          {4, {:scalar, nil},
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}},
        gift_inbox:
          {5, :unpacked,
           {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}}
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
          json_name: "feedCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :feed_count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "friendReceiveData",
          kind: {:scalar, nil},
          label: :optional,
          name: :friend_receive_data,
          tag: 3,
          type:
            {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "friendSendData",
          kind: {:scalar, nil},
          label: :optional,
          name: :friend_send_data,
          tag: 4,
          type:
            {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "giftInbox",
          kind: :unpacked,
          label: :repeated,
          name: :gift_inbox,
          tag: 5,
          type: {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}
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
        def field_def(:feed_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "feedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :feed_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("feedCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "feedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :feed_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("feed_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "feedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :feed_count,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:friend_receive_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendReceiveData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_receive_data,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end

        def field_def("friendReceiveData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendReceiveData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_receive_data,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end

        def field_def("friend_receive_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendReceiveData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_receive_data,
             tag: 3,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end
      ),
      (
        def field_def(:friend_send_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendSendData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_send_data,
             tag: 4,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end

        def field_def("friendSendData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendSendData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_send_data,
             tag: 4,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end

        def field_def("friend_send_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendSendData",
             kind: {:scalar, nil},
             label: :optional,
             name: :friend_send_data,
             tag: 4,
             type:
               {:message,
                Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.CountWithTimeData}
           }}
        end
      ),
      (
        def field_def(:gift_inbox) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftInbox",
             kind: :unpacked,
             label: :repeated,
             name: :gift_inbox,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}
           }}
        end

        def field_def("giftInbox") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftInbox",
             kind: :unpacked,
             label: :repeated,
             name: :gift_inbox,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}
           }}
        end

        def field_def("gift_inbox") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftInbox",
             kind: :unpacked,
             label: :repeated,
             name: :gift_inbox,
             tag: 5,
             type: {:message, Soulless.Game.Lq.NotifyActivityUpdate.FeedActivityData.GiftBoxData}
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
    def default(:feed_count) do
      {:ok, 0}
    end,
    def default(:friend_receive_data) do
      {:ok, nil}
    end,
    def default(:friend_send_data) do
      {:ok, nil}
    end,
    def default(:gift_inbox) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end