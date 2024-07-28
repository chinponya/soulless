# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResResolveFestivalActivityProposal do
  @moduledoc false
  defstruct error: nil, effected_buff: [], result: 0, reward_items: [], level: 0, __uf__: []

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
        |> encode_error(msg)
        |> encode_effected_buff(msg)
        |> encode_result(msg)
        |> encode_reward_items(msg)
        |> encode_level(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "\n", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_effected_buff(acc, msg) do
        try do
          case msg.effected_buff do
            [] ->
              acc

            values ->
              [
                acc,
                "\x12",
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
            reraise Protox.EncodingError.new(:effected_buff, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_result(acc, msg) do
        try do
          if msg.result == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.result)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:result, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_reward_items(acc, msg) do
        try do
          case msg.reward_items do
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
            reraise Protox.EncodingError.new(:reward_items, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_level(acc, msg) do
        try do
          if msg.level == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.level)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:level, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResResolveFestivalActivityProposal))
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
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
               ], rest}

            {2, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 effected_buff:
                   msg.effected_buff ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[effected_buff: msg.effected_buff ++ [value]], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[result: value], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 reward_items:
                   msg.reward_items ++ [Soulless.Game.Lq.ExecuteResult.decode!(delimited)]
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[level: value], rest}

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
        Soulless.Game.Lq.ResResolveFestivalActivityProposal,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:effected_buff, :packed, :uint32},
        3 => {:result, {:scalar, 0}, :uint32},
        4 => {:reward_items, :unpacked, {:message, Soulless.Game.Lq.ExecuteResult}},
        5 => {:level, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        effected_buff: {2, :packed, :uint32},
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        level: {5, {:scalar, 0}, :uint32},
        result: {3, {:scalar, 0}, :uint32},
        reward_items: {4, :unpacked, {:message, Soulless.Game.Lq.ExecuteResult}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Game.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "effectedBuff",
          kind: :packed,
          label: :repeated,
          name: :effected_buff,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "result",
          kind: {:scalar, 0},
          label: :optional,
          name: :result,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewardItems",
          kind: :unpacked,
          label: :repeated,
          name: :reward_items,
          tag: 4,
          type: {:message, Soulless.Game.Lq.ExecuteResult}
        },
        %{
          __struct__: Protox.Field,
          json_name: "level",
          kind: {:scalar, 0},
          label: :optional,
          name: :level,
          tag: 5,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        def field_def("error") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Game.Lq.Error}
           }}
        end

        []
      ),
      (
        def field_def(:effected_buff) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "effectedBuff",
             kind: :packed,
             label: :repeated,
             name: :effected_buff,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("effectedBuff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "effectedBuff",
             kind: :packed,
             label: :repeated,
             name: :effected_buff,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("effected_buff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "effectedBuff",
             kind: :packed,
             label: :repeated,
             name: :effected_buff,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:result) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, 0},
             label: :optional,
             name: :result,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("result") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "result",
             kind: {:scalar, 0},
             label: :optional,
             name: :result,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:reward_items) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardItems",
             kind: :unpacked,
             label: :repeated,
             name: :reward_items,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ExecuteResult}
           }}
        end

        def field_def("rewardItems") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardItems",
             kind: :unpacked,
             label: :repeated,
             name: :reward_items,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ExecuteResult}
           }}
        end

        def field_def("reward_items") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardItems",
             kind: :unpacked,
             label: :repeated,
             name: :reward_items,
             tag: 4,
             type: {:message, Soulless.Game.Lq.ExecuteResult}
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
             tag: 5,
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
             tag: 5,
             type: :uint32
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
    def default(:error) do
      {:ok, nil}
    end,
    def default(:effected_buff) do
      {:error, :no_default_value}
    end,
    def default(:result) do
      {:ok, 0}
    end,
    def default(:reward_items) do
      {:error, :no_default_value}
    end,
    def default(:level) do
      {:ok, 0}
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
