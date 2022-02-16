# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.AchievementProgress do
  @moduledoc false
  defstruct id: 0, counter: 0, achieved: false, rewarded: false, achieved_time: 0, __uf__: []

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
        |> encode_id(msg)
        |> encode_counter(msg)
        |> encode_achieved(msg)
        |> encode_rewarded(msg)
        |> encode_achieved_time(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_id(acc, msg) do
        try do
          if msg.id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_counter(acc, msg) do
        try do
          if msg.counter == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.counter)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:counter, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_achieved(acc, msg) do
        try do
          if msg.achieved == false do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_bool(msg.achieved)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:achieved, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rewarded(acc, msg) do
        try do
          if msg.rewarded == false do
            acc
          else
            [acc, " ", Protox.Encode.encode_bool(msg.rewarded)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rewarded, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_achieved_time(acc, msg) do
        try do
          if msg.achieved_time == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.achieved_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:achieved_time, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Tourney.Lq.AchievementProgress))
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
              {[id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[counter: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[achieved: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[rewarded: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[achieved_time: value], rest}

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
        Soulless.Tourney.Lq.AchievementProgress,
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
        1 => {:id, {:scalar, 0}, :uint32},
        2 => {:counter, {:scalar, 0}, :uint32},
        3 => {:achieved, {:scalar, false}, :bool},
        4 => {:rewarded, {:scalar, false}, :bool},
        5 => {:achieved_time, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        achieved: {3, {:scalar, false}, :bool},
        achieved_time: {5, {:scalar, 0}, :uint32},
        counter: {2, {:scalar, 0}, :uint32},
        id: {1, {:scalar, 0}, :uint32},
        rewarded: {4, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "id",
          kind: {:scalar, 0},
          label: :optional,
          name: :id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "counter",
          kind: {:scalar, 0},
          label: :optional,
          name: :counter,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "achieved",
          kind: {:scalar, false},
          label: :optional,
          name: :achieved,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewarded",
          kind: {:scalar, false},
          label: :optional,
          name: :rewarded,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "achievedTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :achieved_time,
          tag: 5,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "id",
             kind: {:scalar, 0},
             label: :optional,
             name: :id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "id",
             kind: {:scalar, 0},
             label: :optional,
             name: :id,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:counter) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "counter",
             kind: {:scalar, 0},
             label: :optional,
             name: :counter,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("counter") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "counter",
             kind: {:scalar, 0},
             label: :optional,
             name: :counter,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:achieved) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achieved",
             kind: {:scalar, false},
             label: :optional,
             name: :achieved,
             tag: 3,
             type: :bool
           }}
        end

        def field_def("achieved") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achieved",
             kind: {:scalar, false},
             label: :optional,
             name: :achieved,
             tag: 3,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:rewarded) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewarded",
             kind: {:scalar, false},
             label: :optional,
             name: :rewarded,
             tag: 4,
             type: :bool
           }}
        end

        def field_def("rewarded") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewarded",
             kind: {:scalar, false},
             label: :optional,
             name: :rewarded,
             tag: 4,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:achieved_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievedTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :achieved_time,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("achievedTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievedTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :achieved_time,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("achieved_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "achievedTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :achieved_time,
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
    def default(:id) do
      {:ok, 0}
    end,
    def default(:counter) do
      {:ok, 0}
    end,
    def default(:achieved) do
      {:ok, false}
    end,
    def default(:rewarded) do
      {:ok, false}
    end,
    def default(:achieved_time) do
      {:ok, 0}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end