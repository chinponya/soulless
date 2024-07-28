# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ReqCreateGamePlan do
  @moduledoc false
  defstruct unique_id: 0,
            account_list: [],
            game_start_time: 0,
            shuffle_seats: 0,
            ai_level: 0,
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
        |> encode_unique_id(msg)
        |> encode_account_list(msg)
        |> encode_game_start_time(msg)
        |> encode_shuffle_seats(msg)
        |> encode_ai_level(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_unique_id(acc, msg) do
        try do
          if msg.unique_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.unique_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_account_list(acc, msg) do
        try do
          case msg.account_list do
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
            reraise Protox.EncodingError.new(:account_list, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_game_start_time(acc, msg) do
        try do
          if msg.game_start_time == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.game_start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_start_time, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_shuffle_seats(acc, msg) do
        try do
          if msg.shuffle_seats == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.shuffle_seats)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:shuffle_seats, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_ai_level(acc, msg) do
        try do
          if msg.ai_level == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.ai_level)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:ai_level, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ReqCreateGamePlan))
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
              {[unique_id: value], rest}

            {2, 2, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 account_list:
                   msg.account_list ++ Protox.Decode.parse_repeated_uint32([], delimited)
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[account_list: msg.account_list ++ [value]], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[game_start_time: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[shuffle_seats: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[ai_level: value], rest}

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
        Soulless.Game.Lq.ReqCreateGamePlan,
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
        1 => {:unique_id, {:scalar, 0}, :uint32},
        2 => {:account_list, :packed, :uint32},
        3 => {:game_start_time, {:scalar, 0}, :uint32},
        4 => {:shuffle_seats, {:scalar, 0}, :uint32},
        5 => {:ai_level, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_list: {2, :packed, :uint32},
        ai_level: {5, {:scalar, 0}, :uint32},
        game_start_time: {3, {:scalar, 0}, :uint32},
        shuffle_seats: {4, {:scalar, 0}, :uint32},
        unique_id: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "uniqueId",
          kind: {:scalar, 0},
          label: :optional,
          name: :unique_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountList",
          kind: :packed,
          label: :repeated,
          name: :account_list,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameStartTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :game_start_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "shuffleSeats",
          kind: {:scalar, 0},
          label: :optional,
          name: :shuffle_seats,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "aiLevel",
          kind: {:scalar, 0},
          label: :optional,
          name: :ai_level,
          tag: 5,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:unique_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("uniqueId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("unique_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:account_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountList",
             kind: :packed,
             label: :repeated,
             name: :account_list,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("accountList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountList",
             kind: :packed,
             label: :repeated,
             name: :account_list,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("account_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountList",
             kind: :packed,
             label: :repeated,
             name: :account_list,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:game_start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_start_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("gameStartTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_start_time,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("game_start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameStartTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :game_start_time,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:shuffle_seats) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shuffleSeats",
             kind: {:scalar, 0},
             label: :optional,
             name: :shuffle_seats,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("shuffleSeats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shuffleSeats",
             kind: {:scalar, 0},
             label: :optional,
             name: :shuffle_seats,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("shuffle_seats") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "shuffleSeats",
             kind: {:scalar, 0},
             label: :optional,
             name: :shuffle_seats,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:ai_level) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("aiLevel") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("ai_level") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 5,
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
    def default(:unique_id) do
      {:ok, 0}
    end,
    def default(:account_list) do
      {:error, :no_default_value}
    end,
    def default(:game_start_time) do
      {:ok, 0}
    end,
    def default(:shuffle_seats) do
      {:ok, 0}
    end,
    def default(:ai_level) do
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
