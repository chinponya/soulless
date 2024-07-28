# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ActivityCombiningData do
  @moduledoc false
  defstruct activity_id: 0,
            workbench: [],
            orders: [],
            recycle_bin: nil,
            menu: nil,
            current_order_id: 0,
            bonus: nil,
            unlocked_craft: [],
            craft_pool: [],
            order_pool: [],
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
        |> encode_workbench(msg)
        |> encode_orders(msg)
        |> encode_recycle_bin(msg)
        |> encode_menu(msg)
        |> encode_current_order_id(msg)
        |> encode_bonus(msg)
        |> encode_unlocked_craft(msg)
        |> encode_craft_pool(msg)
        |> encode_order_pool(msg)
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
      defp encode_workbench(acc, msg) do
        try do
          case msg.workbench do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\x12", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:workbench, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_orders(acc, msg) do
        try do
          case msg.orders do
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
            reraise Protox.EncodingError.new(:orders, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_recycle_bin(acc, msg) do
        try do
          if msg.recycle_bin == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.recycle_bin)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:recycle_bin, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_menu(acc, msg) do
        try do
          if msg.menu == nil do
            acc
          else
            [acc, "*", Protox.Encode.encode_message(msg.menu)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:menu, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_current_order_id(acc, msg) do
        try do
          if msg.current_order_id == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.current_order_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:current_order_id, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_bonus(acc, msg) do
        try do
          if msg.bonus == nil do
            acc
          else
            [acc, ":", Protox.Encode.encode_message(msg.bonus)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bonus, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_unlocked_craft(acc, msg) do
        try do
          case msg.unlocked_craft do
            [] ->
              acc

            values ->
              [
                acc,
                "B",
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
            reraise Protox.EncodingError.new(:unlocked_craft, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_craft_pool(acc, msg) do
        try do
          case msg.craft_pool do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "J", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:craft_pool, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_order_pool(acc, msg) do
        try do
          case msg.order_pool do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "R", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:order_pool, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ActivityCombiningData))
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
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 workbench:
                   msg.workbench ++
                     [Soulless.Game.Lq.ActivityCombiningWorkbench.decode!(delimited)]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 orders:
                   msg.orders ++ [Soulless.Game.Lq.ActivityCombiningOrderData.decode!(delimited)]
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 recycle_bin:
                   Protox.MergeMessage.merge(
                     msg.recycle_bin,
                     Soulless.Game.Lq.ActivityCombiningWorkbench.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 menu:
                   Protox.MergeMessage.merge(
                     msg.menu,
                     Soulless.Game.Lq.ActivityCombiningMenuData.decode!(delimited)
                   )
               ], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[current_order_id: value], rest}

            {7, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 bonus:
                   Protox.MergeMessage.merge(
                     msg.bonus,
                     Soulless.Game.Lq.ActivityCombiningData.BonusData.decode!(delimited)
                   )
               ], rest}

            {8, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 unlocked_craft:
                   msg.unlocked_craft ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[unlocked_craft: msg.unlocked_craft ++ [value]], rest}

            {9, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 craft_pool:
                   msg.craft_pool ++
                     [Soulless.Game.Lq.ActivityCombiningPoolData.decode!(delimited)]
               ], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 order_pool:
                   msg.order_pool ++
                     [Soulless.Game.Lq.ActivityCombiningPoolData.decode!(delimited)]
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
        Soulless.Game.Lq.ActivityCombiningData,
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
        2 => {:workbench, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}},
        3 => {:orders, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningOrderData}},
        4 =>
          {:recycle_bin, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}},
        5 => {:menu, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningMenuData}},
        6 => {:current_order_id, {:scalar, 0}, :uint32},
        7 =>
          {:bonus, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningData.BonusData}},
        8 => {:unlocked_craft, :packed, :uint32},
        9 => {:craft_pool, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningPoolData}},
        10 => {:order_pool, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningPoolData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        activity_id: {1, {:scalar, 0}, :uint32},
        bonus: {7, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningData.BonusData}},
        craft_pool: {9, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningPoolData}},
        current_order_id: {6, {:scalar, 0}, :uint32},
        menu: {5, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningMenuData}},
        order_pool: {10, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningPoolData}},
        orders: {3, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningOrderData}},
        recycle_bin: {4, {:scalar, nil}, {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}},
        unlocked_craft: {8, :packed, :uint32},
        workbench: {2, :unpacked, {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}}
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
          json_name: "workbench",
          kind: :unpacked,
          label: :repeated,
          name: :workbench,
          tag: 2,
          type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
        },
        %{
          __struct__: Protox.Field,
          json_name: "orders",
          kind: :unpacked,
          label: :repeated,
          name: :orders,
          tag: 3,
          type: {:message, Soulless.Game.Lq.ActivityCombiningOrderData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "recycleBin",
          kind: {:scalar, nil},
          label: :optional,
          name: :recycle_bin,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
        },
        %{
          __struct__: Protox.Field,
          json_name: "menu",
          kind: {:scalar, nil},
          label: :optional,
          name: :menu,
          tag: 5,
          type: {:message, Soulless.Game.Lq.ActivityCombiningMenuData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "currentOrderId",
          kind: {:scalar, 0},
          label: :optional,
          name: :current_order_id,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "bonus",
          kind: {:scalar, nil},
          label: :optional,
          name: :bonus,
          tag: 7,
          type: {:message, Soulless.Game.Lq.ActivityCombiningData.BonusData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "unlockedCraft",
          kind: :packed,
          label: :repeated,
          name: :unlocked_craft,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "craftPool",
          kind: :unpacked,
          label: :repeated,
          name: :craft_pool,
          tag: 9,
          type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "orderPool",
          kind: :unpacked,
          label: :repeated,
          name: :order_pool,
          tag: 10,
          type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
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
        def field_def(:workbench) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "workbench",
             kind: :unpacked,
             label: :repeated,
             name: :workbench,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
           }}
        end

        def field_def("workbench") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "workbench",
             kind: :unpacked,
             label: :repeated,
             name: :workbench,
             tag: 2,
             type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
           }}
        end

        []
      ),
      (
        def field_def(:orders) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orders",
             kind: :unpacked,
             label: :repeated,
             name: :orders,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ActivityCombiningOrderData}
           }}
        end

        def field_def("orders") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orders",
             kind: :unpacked,
             label: :repeated,
             name: :orders,
             tag: 3,
             type: {:message, Soulless.Game.Lq.ActivityCombiningOrderData}
           }}
        end

        []
      ),
      (
        def field_def(:recycle_bin) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recycleBin",
             kind: {:scalar, nil},
             label: :optional,
             name: :recycle_bin,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
           }}
        end

        def field_def("recycleBin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recycleBin",
             kind: {:scalar, nil},
             label: :optional,
             name: :recycle_bin,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
           }}
        end

        def field_def("recycle_bin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recycleBin",
             kind: {:scalar, nil},
             label: :optional,
             name: :recycle_bin,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ActivityCombiningWorkbench}
           }}
        end
      ),
      (
        def field_def(:menu) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "menu",
             kind: {:scalar, nil},
             label: :optional,
             name: :menu,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ActivityCombiningMenuData}
           }}
        end

        def field_def("menu") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "menu",
             kind: {:scalar, nil},
             label: :optional,
             name: :menu,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ActivityCombiningMenuData}
           }}
        end

        []
      ),
      (
        def field_def(:current_order_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOrderId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_order_id,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("currentOrderId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOrderId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_order_id,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("current_order_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currentOrderId",
             kind: {:scalar, 0},
             label: :optional,
             name: :current_order_id,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:bonus) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bonus",
             kind: {:scalar, nil},
             label: :optional,
             name: :bonus,
             tag: 7,
             type: {:message, Soulless.Game.Lq.ActivityCombiningData.BonusData}
           }}
        end

        def field_def("bonus") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bonus",
             kind: {:scalar, nil},
             label: :optional,
             name: :bonus,
             tag: 7,
             type: {:message, Soulless.Game.Lq.ActivityCombiningData.BonusData}
           }}
        end

        []
      ),
      (
        def field_def(:unlocked_craft) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlockedCraft",
             kind: :packed,
             label: :repeated,
             name: :unlocked_craft,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("unlockedCraft") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlockedCraft",
             kind: :packed,
             label: :repeated,
             name: :unlocked_craft,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("unlocked_craft") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "unlockedCraft",
             kind: :packed,
             label: :repeated,
             name: :unlocked_craft,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:craft_pool) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "craftPool",
             kind: :unpacked,
             label: :repeated,
             name: :craft_pool,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
           }}
        end

        def field_def("craftPool") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "craftPool",
             kind: :unpacked,
             label: :repeated,
             name: :craft_pool,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
           }}
        end

        def field_def("craft_pool") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "craftPool",
             kind: :unpacked,
             label: :repeated,
             name: :craft_pool,
             tag: 9,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
           }}
        end
      ),
      (
        def field_def(:order_pool) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderPool",
             kind: :unpacked,
             label: :repeated,
             name: :order_pool,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
           }}
        end

        def field_def("orderPool") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderPool",
             kind: :unpacked,
             label: :repeated,
             name: :order_pool,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
           }}
        end

        def field_def("order_pool") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "orderPool",
             kind: :unpacked,
             label: :repeated,
             name: :order_pool,
             tag: 10,
             type: {:message, Soulless.Game.Lq.ActivityCombiningPoolData}
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
    def default(:workbench) do
      {:error, :no_default_value}
    end,
    def default(:orders) do
      {:error, :no_default_value}
    end,
    def default(:recycle_bin) do
      {:ok, nil}
    end,
    def default(:menu) do
      {:ok, nil}
    end,
    def default(:current_order_id) do
      {:ok, 0}
    end,
    def default(:bonus) do
      {:ok, nil}
    end,
    def default(:unlocked_craft) do
      {:error, :no_default_value}
    end,
    def default(:craft_pool) do
      {:error, :no_default_value}
    end,
    def default(:order_pool) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end