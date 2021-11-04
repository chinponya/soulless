# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.ActivityArenaData) do
  @moduledoc false
  (
    defstruct(
      win_count: 0,
      lose_count: 0,
      activity_id: 0,
      enter_time: 0,
      daily_enter_count: 0,
      daily_enter_time: 0,
      max_win_count: 0,
      total_win_count: 0,
      __uf__: []
    )

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          []
          |> encode_win_count(msg)
          |> encode_lose_count(msg)
          |> encode_activity_id(msg)
          |> encode_enter_time(msg)
          |> encode_daily_enter_count(msg)
          |> encode_daily_enter_time(msg)
          |> encode_max_win_count(msg)
          |> encode_total_win_count(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_win_count(acc, msg)) do
          try do
            if(msg.win_count == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.win_count)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:win_count, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_lose_count(acc, msg)) do
          try do
            if(msg.lose_count == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.lose_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:lose_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_activity_id(acc, msg)) do
          try do
            if(msg.activity_id == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.activity_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:activity_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_enter_time(acc, msg)) do
          try do
            if(msg.enter_time == 0) do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.enter_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:enter_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_daily_enter_count(acc, msg)) do
          try do
            if(msg.daily_enter_count == 0) do
              acc
            else
              [acc, "(", Protox.Encode.encode_uint32(msg.daily_enter_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:daily_enter_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_daily_enter_time(acc, msg)) do
          try do
            if(msg.daily_enter_time == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.daily_enter_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:daily_enter_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_max_win_count(acc, msg)) do
          try do
            if(msg.max_win_count == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.max_win_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:max_win_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_total_win_count(acc, msg)) do
          try do
            if(msg.total_win_count == 0) do
              acc
            else
              [acc, "@", Protox.Encode.encode_uint32(msg.total_win_count)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:total_win_count, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      defp(encode_unknown_fields(acc, msg)) do
        Enum.reduce(msg.__struct__.unknown_fields(msg), acc, fn {tag, wire_type, bytes}, acc ->
          case(wire_type) do
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
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(Soulless.Game.Lq.ActivityArenaData))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[win_count: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[lose_count: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[activity_id: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[enter_time: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[daily_enter_count: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[daily_enter_time: value], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[max_win_count: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[total_win_count: value], rest}

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
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          Soulless.Game.Lq.ActivityArenaData,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:win_count, {:scalar, 0}, :uint32},
        2 => {:lose_count, {:scalar, 0}, :uint32},
        3 => {:activity_id, {:scalar, 0}, :uint32},
        4 => {:enter_time, {:scalar, 0}, :uint32},
        5 => {:daily_enter_count, {:scalar, 0}, :uint32},
        6 => {:daily_enter_time, {:scalar, 0}, :uint32},
        7 => {:max_win_count, {:scalar, 0}, :uint32},
        8 => {:total_win_count, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        activity_id: {3, {:scalar, 0}, :uint32},
        daily_enter_count: {5, {:scalar, 0}, :uint32},
        daily_enter_time: {6, {:scalar, 0}, :uint32},
        enter_time: {4, {:scalar, 0}, :uint32},
        lose_count: {2, {:scalar, 0}, :uint32},
        max_win_count: {7, {:scalar, 0}, :uint32},
        total_win_count: {8, {:scalar, 0}, :uint32},
        win_count: {1, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "winCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :win_count,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "loseCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :lose_count,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "activityId",
          kind: {:scalar, 0},
          label: :optional,
          name: :activity_id,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "enterTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :enter_time,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "dailyEnterCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :daily_enter_count,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "dailyEnterTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :daily_enter_time,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "maxWinCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :max_win_count,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "totalWinCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_win_count,
          tag: 8,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:win_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :win_count,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("winCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :win_count,
             tag: 1,
             type: :uint32
           }}
        end

        def(field_def("win_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "winCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :win_count,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:lose_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loseCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :lose_count,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("loseCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loseCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :lose_count,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("lose_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loseCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :lose_count,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:activity_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("activityId")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("activity_id")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "activityId",
             kind: {:scalar, 0},
             label: :optional,
             name: :activity_id,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:enter_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :enter_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("enterTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :enter_time,
             tag: 4,
             type: :uint32
           }}
        end

        def(field_def("enter_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "enterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :enter_time,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:daily_enter_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_count,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("dailyEnterCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_count,
             tag: 5,
             type: :uint32
           }}
        end

        def(field_def("daily_enter_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_count,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:daily_enter_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_time,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("dailyEnterTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_time,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("daily_enter_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dailyEnterTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :daily_enter_time,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:max_win_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_win_count,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("maxWinCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_win_count,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("max_win_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "maxWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :max_win_count,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:total_win_count)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_win_count,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("totalWinCount")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_win_count,
             tag: 8,
             type: :uint32
           }}
        end

        def(field_def("total_win_count")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalWinCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_win_count,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    (
      @spec unknown_fields(struct) :: [{non_neg_integer, Protox.Types.tag(), binary}]
      def(unknown_fields(msg)) do
        msg.__uf__
      end

      @spec unknown_fields_name() :: :__uf__
      def(unknown_fields_name()) do
        :__uf__
      end

      @spec clear_unknown_fields(struct) :: struct
      def(clear_unknown_fields(msg)) do
        struct!(msg, [{unknown_fields_name(), []}])
      end
    )

    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:win_count)) do
        {:ok, 0}
      end,
      def(default(:lose_count)) do
        {:ok, 0}
      end,
      def(default(:activity_id)) do
        {:ok, 0}
      end,
      def(default(:enter_time)) do
        {:ok, 0}
      end,
      def(default(:daily_enter_count)) do
        {:ok, 0}
      end,
      def(default(:daily_enter_time)) do
        {:ok, 0}
      end,
      def(default(:max_win_count)) do
        {:ok, 0}
      end,
      def(default(:total_win_count)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end