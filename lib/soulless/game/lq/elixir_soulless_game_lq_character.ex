# credo:disable-for-this-file
defmodule Soulless.Game.Lq.Character do
  @moduledoc false
  defstruct charid: 0,
            level: 0,
            exp: 0,
            views: [],
            skin: 0,
            is_upgraded: false,
            extra_emoji: [],
            rewarded_level: [],
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
        |> encode_charid(msg)
        |> encode_level(msg)
        |> encode_exp(msg)
        |> encode_views(msg)
        |> encode_skin(msg)
        |> encode_is_upgraded(msg)
        |> encode_extra_emoji(msg)
        |> encode_rewarded_level(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_charid(acc, msg) do
        try do
          if msg.charid == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.charid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:charid, "invalid field value"), __STACKTRACE__
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
      defp encode_exp(acc, msg) do
        try do
          if msg.exp == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.exp)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:exp, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_views(acc, msg) do
        try do
          case msg.views do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\"", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:views, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_skin(acc, msg) do
        try do
          if msg.skin == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.skin)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:skin, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_is_upgraded(acc, msg) do
        try do
          if msg.is_upgraded == false do
            acc
          else
            [acc, "0", Protox.Encode.encode_bool(msg.is_upgraded)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:is_upgraded, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_extra_emoji(acc, msg) do
        try do
          case msg.extra_emoji do
            [] ->
              acc

            values ->
              [
                acc,
                ":",
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
            reraise Protox.EncodingError.new(:extra_emoji, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rewarded_level(acc, msg) do
        try do
          case msg.rewarded_level do
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
            reraise Protox.EncodingError.new(:rewarded_level, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.Character))
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
              {[charid: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[level: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[exp: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[views: msg.views ++ [Soulless.Game.Lq.ViewSlot.decode!(delimited)]], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[skin: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[is_upgraded: value], rest}

            {7, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 extra_emoji:
                   msg.extra_emoji ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[extra_emoji: msg.extra_emoji ++ [value]], rest}

            {8, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 rewarded_level:
                   msg.rewarded_level ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rewarded_level: msg.rewarded_level ++ [value]], rest}

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
        Soulless.Game.Lq.Character,
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
        1 => {:charid, {:scalar, 0}, :uint32},
        2 => {:level, {:scalar, 0}, :uint32},
        3 => {:exp, {:scalar, 0}, :uint32},
        4 => {:views, :unpacked, {:message, Soulless.Game.Lq.ViewSlot}},
        5 => {:skin, {:scalar, 0}, :uint32},
        6 => {:is_upgraded, {:scalar, false}, :bool},
        7 => {:extra_emoji, :packed, :uint32},
        8 => {:rewarded_level, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        charid: {1, {:scalar, 0}, :uint32},
        exp: {3, {:scalar, 0}, :uint32},
        extra_emoji: {7, :packed, :uint32},
        is_upgraded: {6, {:scalar, false}, :bool},
        level: {2, {:scalar, 0}, :uint32},
        rewarded_level: {8, :packed, :uint32},
        skin: {5, {:scalar, 0}, :uint32},
        views: {4, :unpacked, {:message, Soulless.Game.Lq.ViewSlot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "charid",
          kind: {:scalar, 0},
          label: :optional,
          name: :charid,
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
          json_name: "exp",
          kind: {:scalar, 0},
          label: :optional,
          name: :exp,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "views",
          kind: :unpacked,
          label: :repeated,
          name: :views,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ViewSlot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "skin",
          kind: {:scalar, 0},
          label: :optional,
          name: :skin,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isUpgraded",
          kind: {:scalar, false},
          label: :optional,
          name: :is_upgraded,
          tag: 6,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "extraEmoji",
          kind: :packed,
          label: :repeated,
          name: :extra_emoji,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewardedLevel",
          kind: :packed,
          label: :repeated,
          name: :rewarded_level,
          tag: 8,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:charid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "charid",
             kind: {:scalar, 0},
             label: :optional,
             name: :charid,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("charid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "charid",
             kind: {:scalar, 0},
             label: :optional,
             name: :charid,
             tag: 1,
             type: :uint32
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
        def field_def(:exp) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exp",
             kind: {:scalar, 0},
             label: :optional,
             name: :exp,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("exp") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exp",
             kind: {:scalar, 0},
             label: :optional,
             name: :exp,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:views) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "views",
             kind: :unpacked,
             label: :repeated,
             name: :views,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ViewSlot}
           }}
        end

        def field_def("views") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "views",
             kind: :unpacked,
             label: :repeated,
             name: :views,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ViewSlot}
           }}
        end

        []
      ),
      (
        def field_def(:skin) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skin",
             kind: {:scalar, 0},
             label: :optional,
             name: :skin,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("skin") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "skin",
             kind: {:scalar, 0},
             label: :optional,
             name: :skin,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:is_upgraded) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isUpgraded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_upgraded,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("isUpgraded") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isUpgraded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_upgraded,
             tag: 6,
             type: :bool
           }}
        end

        def field_def("is_upgraded") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isUpgraded",
             kind: {:scalar, false},
             label: :optional,
             name: :is_upgraded,
             tag: 6,
             type: :bool
           }}
        end
      ),
      (
        def field_def(:extra_emoji) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraEmoji",
             kind: :packed,
             label: :repeated,
             name: :extra_emoji,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("extraEmoji") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraEmoji",
             kind: :packed,
             label: :repeated,
             name: :extra_emoji,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("extra_emoji") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "extraEmoji",
             kind: :packed,
             label: :repeated,
             name: :extra_emoji,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:rewarded_level) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedLevel",
             kind: :packed,
             label: :repeated,
             name: :rewarded_level,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("rewardedLevel") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedLevel",
             kind: :packed,
             label: :repeated,
             name: :rewarded_level,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("rewarded_level") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedLevel",
             kind: :packed,
             label: :repeated,
             name: :rewarded_level,
             tag: 8,
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
    def default(:charid) do
      {:ok, 0}
    end,
    def default(:level) do
      {:ok, 0}
    end,
    def default(:exp) do
      {:ok, 0}
    end,
    def default(:views) do
      {:error, :no_default_value}
    end,
    def default(:skin) do
      {:ok, 0}
    end,
    def default(:is_upgraded) do
      {:ok, false}
    end,
    def default(:extra_emoji) do
      {:error, :no_default_value}
    end,
    def default(:rewarded_level) do
      {:error, :no_default_value}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end