# credo:disable-for-this-file
defmodule Soulless.Game.Lq.NotifyMatchGameStart do
  @moduledoc false
  defstruct game_url: "",
            connect_token: "",
            game_uuid: "",
            match_mode_id: 0,
            location: "",
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
        |> encode_game_url(msg)
        |> encode_connect_token(msg)
        |> encode_game_uuid(msg)
        |> encode_match_mode_id(msg)
        |> encode_location(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_game_url(acc, msg) do
        try do
          if msg.game_url == "" do
            acc
          else
            [acc, "\n", Protox.Encode.encode_string(msg.game_url)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_url, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_connect_token(acc, msg) do
        try do
          if msg.connect_token == "" do
            acc
          else
            [acc, "\x12", Protox.Encode.encode_string(msg.connect_token)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:connect_token, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_game_uuid(acc, msg) do
        try do
          if msg.game_uuid == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.game_uuid)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:game_uuid, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_match_mode_id(acc, msg) do
        try do
          if msg.match_mode_id == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.match_mode_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:match_mode_id, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_location(acc, msg) do
        try do
          if msg.location == "" do
            acc
          else
            [acc, "*", Protox.Encode.encode_string(msg.location)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:location, "invalid field value"), __STACKTRACE__
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.NotifyMatchGameStart))
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
              {[game_url: Protox.Decode.validate_string(delimited)], rest}

            {2, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[connect_token: Protox.Decode.validate_string(delimited)], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[game_uuid: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[match_mode_id: value], rest}

            {5, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[location: Protox.Decode.validate_string(delimited)], rest}

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
        Soulless.Game.Lq.NotifyMatchGameStart,
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
        1 => {:game_url, {:scalar, ""}, :string},
        2 => {:connect_token, {:scalar, ""}, :string},
        3 => {:game_uuid, {:scalar, ""}, :string},
        4 => {:match_mode_id, {:scalar, 0}, :uint32},
        5 => {:location, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        connect_token: {2, {:scalar, ""}, :string},
        game_url: {1, {:scalar, ""}, :string},
        game_uuid: {3, {:scalar, ""}, :string},
        location: {5, {:scalar, ""}, :string},
        match_mode_id: {4, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "gameUrl",
          kind: {:scalar, ""},
          label: :optional,
          name: :game_url,
          tag: 1,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "connectToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :connect_token,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameUuid",
          kind: {:scalar, ""},
          label: :optional,
          name: :game_uuid,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "matchModeId",
          kind: {:scalar, 0},
          label: :optional,
          name: :match_mode_id,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "location",
          kind: {:scalar, ""},
          label: :optional,
          name: :location,
          tag: 5,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:game_url) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_url,
             tag: 1,
             type: :string
           }}
        end

        def field_def("gameUrl") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_url,
             tag: 1,
             type: :string
           }}
        end

        def field_def("game_url") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUrl",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_url,
             tag: 1,
             type: :string
           }}
        end
      ),
      (
        def field_def(:connect_token) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "connectToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :connect_token,
             tag: 2,
             type: :string
           }}
        end

        def field_def("connectToken") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "connectToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :connect_token,
             tag: 2,
             type: :string
           }}
        end

        def field_def("connect_token") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "connectToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :connect_token,
             tag: 2,
             type: :string
           }}
        end
      ),
      (
        def field_def(:game_uuid) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 3,
             type: :string
           }}
        end

        def field_def("gameUuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 3,
             type: :string
           }}
        end

        def field_def("game_uuid") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameUuid",
             kind: {:scalar, ""},
             label: :optional,
             name: :game_uuid,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:match_mode_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchModeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_mode_id,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("matchModeId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchModeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_mode_id,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("match_mode_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "matchModeId",
             kind: {:scalar, 0},
             label: :optional,
             name: :match_mode_id,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:location) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, ""},
             label: :optional,
             name: :location,
             tag: 5,
             type: :string
           }}
        end

        def field_def("location") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "location",
             kind: {:scalar, ""},
             label: :optional,
             name: :location,
             tag: 5,
             type: :string
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
    def default(:game_url) do
      {:ok, ""}
    end,
    def default(:connect_token) do
      {:ok, ""}
    end,
    def default(:game_uuid) do
      {:ok, ""}
    end,
    def default(:match_mode_id) do
      {:ok, 0}
    end,
    def default(:location) do
      {:ok, ""}
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
