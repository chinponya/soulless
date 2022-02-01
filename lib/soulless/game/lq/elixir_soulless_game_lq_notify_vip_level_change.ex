# credo:disable-for-this-file
defmodule Soulless.Game.Lq.NotifyVipLevelChange do
  @moduledoc false
  defstruct gift_limit: 0,
            friend_max_count: 0,
            zhp_free_refresh_limit: 0,
            zhp_cost_refresh_limit: 0,
            buddy_bonus: 0.0,
            record_collect_limit: 0,
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
        |> encode_gift_limit(msg)
        |> encode_friend_max_count(msg)
        |> encode_zhp_free_refresh_limit(msg)
        |> encode_zhp_cost_refresh_limit(msg)
        |> encode_buddy_bonus(msg)
        |> encode_record_collect_limit(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_gift_limit(acc, msg) do
        try do
          if msg.gift_limit == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.gift_limit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:gift_limit, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_friend_max_count(acc, msg) do
        try do
          if msg.friend_max_count == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.friend_max_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:friend_max_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_zhp_free_refresh_limit(acc, msg) do
        try do
          if msg.zhp_free_refresh_limit == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.zhp_free_refresh_limit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:zhp_free_refresh_limit, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_zhp_cost_refresh_limit(acc, msg) do
        try do
          if msg.zhp_cost_refresh_limit == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.zhp_cost_refresh_limit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:zhp_cost_refresh_limit, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_buddy_bonus(acc, msg) do
        try do
          if msg.buddy_bonus == 0.0 do
            acc
          else
            [acc, "-", Protox.Encode.encode_float(msg.buddy_bonus)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:buddy_bonus, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_record_collect_limit(acc, msg) do
        try do
          if msg.record_collect_limit == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.record_collect_limit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:record_collect_limit, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.NotifyVipLevelChange))
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
              {[gift_limit: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[friend_max_count: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[zhp_free_refresh_limit: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[zhp_cost_refresh_limit: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_float(bytes)
              {[buddy_bonus: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[record_collect_limit: value], rest}

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
        Soulless.Game.Lq.NotifyVipLevelChange,
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
        1 => {:gift_limit, {:scalar, 0}, :uint32},
        2 => {:friend_max_count, {:scalar, 0}, :uint32},
        3 => {:zhp_free_refresh_limit, {:scalar, 0}, :uint32},
        4 => {:zhp_cost_refresh_limit, {:scalar, 0}, :uint32},
        5 => {:buddy_bonus, {:scalar, 0.0}, :float},
        6 => {:record_collect_limit, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        buddy_bonus: {5, {:scalar, 0.0}, :float},
        friend_max_count: {2, {:scalar, 0}, :uint32},
        gift_limit: {1, {:scalar, 0}, :uint32},
        record_collect_limit: {6, {:scalar, 0}, :uint32},
        zhp_cost_refresh_limit: {4, {:scalar, 0}, :uint32},
        zhp_free_refresh_limit: {3, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "giftLimit",
          kind: {:scalar, 0},
          label: :optional,
          name: :gift_limit,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "friendMaxCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :friend_max_count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhpFreeRefreshLimit",
          kind: {:scalar, 0},
          label: :optional,
          name: :zhp_free_refresh_limit,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "zhpCostRefreshLimit",
          kind: {:scalar, 0},
          label: :optional,
          name: :zhp_cost_refresh_limit,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buddyBonus",
          kind: {:scalar, 0.0},
          label: :optional,
          name: :buddy_bonus,
          tag: 5,
          type: :float
        },
        %{
          __struct__: Protox.Field,
          json_name: "recordCollectLimit",
          kind: {:scalar, 0},
          label: :optional,
          name: :record_collect_limit,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:gift_limit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :gift_limit,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("giftLimit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :gift_limit,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("gift_limit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "giftLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :gift_limit,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:friend_max_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendMaxCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :friend_max_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("friendMaxCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendMaxCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :friend_max_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("friend_max_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "friendMaxCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :friend_max_count,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:zhp_free_refresh_limit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpFreeRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_free_refresh_limit,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("zhpFreeRefreshLimit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpFreeRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_free_refresh_limit,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("zhp_free_refresh_limit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpFreeRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_free_refresh_limit,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:zhp_cost_refresh_limit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpCostRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_cost_refresh_limit,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("zhpCostRefreshLimit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpCostRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_cost_refresh_limit,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("zhp_cost_refresh_limit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "zhpCostRefreshLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :zhp_cost_refresh_limit,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:buddy_bonus) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buddyBonus",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :buddy_bonus,
             tag: 5,
             type: :float
           }}
        end

        def field_def("buddyBonus") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buddyBonus",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :buddy_bonus,
             tag: 5,
             type: :float
           }}
        end

        def field_def("buddy_bonus") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buddyBonus",
             kind: {:scalar, 0.0},
             label: :optional,
             name: :buddy_bonus,
             tag: 5,
             type: :float
           }}
        end
      ),
      (
        def field_def(:record_collect_limit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recordCollectLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :record_collect_limit,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("recordCollectLimit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recordCollectLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :record_collect_limit,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("record_collect_limit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "recordCollectLimit",
             kind: {:scalar, 0},
             label: :optional,
             name: :record_collect_limit,
             tag: 6,
             type: :uint32
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
    def default(:gift_limit) do
      {:ok, 0}
    end,
    def default(:friend_max_count) do
      {:ok, 0}
    end,
    def default(:zhp_free_refresh_limit) do
      {:ok, 0}
    end,
    def default(:zhp_cost_refresh_limit) do
      {:ok, 0}
    end,
    def default(:buddy_bonus) do
      {:ok, 0.0}
    end,
    def default(:record_collect_limit) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end