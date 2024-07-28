# credo:disable-for-this-file
defmodule Soulless.Game.Lq.GameUserInput do
  @moduledoc false
  defstruct seat: 0, type: 0, emo: 0, operation: nil, cpg: nil, vote: nil, __uf__: []

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
        |> encode_seat(msg)
        |> encode_type(msg)
        |> encode_emo(msg)
        |> encode_operation(msg)
        |> encode_cpg(msg)
        |> encode_vote(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_seat(acc, msg) do
        try do
          if msg.seat == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.seat)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:seat, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_type(acc, msg) do
        try do
          if msg.type == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_emo(acc, msg) do
        try do
          if msg.emo == 0 do
            acc
          else
            [acc, "\x18", Protox.Encode.encode_uint32(msg.emo)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:emo, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_operation(acc, msg) do
        try do
          if msg.operation == nil do
            acc
          else
            [acc, "R", Protox.Encode.encode_message(msg.operation)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:operation, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_cpg(acc, msg) do
        try do
          if msg.cpg == nil do
            acc
          else
            [acc, "Z", Protox.Encode.encode_message(msg.cpg)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:cpg, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_vote(acc, msg) do
        try do
          if msg.vote == nil do
            acc
          else
            [acc, "b", Protox.Encode.encode_message(msg.vote)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:vote, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.GameUserInput))
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
              {[seat: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[type: value], rest}

            {3, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[emo: value], rest}

            {10, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 operation:
                   Protox.MergeMessage.merge(
                     msg.operation,
                     Soulless.Game.Lq.GameSelfOperation.decode!(delimited)
                   )
               ], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 cpg:
                   Protox.MergeMessage.merge(
                     msg.cpg,
                     Soulless.Game.Lq.GameChiPengGang.decode!(delimited)
                   )
               ], rest}

            {12, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 vote:
                   Protox.MergeMessage.merge(
                     msg.vote,
                     Soulless.Game.Lq.GameVoteGameEnd.decode!(delimited)
                   )
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
        Soulless.Game.Lq.GameUserInput,
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
        1 => {:seat, {:scalar, 0}, :uint32},
        2 => {:type, {:scalar, 0}, :uint32},
        3 => {:emo, {:scalar, 0}, :uint32},
        10 => {:operation, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSelfOperation}},
        11 => {:cpg, {:scalar, nil}, {:message, Soulless.Game.Lq.GameChiPengGang}},
        12 => {:vote, {:scalar, nil}, {:message, Soulless.Game.Lq.GameVoteGameEnd}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        cpg: {11, {:scalar, nil}, {:message, Soulless.Game.Lq.GameChiPengGang}},
        emo: {3, {:scalar, 0}, :uint32},
        operation: {10, {:scalar, nil}, {:message, Soulless.Game.Lq.GameSelfOperation}},
        seat: {1, {:scalar, 0}, :uint32},
        type: {2, {:scalar, 0}, :uint32},
        vote: {12, {:scalar, nil}, {:message, Soulless.Game.Lq.GameVoteGameEnd}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "seat",
          kind: {:scalar, 0},
          label: :optional,
          name: :seat,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "type",
          kind: {:scalar, 0},
          label: :optional,
          name: :type,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "emo",
          kind: {:scalar, 0},
          label: :optional,
          name: :emo,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "operation",
          kind: {:scalar, nil},
          label: :optional,
          name: :operation,
          tag: 10,
          type: {:message, Soulless.Game.Lq.GameSelfOperation}
        },
        %{
          __struct__: Protox.Field,
          json_name: "cpg",
          kind: {:scalar, nil},
          label: :optional,
          name: :cpg,
          tag: 11,
          type: {:message, Soulless.Game.Lq.GameChiPengGang}
        },
        %{
          __struct__: Protox.Field,
          json_name: "vote",
          kind: {:scalar, nil},
          label: :optional,
          name: :vote,
          tag: 12,
          type: {:message, Soulless.Game.Lq.GameVoteGameEnd}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:seat) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("seat") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seat",
             kind: {:scalar, 0},
             label: :optional,
             name: :seat,
             tag: 1,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "type",
             kind: {:scalar, 0},
             label: :optional,
             name: :type,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:emo) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emo",
             kind: {:scalar, 0},
             label: :optional,
             name: :emo,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("emo") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "emo",
             kind: {:scalar, 0},
             label: :optional,
             name: :emo,
             tag: 3,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:operation) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 10,
             type: {:message, Soulless.Game.Lq.GameSelfOperation}
           }}
        end

        def field_def("operation") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "operation",
             kind: {:scalar, nil},
             label: :optional,
             name: :operation,
             tag: 10,
             type: {:message, Soulless.Game.Lq.GameSelfOperation}
           }}
        end

        []
      ),
      (
        def field_def(:cpg) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cpg",
             kind: {:scalar, nil},
             label: :optional,
             name: :cpg,
             tag: 11,
             type: {:message, Soulless.Game.Lq.GameChiPengGang}
           }}
        end

        def field_def("cpg") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "cpg",
             kind: {:scalar, nil},
             label: :optional,
             name: :cpg,
             tag: 11,
             type: {:message, Soulless.Game.Lq.GameChiPengGang}
           }}
        end

        []
      ),
      (
        def field_def(:vote) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vote",
             kind: {:scalar, nil},
             label: :optional,
             name: :vote,
             tag: 12,
             type: {:message, Soulless.Game.Lq.GameVoteGameEnd}
           }}
        end

        def field_def("vote") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "vote",
             kind: {:scalar, nil},
             label: :optional,
             name: :vote,
             tag: 12,
             type: {:message, Soulless.Game.Lq.GameVoteGameEnd}
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
    def default(:seat) do
      {:ok, 0}
    end,
    def default(:type) do
      {:ok, 0}
    end,
    def default(:emo) do
      {:ok, 0}
    end,
    def default(:operation) do
      {:ok, nil}
    end,
    def default(:cpg) do
      {:ok, nil}
    end,
    def default(:vote) do
      {:ok, nil}
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
