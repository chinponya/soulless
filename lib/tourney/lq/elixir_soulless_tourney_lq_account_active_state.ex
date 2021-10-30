# credo:disable-for-this-file
defmodule(Soulless.Tourney.Lq.AccountActiveState) do
  @moduledoc false
  (
    defstruct(
      account_id: 0,
      login_time: 0,
      logout_time: 0,
      is_online: false,
      playing: nil,
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
          |> encode_account_id(msg)
          |> encode_login_time(msg)
          |> encode_logout_time(msg)
          |> encode_is_online(msg)
          |> encode_playing(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_account_id(acc, msg)) do
          try do
            if(msg.account_id == 0) do
              acc
            else
              [acc, "\b", Protox.Encode.encode_uint32(msg.account_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:account_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_login_time(acc, msg)) do
          try do
            if(msg.login_time == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.login_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:login_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_logout_time(acc, msg)) do
          try do
            if(msg.logout_time == 0) do
              acc
            else
              [acc, <<24>>, Protox.Encode.encode_uint32(msg.logout_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:logout_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_is_online(acc, msg)) do
          try do
            if(msg.is_online == false) do
              acc
            else
              [acc, " ", Protox.Encode.encode_bool(msg.is_online)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:is_online, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_playing(acc, msg)) do
          try do
            if(msg.playing == nil) do
              acc
            else
              [acc, "*", Protox.Encode.encode_message(msg.playing)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:playing, "invalid field value"), __STACKTRACE__)
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
            parse_key_value(bytes, struct(Soulless.Tourney.Lq.AccountActiveState))
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
                {[account_id: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[login_time: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[logout_time: value], rest}

              {4, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_online: value], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   playing:
                     Protox.Message.merge(
                       msg.playing,
                       Soulless.Tourney.Lq.AccountPlayingGame.decode!(delimited)
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
          Soulless.Tourney.Lq.AccountActiveState,
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
        1 => {:account_id, {:scalar, 0}, :uint32},
        2 => {:login_time, {:scalar, 0}, :uint32},
        3 => {:logout_time, {:scalar, 0}, :uint32},
        4 => {:is_online, {:scalar, false}, :bool},
        5 => {:playing, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountPlayingGame}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        account_id: {1, {:scalar, 0}, :uint32},
        is_online: {4, {:scalar, false}, :bool},
        login_time: {2, {:scalar, 0}, :uint32},
        logout_time: {3, {:scalar, 0}, :uint32},
        playing: {5, {:scalar, nil}, {:message, Soulless.Tourney.Lq.AccountPlayingGame}}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
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
          json_name: "loginTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :login_time,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "logoutTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :logout_time,
          tag: 3,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isOnline",
          kind: {:scalar, false},
          label: :optional,
          name: :is_online,
          tag: 4,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "playing",
          kind: {:scalar, nil},
          label: :optional,
          name: :playing,
          tag: 5,
          type: {:message, Soulless.Tourney.Lq.AccountPlayingGame}
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:account_id)) do
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

        def(field_def("accountId")) do
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

        def(field_def("account_id")) do
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
        def(field_def(:login_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("loginTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 2,
             type: :uint32
           }}
        end

        def(field_def("login_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :login_time,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:logout_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("logoutTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 3,
             type: :uint32
           }}
        end

        def(field_def("logout_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "logoutTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :logout_time,
             tag: 3,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_online)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("isOnline")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 4,
             type: :bool
           }}
        end

        def(field_def("is_online")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isOnline",
             kind: {:scalar, false},
             label: :optional,
             name: :is_online,
             tag: 4,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:playing)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playing",
             kind: {:scalar, nil},
             label: :optional,
             name: :playing,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.AccountPlayingGame}
           }}
        end

        def(field_def("playing")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "playing",
             kind: {:scalar, nil},
             label: :optional,
             name: :playing,
             tag: 5,
             type: {:message, Soulless.Tourney.Lq.AccountPlayingGame}
           }}
        end

        []
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
      def(default(:account_id)) do
        {:ok, 0}
      end,
      def(default(:login_time)) do
        {:ok, 0}
      end,
      def(default(:logout_time)) do
        {:ok, 0}
      end,
      def(default(:is_online)) do
        {:ok, false}
      end,
      def(default(:playing)) do
        {:ok, nil}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end