# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.ReqCreateContestGame) do
  @moduledoc false
  (
    defstruct(
      slots: [],
      tag: "",
      random_position: false,
      open_live: false,
      chat_broadcast_for_end: false,
      ai_level: 0,
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
          |> encode_slots(msg)
          |> encode_tag(msg)
          |> encode_random_position(msg)
          |> encode_open_live(msg)
          |> encode_chat_broadcast_for_end(msg)
          |> encode_ai_level(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_slots(acc, msg)) do
          try do
            case(msg.slots) do
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
              reraise(Protox.EncodingError.new(:slots, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_tag(acc, msg)) do
          try do
            if(msg.tag == "") do
              acc
            else
              [acc, <<18>>, Protox.Encode.encode_string(msg.tag)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:tag, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_random_position(acc, msg)) do
          try do
            if(msg.random_position == false) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_bool(msg.random_position)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:random_position, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_open_live(acc, msg)) do
          try do
            if(msg.open_live == false) do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.open_live)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:open_live, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_chat_broadcast_for_end(acc, msg)) do
          try do
            if(msg.chat_broadcast_for_end == false) do
              acc
            else
              [acc, "(", Protox.Encode.encode_bool(msg.chat_broadcast_for_end)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:chat_broadcast_for_end, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_ai_level(acc, msg)) do
          try do
            if(msg.ai_level == 0) do
              acc
            else
              [acc, "0", Protox.Encode.encode_uint32(msg.ai_level)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:ai_level, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.ReqCreateContestGame))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   slots:
                     msg.slots ++
                       [Soulless.Tourney.Lq.ReqCreateContestGame.Slot.decode!(delimited)]
                 ], rest}

              {2, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[tag: delimited], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[random_position: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[open_live: value], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[chat_broadcast_for_end: value], rest}

              {6, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[ai_level: value], rest}

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
          Soulless.Tourney.Lq.ReqCreateContestGame,
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
        1 => {:slots, :unpacked, {:message, Soulless.Tourney.Lq.ReqCreateContestGame.Slot}},
        2 => {:tag, {:scalar, ""}, :string},
        3 => {:random_position, {:scalar, false}, :bool},
        4 => {:open_live, {:scalar, false}, :bool},
        5 => {:chat_broadcast_for_end, {:scalar, false}, :bool},
        6 => {:ai_level, {:scalar, 0}, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        ai_level: {6, {:scalar, 0}, :uint32},
        chat_broadcast_for_end: {5, {:scalar, false}, :bool},
        open_live: {4, {:scalar, false}, :bool},
        random_position: {3, {:scalar, false}, :bool},
        slots: {1, :unpacked, {:message, Soulless.Tourney.Lq.ReqCreateContestGame.Slot}},
        tag: {2, {:scalar, ""}, :string}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "slots",
          kind: :unpacked,
          label: :repeated,
          name: :slots,
          tag: 1,
          type: {:message, Soulless.Tourney.Lq.ReqCreateContestGame.Slot}
        },
        %{
          __struct__: Protox.Field,
          json_name: "tag",
          kind: {:scalar, ""},
          label: :optional,
          name: :tag,
          tag: 2,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "randomPosition",
          kind: {:scalar, false},
          label: :optional,
          name: :random_position,
          tag: 3,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "openLive",
          kind: {:scalar, false},
          label: :optional,
          name: :open_live,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "chatBroadcastForEnd",
          kind: {:scalar, false},
          label: :optional,
          name: :chat_broadcast_for_end,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "aiLevel",
          kind: {:scalar, 0},
          label: :optional,
          name: :ai_level,
          tag: 6,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:slots)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "slots",
             kind: :unpacked,
             label: :repeated,
             name: :slots,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.ReqCreateContestGame.Slot}
           }}
        end

        def(field_def("slots")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "slots",
             kind: :unpacked,
             label: :repeated,
             name: :slots,
             tag: 1,
             type: {:message, Soulless.Tourney.Lq.ReqCreateContestGame.Slot}
           }}
        end

        []
      ),
      (
        def(field_def(:tag)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tag",
             kind: {:scalar, ""},
             label: :optional,
             name: :tag,
             tag: 2,
             type: :string
           }}
        end

        def(field_def("tag")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "tag",
             kind: {:scalar, ""},
             label: :optional,
             name: :tag,
             tag: 2,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:random_position)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomPosition",
             kind: {:scalar, false},
             label: :optional,
             name: :random_position,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("randomPosition")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomPosition",
             kind: {:scalar, false},
             label: :optional,
             name: :random_position,
             tag: 3,
             type: :bool
           }}
        end

        def(field_def("random_position")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomPosition",
             kind: {:scalar, false},
             label: :optional,
             name: :random_position,
             tag: 3,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:open_live)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openLive",
             kind: {:scalar, false},
             label: :optional,
             name: :open_live,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("openLive")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openLive",
             kind: {:scalar, false},
             label: :optional,
             name: :open_live,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("open_live")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "openLive",
             kind: {:scalar, false},
             label: :optional,
             name: :open_live,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:chat_broadcast_for_end)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatBroadcastForEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :chat_broadcast_for_end,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("chatBroadcastForEnd")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatBroadcastForEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :chat_broadcast_for_end,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("chat_broadcast_for_end")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chatBroadcastForEnd",
             kind: {:scalar, false},
             label: :optional,
             name: :chat_broadcast_for_end,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:ai_level)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("aiLevel")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 6,
             type: :uint32
           }}
        end

        def(field_def("ai_level")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "aiLevel",
             kind: {:scalar, 0},
             label: :optional,
             name: :ai_level,
             tag: 6,
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
      def(default(:slots)) do
        {:error, :no_default_value}
      end,
      def(default(:tag)) do
        {:ok, ""}
      end,
      def(default(:random_position)) do
        {:ok, false}
      end,
      def(default(:open_live)) do
        {:ok, false}
      end,
      def(default(:chat_broadcast_for_end)) do
        {:ok, false}
      end,
      def(default(:ai_level)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end