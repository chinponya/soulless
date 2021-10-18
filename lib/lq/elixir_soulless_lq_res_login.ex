# credo:disable-for-this-file
defmodule(Soulless.Lq.ResLogin) do
  @moduledoc false
  (
    defstruct(
      error: nil,
      account_id: 0,
      account: nil,
      game_info: nil,
      has_unread_announcement: false,
      access_token: "",
      signup_time: 0,
      is_id_card_authed: false,
      country: "",
      logined_version: [],
      rewarded_version: [],
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
          |> encode_error(msg)
          |> encode_account_id(msg)
          |> encode_account(msg)
          |> encode_game_info(msg)
          |> encode_has_unread_announcement(msg)
          |> encode_access_token(msg)
          |> encode_signup_time(msg)
          |> encode_is_id_card_authed(msg)
          |> encode_country(msg)
          |> encode_logined_version(msg)
          |> encode_rewarded_version(msg)
          |> encode_unknown_fields(msg)
        end
      )

      []

      [
        defp(encode_error(acc, msg)) do
          try do
            if(msg.error == nil) do
              acc
            else
              [acc, "\n", Protox.Encode.encode_message(msg.error)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:error, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_account_id(acc, msg)) do
          try do
            if(msg.account_id == 0) do
              acc
            else
              [acc, <<16>>, Protox.Encode.encode_uint32(msg.account_id)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:account_id, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_account(acc, msg)) do
          try do
            if(msg.account == nil) do
              acc
            else
              [acc, <<26>>, Protox.Encode.encode_message(msg.account)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:account, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_game_info(acc, msg)) do
          try do
            if(msg.game_info == nil) do
              acc
            else
              [acc, "\"", Protox.Encode.encode_message(msg.game_info)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:game_info, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_has_unread_announcement(acc, msg)) do
          try do
            if(msg.has_unread_announcement == false) do
              acc
            else
              [acc, "(", Protox.Encode.encode_bool(msg.has_unread_announcement)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:has_unread_announcement, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_access_token(acc, msg)) do
          try do
            if(msg.access_token == "") do
              acc
            else
              [acc, "2", Protox.Encode.encode_string(msg.access_token)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:access_token, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_signup_time(acc, msg)) do
          try do
            if(msg.signup_time == 0) do
              acc
            else
              [acc, "8", Protox.Encode.encode_uint32(msg.signup_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:signup_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_is_id_card_authed(acc, msg)) do
          try do
            if(msg.is_id_card_authed == false) do
              acc
            else
              [acc, "@", Protox.Encode.encode_bool(msg.is_id_card_authed)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:is_id_card_authed, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_country(acc, msg)) do
          try do
            if(msg.country == "") do
              acc
            else
              [acc, "J", Protox.Encode.encode_string(msg.country)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:country, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_logined_version(acc, msg)) do
          try do
            case(msg.logined_version) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "R",
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
              reraise(
                Protox.EncodingError.new(:logined_version, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_rewarded_version(acc, msg)) do
          try do
            case(msg.rewarded_version) do
              [] ->
                acc

              values ->
                [
                  acc,
                  "Z",
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
              reraise(
                Protox.EncodingError.new(:rewarded_version, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.ResLogin))
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

                {[error: Protox.Message.merge(msg.error, Soulless.Lq.Error.decode!(delimited))],
                 rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[account_id: value], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   account:
                     Protox.Message.merge(msg.account, Soulless.Lq.Account.decode!(delimited))
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   game_info:
                     Protox.Message.merge(
                       msg.game_info,
                       Soulless.Lq.GameConnectInfo.decode!(delimited)
                     )
                 ], rest}

              {5, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[has_unread_announcement: value], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[access_token: delimited], rest}

              {7, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[signup_time: value], rest}

              {8, _, bytes} ->
                {value, rest} = Protox.Decode.parse_bool(bytes)
                {[is_id_card_authed: value], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[country: delimited], rest}

              {10, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   logined_version:
                     msg.logined_version ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {10, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[logined_version: msg.logined_version ++ [value]], rest}

              {11, 2, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   rewarded_version:
                     msg.rewarded_version ++ Protox.Decode.parse_repeated_uint32([], delimited)
                 ], rest}

              {11, _, bytes} ->
                {value, rest} = Protox.Decode.parse_uint32(bytes)
                {[rewarded_version: msg.rewarded_version ++ [value]], rest}

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
          Soulless.Lq.ResLogin,
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
        1 => {:error, {:scalar, nil}, {:message, Soulless.Lq.Error}},
        2 => {:account_id, {:scalar, 0}, :uint32},
        3 => {:account, {:scalar, nil}, {:message, Soulless.Lq.Account}},
        4 => {:game_info, {:scalar, nil}, {:message, Soulless.Lq.GameConnectInfo}},
        5 => {:has_unread_announcement, {:scalar, false}, :bool},
        6 => {:access_token, {:scalar, ""}, :string},
        7 => {:signup_time, {:scalar, 0}, :uint32},
        8 => {:is_id_card_authed, {:scalar, false}, :bool},
        9 => {:country, {:scalar, ""}, :string},
        10 => {:logined_version, :packed, :uint32},
        11 => {:rewarded_version, :packed, :uint32}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        access_token: {6, {:scalar, ""}, :string},
        account: {3, {:scalar, nil}, {:message, Soulless.Lq.Account}},
        account_id: {2, {:scalar, 0}, :uint32},
        country: {9, {:scalar, ""}, :string},
        error: {1, {:scalar, nil}, {:message, Soulless.Lq.Error}},
        game_info: {4, {:scalar, nil}, {:message, Soulless.Lq.GameConnectInfo}},
        has_unread_announcement: {5, {:scalar, false}, :bool},
        is_id_card_authed: {8, {:scalar, false}, :bool},
        logined_version: {10, :packed, :uint32},
        rewarded_version: {11, :packed, :uint32},
        signup_time: {7, {:scalar, 0}, :uint32}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "error",
          kind: {:scalar, nil},
          label: :optional,
          name: :error,
          tag: 1,
          type: {:message, Soulless.Lq.Error}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accountId",
          kind: {:scalar, 0},
          label: :optional,
          name: :account_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "account",
          kind: {:scalar, nil},
          label: :optional,
          name: :account,
          tag: 3,
          type: {:message, Soulless.Lq.Account}
        },
        %{
          __struct__: Protox.Field,
          json_name: "gameInfo",
          kind: {:scalar, nil},
          label: :optional,
          name: :game_info,
          tag: 4,
          type: {:message, Soulless.Lq.GameConnectInfo}
        },
        %{
          __struct__: Protox.Field,
          json_name: "hasUnreadAnnouncement",
          kind: {:scalar, false},
          label: :optional,
          name: :has_unread_announcement,
          tag: 5,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "accessToken",
          kind: {:scalar, ""},
          label: :optional,
          name: :access_token,
          tag: 6,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "signupTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :signup_time,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "isIdCardAuthed",
          kind: {:scalar, false},
          label: :optional,
          name: :is_id_card_authed,
          tag: 8,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "country",
          kind: {:scalar, ""},
          label: :optional,
          name: :country,
          tag: 9,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "loginedVersion",
          kind: :packed,
          label: :repeated,
          name: :logined_version,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "rewardedVersion",
          kind: :packed,
          label: :repeated,
          name: :rewarded_version,
          tag: 11,
          type: :uint32
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:error)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Lq.Error}
           }}
        end

        def(field_def("error")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "error",
             kind: {:scalar, nil},
             label: :optional,
             name: :error,
             tag: 1,
             type: {:message, Soulless.Lq.Error}
           }}
        end

        []
      ),
      (
        def(field_def(:account_id)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accountId",
             kind: {:scalar, 0},
             label: :optional,
             name: :account_id,
             tag: 2,
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
             tag: 2,
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
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:account)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "account",
             kind: {:scalar, nil},
             label: :optional,
             name: :account,
             tag: 3,
             type: {:message, Soulless.Lq.Account}
           }}
        end

        def(field_def("account")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "account",
             kind: {:scalar, nil},
             label: :optional,
             name: :account,
             tag: 3,
             type: {:message, Soulless.Lq.Account}
           }}
        end

        []
      ),
      (
        def(field_def(:game_info)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_info,
             tag: 4,
             type: {:message, Soulless.Lq.GameConnectInfo}
           }}
        end

        def(field_def("gameInfo")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_info,
             tag: 4,
             type: {:message, Soulless.Lq.GameConnectInfo}
           }}
        end

        def(field_def("game_info")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "gameInfo",
             kind: {:scalar, nil},
             label: :optional,
             name: :game_info,
             tag: 4,
             type: {:message, Soulless.Lq.GameConnectInfo}
           }}
        end
      ),
      (
        def(field_def(:has_unread_announcement)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasUnreadAnnouncement",
             kind: {:scalar, false},
             label: :optional,
             name: :has_unread_announcement,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("hasUnreadAnnouncement")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasUnreadAnnouncement",
             kind: {:scalar, false},
             label: :optional,
             name: :has_unread_announcement,
             tag: 5,
             type: :bool
           }}
        end

        def(field_def("has_unread_announcement")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "hasUnreadAnnouncement",
             kind: {:scalar, false},
             label: :optional,
             name: :has_unread_announcement,
             tag: 5,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:access_token)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("accessToken")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 6,
             type: :string
           }}
        end

        def(field_def("access_token")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accessToken",
             kind: {:scalar, ""},
             label: :optional,
             name: :access_token,
             tag: 6,
             type: :string
           }}
        end
      ),
      (
        def(field_def(:signup_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_time,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("signupTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_time,
             tag: 7,
             type: :uint32
           }}
        end

        def(field_def("signup_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signupTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :signup_time,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:is_id_card_authed)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isIdCardAuthed",
             kind: {:scalar, false},
             label: :optional,
             name: :is_id_card_authed,
             tag: 8,
             type: :bool
           }}
        end

        def(field_def("isIdCardAuthed")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isIdCardAuthed",
             kind: {:scalar, false},
             label: :optional,
             name: :is_id_card_authed,
             tag: 8,
             type: :bool
           }}
        end

        def(field_def("is_id_card_authed")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "isIdCardAuthed",
             kind: {:scalar, false},
             label: :optional,
             name: :is_id_card_authed,
             tag: 8,
             type: :bool
           }}
        end
      ),
      (
        def(field_def(:country)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "country",
             kind: {:scalar, ""},
             label: :optional,
             name: :country,
             tag: 9,
             type: :string
           }}
        end

        def(field_def("country")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "country",
             kind: {:scalar, ""},
             label: :optional,
             name: :country,
             tag: 9,
             type: :string
           }}
        end

        []
      ),
      (
        def(field_def(:logined_version)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginedVersion",
             kind: :packed,
             label: :repeated,
             name: :logined_version,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("loginedVersion")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginedVersion",
             kind: :packed,
             label: :repeated,
             name: :logined_version,
             tag: 10,
             type: :uint32
           }}
        end

        def(field_def("logined_version")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "loginedVersion",
             kind: :packed,
             label: :repeated,
             name: :logined_version,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def(field_def(:rewarded_version)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedVersion",
             kind: :packed,
             label: :repeated,
             name: :rewarded_version,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("rewardedVersion")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedVersion",
             kind: :packed,
             label: :repeated,
             name: :rewarded_version,
             tag: 11,
             type: :uint32
           }}
        end

        def(field_def("rewarded_version")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rewardedVersion",
             kind: :packed,
             label: :repeated,
             name: :rewarded_version,
             tag: 11,
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
      def(default(:error)) do
        {:ok, nil}
      end,
      def(default(:account_id)) do
        {:ok, 0}
      end,
      def(default(:account)) do
        {:ok, nil}
      end,
      def(default(:game_info)) do
        {:ok, nil}
      end,
      def(default(:has_unread_announcement)) do
        {:ok, false}
      end,
      def(default(:access_token)) do
        {:ok, ""}
      end,
      def(default(:signup_time)) do
        {:ok, 0}
      end,
      def(default(:is_id_card_authed)) do
        {:ok, false}
      end,
      def(default(:country)) do
        {:ok, ""}
      end,
      def(default(:logined_version)) do
        {:error, :no_default_value}
      end,
      def(default(:rewarded_version)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end