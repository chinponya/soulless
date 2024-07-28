# credo:disable-for-this-file
defmodule Soulless.Game.Lq.AccountResourceSnapshot do
  @moduledoc false
  defstruct bag_item: [],
            currency: [],
            title: nil,
            used_title: nil,
            currency_convert: 0,
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
        |> encode_bag_item(msg)
        |> encode_currency(msg)
        |> encode_title(msg)
        |> encode_used_title(msg)
        |> encode_currency_convert(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_bag_item(acc, msg) do
        try do
          case msg.bag_item do
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
            reraise Protox.EncodingError.new(:bag_item, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_currency(acc, msg) do
        try do
          case msg.currency do
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
            reraise Protox.EncodingError.new(:currency, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_title(acc, msg) do
        try do
          if msg.title == nil do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_message(msg.title)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:title, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_used_title(acc, msg) do
        try do
          if msg.used_title == nil do
            acc
          else
            [acc, "\"", Protox.Encode.encode_message(msg.used_title)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:used_title, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_currency_convert(acc, msg) do
        try do
          if msg.currency_convert == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.currency_convert)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:currency_convert, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.AccountResourceSnapshot))
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
                 bag_item:
                   msg.bag_item ++
                     [Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot.decode!(delimited)]
               ], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 currency:
                   msg.currency ++
                     [
                       Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot.decode!(
                         delimited
                       )
                     ]
               ], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 title:
                   Protox.MergeMessage.merge(
                     msg.title,
                     Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot.decode!(delimited)
                   )
               ], rest}

            {4, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

              {[
                 used_title:
                   Protox.MergeMessage.merge(
                     msg.used_title,
                     Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot.decode!(delimited)
                   )
               ], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[currency_convert: value], rest}

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
        Soulless.Game.Lq.AccountResourceSnapshot,
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
        1 =>
          {:bag_item, :unpacked,
           {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}},
        2 =>
          {:currency, :unpacked,
           {:message, Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot}},
        3 =>
          {:title, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot}},
        4 =>
          {:used_title, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}},
        5 => {:currency_convert, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        bag_item:
          {1, :unpacked, {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}},
        currency:
          {2, :unpacked, {:message, Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot}},
        currency_convert: {5, {:scalar, 0}, :uint32},
        title:
          {3, {:scalar, nil}, {:message, Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot}},
        used_title:
          {4, {:scalar, nil},
           {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "bagItem",
          kind: :unpacked,
          label: :repeated,
          name: :bag_item,
          tag: 1,
          type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "currency",
          kind: :unpacked,
          label: :repeated,
          name: :currency,
          tag: 2,
          type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "title",
          kind: {:scalar, nil},
          label: :optional,
          name: :title,
          tag: 3,
          type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "usedTitle",
          kind: {:scalar, nil},
          label: :optional,
          name: :used_title,
          tag: 4,
          type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "currencyConvert",
          kind: {:scalar, 0},
          label: :optional,
          name: :currency_convert,
          tag: 5,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:bag_item) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagItem",
             kind: :unpacked,
             label: :repeated,
             name: :bag_item,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}
           }}
        end

        def field_def("bagItem") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagItem",
             kind: :unpacked,
             label: :repeated,
             name: :bag_item,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}
           }}
        end

        def field_def("bag_item") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "bagItem",
             kind: :unpacked,
             label: :repeated,
             name: :bag_item,
             tag: 1,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.BagItemSnapshot}
           }}
        end
      ),
      (
        def field_def(:currency) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currency",
             kind: :unpacked,
             label: :repeated,
             name: :currency,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot}
           }}
        end

        def field_def("currency") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currency",
             kind: :unpacked,
             label: :repeated,
             name: :currency,
             tag: 2,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.CurrencySnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:title) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, nil},
             label: :optional,
             name: :title,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot}
           }}
        end

        def field_def("title") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "title",
             kind: {:scalar, nil},
             label: :optional,
             name: :title,
             tag: 3,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.TitleSnapshot}
           }}
        end

        []
      ),
      (
        def field_def(:used_title) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usedTitle",
             kind: {:scalar, nil},
             label: :optional,
             name: :used_title,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}
           }}
        end

        def field_def("usedTitle") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usedTitle",
             kind: {:scalar, nil},
             label: :optional,
             name: :used_title,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}
           }}
        end

        def field_def("used_title") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "usedTitle",
             kind: {:scalar, nil},
             label: :optional,
             name: :used_title,
             tag: 4,
             type: {:message, Soulless.Game.Lq.AccountResourceSnapshot.UsedTitleSnapshot}
           }}
        end
      ),
      (
        def field_def(:currency_convert) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyConvert",
             kind: {:scalar, 0},
             label: :optional,
             name: :currency_convert,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("currencyConvert") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyConvert",
             kind: {:scalar, 0},
             label: :optional,
             name: :currency_convert,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("currency_convert") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "currencyConvert",
             kind: {:scalar, 0},
             label: :optional,
             name: :currency_convert,
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
    def default(:bag_item) do
      {:error, :no_default_value}
    end,
    def default(:currency) do
      {:error, :no_default_value}
    end,
    def default(:title) do
      {:ok, nil}
    end,
    def default(:used_title) do
      {:ok, nil}
    end,
    def default(:currency_convert) do
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
