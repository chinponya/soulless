# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate do
  @moduledoc false
  defstruct match_id: 0,
            match_count: 0,
            buy_in_count: 0,
            point: 0,
            rewarded: false,
            match_max_point: [],
            quit: false,
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
        |> encode_match_id(msg)
        |> encode_match_count(msg)
        |> encode_buy_in_count(msg)
        |> encode_point(msg)
        |> encode_rewarded(msg)
        |> encode_match_max_point(msg)
        |> encode_quit(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_match_id(acc, msg) do
        try do
          if msg.match_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.match_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:match_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_match_count(acc, msg) do
        try do
          if msg.match_count == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.match_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:match_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_buy_in_count(acc, msg) do
        try do
          if msg.buy_in_count == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.buy_in_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:buy_in_count, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_point(acc, msg) do
        try do
          if msg.point == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.point)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:point, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rewarded(acc, msg) do
        try do
          if msg.rewarded == false do
            acc
          else
            [acc, "(", Protox.Encode.encode_bool(msg.rewarded)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rewarded, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_match_max_point(acc, msg) do
        try do
          case msg.match_max_point do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "2", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:match_max_point, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_quit(acc, msg) do
        try do
          if msg.quit == false do
            acc
          else
            [acc, "8", Protox.Encode.encode_bool(msg.quit)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:quit, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate))
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
              {[match_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[match_count: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[buy_in_count: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[point: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[rewarded: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 match_max_point:
                   msg.match_max_point ++
                     [
                       Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint.decode!(
                         delimited
                       )
                     ]
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[quit: value], rest}

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
        Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate,
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
        1 => {:match_id, {:scalar, 0}, :uint32},
        2 => {:match_count, {:scalar, 0}, :uint32},
        3 => {:buy_in_count, {:scalar, 0}, :uint32},
        4 => {:point, {:scalar, 0}, :uint32},
        5 => {:rewarded, {:scalar, false}, :bool},
        6 =>
          {:match_max_point, :unpacked,
           {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}},
        7 => {:quit, {:scalar, false}, :bool}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        buy_in_count: {3, {:scalar, 0}, :uint32},
        match_count: {2, {:scalar, 0}, :uint32},
        match_id: {1, {:scalar, 0}, :uint32},
        match_max_point:
          {6, :unpacked,
           {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}},
        point: {4, {:scalar, 0}, :uint32},
        quit: {7, {:scalar, false}, :bool},
        rewarded: {5, {:scalar, false}, :bool}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "matchId",
          kind: {:scalar, 0},
          label: :optional,
          name: :match_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "matchCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :match_count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buyInCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :buy_in_count,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "point",
          kind: {:scalar, 0},
          label: :optional,
          name: :point,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewarded",
          kind: {:scalar, false},
          label: :optional,
          name: :rewarded,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "matchMaxPoint",
          kind: :unpacked,
          label: :repeated,
          name: :match_max_point,
          tag: 6,
          type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}
        },
        %{
          __struct__: Protox.Field,
          json_name: "quit",
          kind: {:scalar, false},
          label: :optional,
          name: :quit,
          tag: 7,
          type: :bool
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:match_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("matchId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("match_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:match_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("matchCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_count,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("match_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_count,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:buy_in_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyInCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :buy_in_count,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("buyInCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyInCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :buy_in_count,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("buy_in_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buyInCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :buy_in_count,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:point) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "point",
             kind: {:scalar, 0},
             label: :optional,
             name: :point,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("point") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "point",
             kind: {:scalar, 0},
             label: :optional,
             name: :point,
             tag: 4,
             type: :uint32
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
             tag: 5,
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
             tag: 5,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:match_max_point) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchMaxPoint",
             kind: :unpacked,
             label: :repeated,
             name: :match_max_point,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}
           }}
        end

        def field_def("matchMaxPoint") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchMaxPoint",
             kind: :unpacked,
             label: :repeated,
             name: :match_max_point,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}
           }}
        end

        def field_def("match_max_point") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchMaxPoint",
             kind: :unpacked,
             label: :repeated,
             name: :match_max_point,
             tag: 6,
             type: {:message, Soulless.Game.Lq.AccountUpdate.AccountABMatchUpdate.MatchPoint}
           }}
        end
      ),
      (
        def field_def(:quit) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quit",
             kind: {:scalar, false},
             label: :optional,
             name: :quit,
             tag: 7,
             type: :bool
           }}
        end

        def field_def("quit") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "quit",
             kind: {:scalar, false},
             label: :optional,
             name: :quit,
             tag: 7,
             type: :bool
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
    def default(:match_id) do
      {:ok, 0}
    end,
    def default(:match_count) do
      {:ok, 0}
    end,
    def default(:buy_in_count) do
      {:ok, 0}
    end,
    def default(:point) do
      {:ok, 0}
    end,
    def default(:rewarded) do
      {:ok, false}
    end,
    def default(:match_max_point) do
      {:error, :no_default_value}
    end,
    def default(:quit) do
      {:ok, false}
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
