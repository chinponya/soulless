# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResRichmanNextMove do
  @moduledoc false
  defstruct paths: [],
            dice: 0,
            location: 0,
            finished_count: 0,
            step: 0,
            buff: [],
            bank_save: 0,
            chest_position: 0,
            exp: 0,
            bank_save_add: 0,
            error: nil,
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
        |> encode_paths(msg)
        |> encode_dice(msg)
        |> encode_location(msg)
        |> encode_finished_count(msg)
        |> encode_step(msg)
        |> encode_buff(msg)
        |> encode_bank_save(msg)
        |> encode_chest_position(msg)
        |> encode_exp(msg)
        |> encode_bank_save_add(msg)
        |> encode_error(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_paths(acc, msg) do
        try do
          case msg.paths do
            [] ->
              acc

            values ->
              [
                acc,
                Enum.reduce(values, [], fn value, acc ->
                  [acc, "\n", Protox.Encode.encode_message(value)]
                end)
              ]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:paths, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_dice(acc, msg) do
        try do
          if msg.dice == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.dice)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:dice, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_finished_count(acc, msg) do
        try do
          if msg.finished_count == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.finished_count)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:finished_count, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_step(acc, msg) do
        try do
          if msg.step == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.step)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:step, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_buff(acc, msg) do
        try do
          case msg.buff do
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
            reraise Protox.EncodingError.new(:buff, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bank_save(acc, msg) do
        try do
          if msg.bank_save == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.bank_save)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bank_save, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_chest_position(acc, msg) do
        try do
          if msg.chest_position == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.chest_position)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:chest_position, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_exp(acc, msg) do
        try do
          if msg.exp == 0 do
            acc
          else
            [acc, "H", Protox.Encode.encode_uint32(msg.exp)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:exp, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_bank_save_add(acc, msg) do
        try do
          if msg.bank_save_add == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.bank_save_add)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:bank_save_add, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_error(acc, msg) do
        try do
          if msg.error == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.error)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResRichmanNextMove))
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
                 paths:
                   msg.paths ++ [Soulless.Game.Lq.ResRichmanNextMove.PathData.decode!(delimited)]
               ], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[dice: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[location: value], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[finished_count: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[step: value], rest}

            {6, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 buff:
                   msg.buff ++ [Soulless.Game.Lq.ResRichmanNextMove.BuffData.decode!(delimited)]
               ], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[bank_save: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[chest_position: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[exp: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[bank_save_add: value], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 error:
                   Protox.MergeMessage.merge(msg.error, Soulless.Game.Lq.Error.decode!(delimited))
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
        Soulless.Game.Lq.ResRichmanNextMove,
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
        1 => {:paths, :unpacked, {:message, Soulless.Game.Lq.ResRichmanNextMove.PathData}},
        2 => {:dice, {:scalar, 0}, :uint32},
        3 => {:location, {:scalar, 0}, :uint32},
        4 => {:finished_count, {:scalar, 0}, :uint32},
        5 => {:step, {:scalar, 0}, :uint32},
        6 => {:buff, :unpacked, {:message, Soulless.Game.Lq.ResRichmanNextMove.BuffData}},
        7 => {:bank_save, {:scalar, 0}, :uint32},
        8 => {:chest_position, {:scalar, 0}, :uint32},
        9 => {:exp, {:scalar, 0}, :uint32},
        10 => {:bank_save_add, {:scalar, 0}, :uint32},
        11 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        bank_save: {7, {:scalar, 0}, :uint32},
        bank_save_add: {10, {:scalar, 0}, :uint32},
        buff: {6, :unpacked, {:message, Soulless.Game.Lq.ResRichmanNextMove.BuffData}},
        chest_position: {8, {:scalar, 0}, :uint32},
        dice: {2, {:scalar, 0}, :uint32},
        error: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        exp: {9, {:scalar, 0}, :uint32},
        finished_count: {4, {:scalar, 0}, :uint32},
        location: {3, {:scalar, 0}, :uint32},
        paths: {1, :unpacked, {:message, Soulless.Game.Lq.ResRichmanNextMove.PathData}},
        step: {5, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "paths",
          kind: :unpacked,
          label: :repeated,
          name: :paths,
          tag: 1,
          type: {:message, Soulless.Game.Lq.ResRichmanNextMove.PathData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "dice",
          kind: {:scalar, 0},
          label: :optional,
          name: :dice,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, 0},
          label: :optional,
          name: :location,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "finishedCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :finished_count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "step",
          kind: {:scalar, 0},
          label: :optional,
          name: :step,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "buff",
          kind: :unpacked,
          label: :repeated,
          name: :buff,
          tag: 6,
          type: {:message, Soulless.Game.Lq.ResRichmanNextMove.BuffData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "bankSave",
          kind: {:scalar, 0},
          label: :optional,
          name: :bank_save,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "chestPosition",
          kind: {:scalar, 0},
          label: :optional,
          name: :chest_position,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "exp",
          kind: {:scalar, 0},
          label: :optional,
          name: :exp,
          tag: 9,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "bankSaveAdd",
          kind: {:scalar, 0},
          label: :optional,
          name: :bank_save_add,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 11,
          type: {:message, Soulless.Game.Lq.Error}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:paths) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paths",
             kind: :unpacked,
             label: :repeated,
             name: :paths,
             tag: 1,
             type: {:message, Soulless.Game.Lq.ResRichmanNextMove.PathData}
           }}
        end

        def field_def("paths") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "paths",
             kind: :unpacked,
             label: :repeated,
             name: :paths,
             tag: 1,
             type: {:message, Soulless.Game.Lq.ResRichmanNextMove.PathData}
           }}
        end

        []
      ),
      (
        def field_def(:dice) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dice",
             kind: {:scalar, 0},
             label: :optional,
             name: :dice,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("dice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "dice",
             kind: {:scalar, 0},
             label: :optional,
             name: :dice,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, 0},
             label: :optional,
             name: :location,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:finished_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :finished_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("finishedCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :finished_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("finished_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishedCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :finished_count,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:step) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "step",
             kind: {:scalar, 0},
             label: :optional,
             name: :step,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("step") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "step",
             kind: {:scalar, 0},
             label: :optional,
             name: :step,
             tag: 5,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:buff) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buff",
             kind: :unpacked,
             label: :repeated,
             name: :buff,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ResRichmanNextMove.BuffData}
           }}
        end

        def field_def("buff") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "buff",
             kind: :unpacked,
             label: :repeated,
             name: :buff,
             tag: 6,
             type: {:message, Soulless.Game.Lq.ResRichmanNextMove.BuffData}
           }}
        end

        []
      ),
      (
        def field_def(:bank_save) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSave",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("bankSave") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSave",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("bank_save") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSave",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:chest_position) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestPosition",
             kind: {:scalar, 0},
             label: :optional,
             name: :chest_position,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("chestPosition") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestPosition",
             kind: {:scalar, 0},
             label: :optional,
             name: :chest_position,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("chest_position") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestPosition",
             kind: {:scalar, 0},
             label: :optional,
             name: :chest_position,
             tag: 8,
             type: :uint32
           }}
        end
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
             tag: 9,
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
             tag: 9,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:bank_save_add) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSaveAdd",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save_add,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("bankSaveAdd") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSaveAdd",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save_add,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("bank_save_add") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bankSaveAdd",
             kind: {:scalar, 0},
             label: :optional,
             name: :bank_save_add,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:error) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 11,
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
             tag: 11,
             type: {:message, Soulless.Game.Lq.Error}
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
    def default(:paths) do
      {:error, :no_default_value}
    end,
    def default(:dice) do
      {:ok, 0}
    end,
    def default(:location) do
      {:ok, 0}
    end,
    def default(:finished_count) do
      {:ok, 0}
    end,
    def default(:step) do
      {:ok, 0}
    end,
    def default(:buff) do
      {:error, :no_default_value}
    end,
    def default(:bank_save) do
      {:ok, 0}
    end,
    def default(:chest_position) do
      {:ok, 0}
    end,
    def default(:exp) do
      {:ok, 0}
    end,
    def default(:bank_save_add) do
      {:ok, 0}
    end,
    def default(:error) do
      {:ok, nil}
    end,
    def default(_) do
      {:error, :no_such_field}
    end
  ]
end