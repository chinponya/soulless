# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResOpenChest do
  @moduledoc false
  (
    defstruct error: nil,
              results: [],
              total_open_count: 0,
              faith_count: 0,
              chest_replace_up: [],
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
          |> encode_error(msg)
          |> encode_results(msg)
          |> encode_total_open_count(msg)
          |> encode_faith_count(msg)
          |> encode_chest_replace_up(msg)
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
        defp encode_results(acc, msg) do
          try do
            case msg.results do
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
              reraise Protox.EncodingError.new(:results, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_total_open_count(acc, msg) do
          try do
            if msg.total_open_count == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.total_open_count)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:total_open_count, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_faith_count(acc, msg) do
          try do
            if msg.faith_count == 0 do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.faith_count)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:faith_count, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_chest_replace_up(acc, msg) do
          try do
            case msg.chest_replace_up do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "*", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:chest_replace_up, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Game.Lq.ResOpenChest))
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
                     Protox.MergeMessage.merge(
                       msg.error,
                       Soulless.Game.Lq.Error.decode!(delimited)
                     )
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[results: msg.results ++ [Soulless.Game.Lq.OpenResult.decode!(delimited)]], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[total_open_count: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[faith_count: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   chest_replace_up:
                     msg.chest_replace_up ++
                       [Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData.decode!(delimited)]
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
          Soulless.Game.Lq.ResOpenChest,
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

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs() do
      %{
        1 => {:error, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        2 => {:results, :unpacked, {:message, Soulless.Game.Lq.OpenResult}},
        3 => {:total_open_count, {:scalar, 0}, :uint32},
        4 => {:faith_count, {:scalar, 0}, :uint32},
        5 =>
          {:chest_replace_up, :unpacked,
           {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        chest_replace_up:
          {5, :unpacked, {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}},
        error: {1, {:scalar, nil}, {:message, Soulless.Game.Lq.Error}},
        faith_count: {4, {:scalar, 0}, :uint32},
        results: {2, :unpacked, {:message, Soulless.Game.Lq.OpenResult}},
        total_open_count: {3, {:scalar, 0}, :uint32}
      }
    end

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
          json_name: "results",
          kind: :unpacked,
          label: :repeated,
          name: :results,
          tag: 2,
          type: {:message, Soulless.Game.Lq.OpenResult}
        },
        %{
          __struct__: Protox.Field,
          json_name: "totalOpenCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :total_open_count,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "faithCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :faith_count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "chestReplaceUp",
          kind: :unpacked,
          label: :repeated,
          name: :chest_replace_up,
          tag: 5,
          type: {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}
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
        def field_def(:results) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "results",
             kind: :unpacked,
             label: :repeated,
             name: :results,
             tag: 2,
             type: {:message, Soulless.Game.Lq.OpenResult}
           }}
        end

        def field_def("results") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "results",
             kind: :unpacked,
             label: :repeated,
             name: :results,
             tag: 2,
             type: {:message, Soulless.Game.Lq.OpenResult}
           }}
        end

        []
      ),
      (
        def field_def(:total_open_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalOpenCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_open_count,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("totalOpenCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalOpenCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_open_count,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("total_open_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "totalOpenCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :total_open_count,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:faith_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :faith_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("faithCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :faith_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("faith_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "faithCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :faith_count,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:chest_replace_up) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestReplaceUp",
             kind: :unpacked,
             label: :repeated,
             name: :chest_replace_up,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}
           }}
        end

        def field_def("chestReplaceUp") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestReplaceUp",
             kind: :unpacked,
             label: :repeated,
             name: :chest_replace_up,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}
           }}
        end

        def field_def("chest_replace_up") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestReplaceUp",
             kind: :unpacked,
             label: :repeated,
             name: :chest_replace_up,
             tag: 5,
             type: {:message, Soulless.Game.Lq.ResOpenChest.ChestReplaceCountData}
           }}
        end
      ),
      def field_def(_) do
        {:error, :no_such_field}
      end
    ]

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

    @spec required_fields() :: []
    def required_fields() do
      []
    end

    @spec syntax() :: atom
    def syntax() do
      :proto3
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def default(:error) do
        {:ok, nil}
      end,
      def default(:results) do
        {:error, :no_default_value}
      end,
      def default(:total_open_count) do
        {:ok, 0}
      end,
      def default(:faith_count) do
        {:ok, 0}
      end,
      def default(:chest_replace_up) do
        {:error, :no_default_value}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end