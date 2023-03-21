# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ActivityFriendGiftData.CountWithTimeData do
  @moduledoc false
  defstruct count: 0, last_update_time: 0, send_friend_id: [], __uf__: []

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
        |> encode_count(msg)
        |> encode_last_update_time(msg)
        |> encode_send_friend_id(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_count(acc, msg) do
        try do
          if msg.count == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_last_update_time(acc, msg) do
        try do
          if msg.last_update_time == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.last_update_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:last_update_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_send_friend_id(acc, msg) do
        try do
          case msg.send_friend_id do
            [] ->
              acc

            values ->
              [
                acc,
                "\x1A",
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
            reraise Protox.EncodingError.new(:send_friend_id, "invalid field value"),
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
          parse_key_value(
            bytes,
            struct(Soulless.Game.Lq.ActivityFriendGiftData.CountWithTimeData)
          )
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
              {[count: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[last_update_time: value], rest}

            {3, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 send_friend_id:
                   msg.send_friend_id ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[send_friend_id: msg.send_friend_id ++ [value]], rest}

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
        Soulless.Game.Lq.ActivityFriendGiftData.CountWithTimeData,
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
        1 => {:count, {:scalar, 0}, :uint32},
        2 => {:last_update_time, {:scalar, 0}, :uint32},
        3 => {:send_friend_id, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        count: {1, {:scalar, 0}, :uint32},
        last_update_time: {2, {:scalar, 0}, :uint32},
        send_friend_id: {3, :packed, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "count",
          kind: {:scalar, 0},
          label: :optional,
          name: :count,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "lastUpdateTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :last_update_time,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "sendFriendId",
          kind: :packed,
          label: :repeated,
          name: :send_friend_id,
          tag: 3,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "count",
             kind: {:scalar, 0},
             label: :optional,
             name: :count,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:last_update_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastUpdateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_update_time,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("lastUpdateTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastUpdateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_update_time,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("last_update_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "lastUpdateTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :last_update_time,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:send_friend_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sendFriendId",
             kind: :packed,
             label: :repeated,
             name: :send_friend_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("sendFriendId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sendFriendId",
             kind: :packed,
             label: :repeated,
             name: :send_friend_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("send_friend_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "sendFriendId",
             kind: :packed,
             label: :repeated,
             name: :send_friend_id,
             tag: 3,
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
    def default(:count) do
      {:ok, 0}
    end,
    def default(:last_update_time) do
      {:ok, 0}
    end,
    def default(:send_friend_id) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end