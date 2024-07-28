# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountMiscSnapshot do
  @moduledoc false
  defstruct faith_data: nil,
            vip_reward_gained: nil,
            vip: nil,
            shop_info: nil,
            month_ticket: nil,
            recharged: nil,
            month_ticket_v2: nil,
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
        |> encode_faith_data(msg)
        |> encode_vip_reward_gained(msg)
        |> encode_vip(msg)
        |> encode_shop_info(msg)
        |> encode_month_ticket(msg)
        |> encode_recharged(msg)
        |> encode_month_ticket_v2(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_faith_data(acc, msg) do
        try do
          if msg.faith_data == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.faith_data)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:faith_data, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_vip_reward_gained(acc, msg) do
        try do
          if msg.vip_reward_gained == nil do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_message(msg.vip_reward_gained)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vip_reward_gained, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_vip(acc, msg) do
        try do
          if msg.vip == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.vip)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vip, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_shop_info(acc, msg) do
        try do
          if msg.shop_info == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.shop_info)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shop_info, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_month_ticket(acc, msg) do
        try do
          if msg.month_ticket == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.month_ticket)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:month_ticket, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_recharged(acc, msg) do
        try do
          if msg.recharged == nil do
            acc
          else
            [acc, "2", Protox.Encode.encode_message(msg.recharged)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:recharged, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_month_ticket_v2(acc, msg) do
        try do
          if msg.month_ticket_v2 == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.month_ticket_v2)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:month_ticket_v2, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountMiscSnapshot))
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
                 faith_data:
                   Protox.MergeMessage.merge(
                     msg.faith_data,
                     Soulless.Game.Lq.FaithData.decode!(delimited)
                   )
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 vip_reward_gained:
                   Protox.MergeMessage.merge(
                     msg.vip_reward_gained,
                     Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot.decode!(
                       delimited
                     )
                   )
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 vip:
                   Protox.MergeMessage.merge(
                     msg.vip,
                     Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 shop_info:
                   Protox.MergeMessage.merge(
                     msg.shop_info,
                     Soulless.Game.Lq.ShopInfo.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 month_ticket:
                   Protox.MergeMessage.merge(
                     msg.month_ticket,
                     Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot.decode!(
                       delimited
                     )
                   )
               ], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 recharged:
                   Protox.MergeMessage.merge(
                     msg.recharged,
                     Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo.decode!(delimited)
                   )
               ], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 month_ticket_v2:
                   Protox.MergeMessage.merge(
                     msg.month_ticket_v2,
                     Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2.decode!(
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
        Soulless.Game.Lq.AccountMiscSnapshot,
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
        1 => {:faith_data, {:scalar, nil}, {:message, Soulless.Game.Lq.FaithData}},
        2 =>
          {:vip_reward_gained, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}},
        3 => {:vip, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP}},
        4 => {:shop_info, {:scalar, nil}, {:message, Soulless.Game.Lq.ShopInfo}},
        5 =>
          {:month_ticket, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}},
        6 =>
          {:recharged, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo}},
        7 =>
          {:month_ticket_v2, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        faith_data: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.FaithData}},
        month_ticket:
          {5, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}},
        month_ticket_v2:
          {7, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}},
        recharged:
          {6, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo}},
        shop_info: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.ShopInfo}},
        vip: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP}},
        vip_reward_gained:
          {2, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "faithData",
          kind: {:scalar, nil},
          label: :optional,
          name: :faith_data,
          tag: 1,
          type: {:message, Soulless.Game.Lq.FaithData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vipRewardGained",
          kind: {:scalar, nil},
          label: :optional,
          name: :vip_reward_gained,
          tag: 2,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vip",
          kind: {:scalar, nil},
          label: :optional,
          name: :vip,
          tag: 3,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP}
        },
        %{
          __struct__: Protox.Field,
          json_name: "shopInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :shop_info,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ShopInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthTicket",
          kind: {:scalar, nil},
          label: :optional,
          name: :month_ticket,
          tag: 5,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recharged",
          kind: {:scalar, nil},
          label: :optional,
          name: :recharged,
          tag: 6,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "monthTicketV2",
          kind: {:scalar, nil},
          label: :optional,
          name: :month_ticket_v2,
          tag: 7,
          type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:faith_data) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithData",
             kind: {:scalar, nil},
             label: :optional,
             name: :faith_data,
             tag: 1,
             type: {:message, Soulless.Game.Lq.FaithData}
           }}
        end

        def field_def("faithData") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithData",
             kind: {:scalar, nil},
             label: :optional,
             name: :faith_data,
             tag: 1,
             type: {:message, Soulless.Game.Lq.FaithData}
           }}
        end

        def field_def("faith_data") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithData",
             kind: {:scalar, nil},
             label: :optional,
             name: :faith_data,
             tag: 1,
             type: {:message, Soulless.Game.Lq.FaithData}
           }}
        end
      ),
      (
        def field_def(:vip_reward_gained) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipRewardGained",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward_gained,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}
           }}
        end

        def field_def("vipRewardGained") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipRewardGained",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward_gained,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}
           }}
        end

        def field_def("vip_reward_gained") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vipRewardGained",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip_reward_gained,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIPRewardSnapshot}
           }}
        end
      ),
      (
        def field_def(:vip) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vip",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP}
           }}
        end

        def field_def("vip") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vip",
             kind: {:scalar, nil},
             label: :optional,
             name: :vip,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountVIP}
           }}
        end

        []
      ),
      (
        def field_def(:shop_info) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ShopInfo}
           }}
        end

        def field_def("shopInfo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ShopInfo}
           }}
        end

        def field_def("shop_info") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shopInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :shop_info,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ShopInfo}
           }}
        end
      ),
      (
        def field_def(:month_ticket) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}
           }}
        end

        def field_def("monthTicket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}
           }}
        end

        def field_def("month_ticket") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicket",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket,
             tag: 5,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshot}
           }}
        end
      ),
      (
        def field_def(:recharged) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recharged",
             kind: {:scalar, nil},
             label: :optional,
             name: :recharged,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo}
           }}
        end

        def field_def("recharged") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recharged",
             kind: {:scalar, nil},
             label: :optional,
             name: :recharged,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountRechargeInfo}
           }}
        end

        []
      ),
      (
        def field_def(:month_ticket_v2) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_v2,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}
           }}
        end

        def field_def("monthTicketV2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_v2,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}
           }}
        end

        def field_def("month_ticket_v2") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "monthTicketV2",
             kind: {:scalar, nil},
             label: :optional,
             name: :month_ticket_v2,
             tag: 7,
             type: {:message, Soulless.Game.Lq.AccountMiscSnapshot.AccountMonthTicketSnapshotV2}
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
    def default(:faith_data) do
      {:ok, nil}
    end,
    def default(:vip_reward_gained) do
      {:ok, nil}
    end,
    def default(:vip) do
      {:ok, nil}
    end,
    def default(:shop_info) do
      {:ok, nil}
    end,
    def default(:month_ticket) do
      {:ok, nil}
    end,
    def default(:recharged) do
      {:ok, nil}
    end,
    def default(:month_ticket_v2) do
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
