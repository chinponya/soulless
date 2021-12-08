# credo:disable-for-this-file
defmodule Soulless.Tourney.Lq.NotifyRoomPlayerUpdate do
  @moduledoc false
  (
    defstruct update_list: [],
              remove_list: [],
              owner_id: 0,
              robot_count: 0,
              player_list: [],
              seq: 0,
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
          |> encode_update_list(msg)
          |> encode_remove_list(msg)
          |> encode_owner_id(msg)
          |> encode_robot_count(msg)
          |> encode_player_list(msg)
          |> encode_seq(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp encode_update_list(acc, msg) do
          try do
            case msg.update_list do
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
              reraise Protox.EncodingError.new(:update_list, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_remove_list(acc, msg) do
          try do
            case msg.remove_list do
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
              reraise Protox.EncodingError.new(:remove_list, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_owner_id(acc, msg) do
          try do
            if msg.owner_id == 0 do
              acc
            else
              [acc, "\x18", Protox.Encode.encode_uint32(msg.owner_id)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:owner_id, "invalid field value"), __STACKTRACE__
          end
        end,
        defp encode_robot_count(acc, msg) do
          try do
            if msg.robot_count == 0 do
              acc
            else
              [acc, " ", Protox.Encode.encode_uint32(msg.robot_count)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:robot_count, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_player_list(acc, msg) do
          try do
            case msg.player_list do
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
              reraise Protox.EncodingError.new(:player_list, "invalid field value"),
                      __STACKTRACE__
          end
        end,
        defp encode_seq(acc, msg) do
          try do
            if msg.seq == 0 do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.seq)]
            end
          rescue
            ArgumentError ->
              reraise Protox.EncodingError.new(:seq, "invalid field value"), __STACKTRACE__
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.NotifyRoomPlayerUpdate))
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
                   update_list:
                     msg.update_list ++ [Soulless.Tourney.Lq.PlayerBaseView.decode!(delimited)]
                 ], rest}

              {2, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   remove_list:
                     msg.remove_list ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[remove_list: msg.remove_list ++ [value]], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[owner_id: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[robot_count: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   player_list:
                     msg.player_list ++ [Soulless.Tourney.Lq.PlayerBaseView.decode!(delimited)]
                 ], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[seq: value], rest}

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
          Soulless.Tourney.Lq.NotifyRoomPlayerUpdate,
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
        1 => {:update_list, :unpacked, {:message, Soulless.Tourney.Lq.PlayerBaseView}},
        2 => {:remove_list, :packed, :uint32},
        3 => {:owner_id, {:scalar, 0}, :uint32},
        4 => {:robot_count, {:scalar, 0}, :uint32},
        5 => {:player_list, :unpacked, {:message, Soulless.Tourney.Lq.PlayerBaseView}},
        6 => {:seq, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        owner_id: {3, {:scalar, 0}, :uint32},
        player_list: {5, :unpacked, {:message, Soulless.Tourney.Lq.PlayerBaseView}},
        remove_list: {2, :packed, :uint32},
        robot_count: {4, {:scalar, 0}, :uint32},
        seq: {6, {:scalar, 0}, :uint32},
        update_list: {1, :unpacked, {:message, Soulless.Tourney.Lq.PlayerBaseView}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "updateList",
          kind: :unpacked,
          label: :repeated,
          name: :update_list,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "removeList",
          kind: :packed,
          label: :repeated,
          name: :remove_list,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "ownerId",
          kind: {:scalar, 0},
          label: :optional,
          name: :owner_id,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "robotCount",
          kind: {:scalar, 0},
          label: :optional,
          name: :robot_count,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "playerList",
          kind: :unpacked,
          label: :repeated,
          name: :player_list,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
        },
        %{
          __struct__: Protox.Field,
          json_name: "seq",
          kind: {:scalar, 0},
          label: :optional,
          name: :seq,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:update_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateList",
             kind: :unpacked,
             label: :repeated,
             name: :update_list,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end

        def field_def("updateList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateList",
             kind: :unpacked,
             label: :repeated,
             name: :update_list,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end

        def field_def("update_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "updateList",
             kind: :unpacked,
             label: :repeated,
             name: :update_list,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end
      ),
      (
        def field_def(:remove_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeList",
             kind: :packed,
             label: :repeated,
             name: :remove_list,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("removeList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeList",
             kind: :packed,
             label: :repeated,
             name: :remove_list,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("remove_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "removeList",
             kind: :packed,
             label: :repeated,
             name: :remove_list,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:owner_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("ownerId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 3,
             type: :uint32
           }}
        end

        def field_def("owner_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "ownerId",
             kind: {:scalar, 0},
             label: :optional,
             name: :owner_id,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:robot_count) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("robotCount") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("robot_count") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "robotCount",
             kind: {:scalar, 0},
             label: :optional,
             name: :robot_count,
             tag: 4,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:player_list) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerList",
             kind: :unpacked,
             label: :repeated,
             name: :player_list,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end

        def field_def("playerList") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerList",
             kind: :unpacked,
             label: :repeated,
             name: :player_list,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end

        def field_def("player_list") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playerList",
             kind: :unpacked,
             label: :repeated,
             name: :player_list,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.PlayerBaseView}
           }}
        end
      ),
      (
        def field_def(:seq) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seq",
             kind: {:scalar, 0},
             label: :optional,
             name: :seq,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("seq") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "seq",
             kind: {:scalar, 0},
             label: :optional,
             name: :seq,
             tag: 6,
             type: :uint32
           }}
        end

        []
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
      def default(:update_list) do
        {:error, :no_default_value}
      end,
      def default(:remove_list) do
        {:error, :no_default_value}
      end,
      def default(:owner_id) do
        {:ok, 0}
      end,
      def default(:robot_count) do
        {:ok, 0}
      end,
      def default(:player_list) do
        {:error, :no_default_value}
      end,
      def default(:seq) do
        {:ok, 0}
      end,
      def default(_) do
        {:error, :no_such_field}
      end
    ]
  )
end