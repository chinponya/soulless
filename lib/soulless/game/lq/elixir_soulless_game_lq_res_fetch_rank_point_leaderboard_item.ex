# credo:disable-for-this-file
defmodule Soulless.Game.Lq.ResFetchRankPointLeaderboard.Item do
  @moduledoc false
  defstruct account_id: 0, rank: 0, view: nil, point: 0, __uf__: []

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
        |> encode_account_id(msg)
        |> encode_rank(msg)
        |> encode_view(msg)
        |> encode_point(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_account_id(acc, msg) do
        try do
          if msg.account_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.account_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:account_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_rank(acc, msg) do
        try do
          if msg.rank == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.rank)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:rank, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_view(acc, msg) do
        try do
          if msg.view == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.view)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:view, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.ResFetchRankPointLeaderboard.Item))
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
              {[account_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[rank: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 view:
                   Protox.MergeMessage.merge(
                     msg.view,
                     Soulless.Game.Lq.PlayerBaseView.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[point: value], rest}

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
        Soulless.Game.Lq.ResFetchRankPointLeaderboard.Item,
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
        1 => {:account_id, {:scalar, 0}, :uint32},
        2 => {:rank, {:scalar, 0}, :uint32},
        3 => {:view, {:scalar, nil}, {:message, Soulless.Game.Lq.PlayerBaseView}},
        4 => {:point, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        account_id: {1, {:scalar, 0}, :uint32},
        point: {4, {:scalar, 0}, :uint32},
        rank: {2, {:scalar, 0}, :uint32},
        view: {3, {:scalar, nil}, {:message, Soulless.Game.Lq.PlayerBaseView}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rank",
          kind: {:scalar, 0},
          label: :optional,
          name: :rank,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "view",
          kind: {:scalar, nil},
          label: :optional,
          name: :view,
          tag: 3,
          type: {:message, Soulless.Game.Lq.PlayerBaseView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "point",
          kind: {:scalar, 0},
          label: :optional,
          name: :point,
          tag: 4,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:account_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("accountId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("account_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:rank) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rank",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("rank") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rank",
             kind: {:scalar, 0},
             label: :optional,
             name: :rank,
             tag: 2,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:view) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "view",
             kind: {:scalar, nil},
             label: :optional,
             name: :view,
             tag: 3,
             type: {:message, Soulless.Game.Lq.PlayerBaseView}
           }}
        end

        def field_def("view") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "view",
             kind: {:scalar, nil},
             label: :optional,
             name: :view,
             tag: 3,
             type: {:message, Soulless.Game.Lq.PlayerBaseView}
           }}
        end

        []
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
    def default(:account_id) do
      {:ok, 0}
    end,
    def default(:rank) do
      {:ok, 0}
    end,
    def default(:view) do
      {:ok, nil}
    end,
    def default(:point) do
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
