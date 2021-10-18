# credo:disable-for-this-file
defmodule(Soulless.Lq.ResAccountActivityData) do
  @moduledoc false
  (
    defstruct(
      error: nil,
      exchange_records: [],
      task_progress_list: [],
      accumulated_point_list: [],
      rank_data_list: [],
      flip_task_progress_list: [],
      sign_in_data: [],
      richman_data: [],
      period_task_progress_list: [],
      random_task_progress_list: [],
      chest_up_data: [],
      sns_data: nil,
      mine_data: [],
      rpg_data: [],
      arena_data: [],
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
          |> encode_exchange_records(msg)
          |> encode_task_progress_list(msg)
          |> encode_accumulated_point_list(msg)
          |> encode_rank_data_list(msg)
          |> encode_flip_task_progress_list(msg)
          |> encode_sign_in_data(msg)
          |> encode_richman_data(msg)
          |> encode_period_task_progress_list(msg)
          |> encode_random_task_progress_list(msg)
          |> encode_chest_up_data(msg)
          |> encode_sns_data(msg)
          |> encode_mine_data(msg)
          |> encode_rpg_data(msg)
          |> encode_arena_data(msg)
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
        defp(encode_exchange_records(acc, msg)) do
          try do
            case(msg.exchange_records) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<18>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:exchange_records, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_task_progress_list(acc, msg)) do
          try do
            case(msg.task_progress_list) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, <<26>>, Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:task_progress_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_accumulated_point_list(acc, msg)) do
          try do
            case(msg.accumulated_point_list) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "\"", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:accumulated_point_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_rank_data_list(acc, msg)) do
          try do
            case(msg.rank_data_list) do
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
              reraise(
                Protox.EncodingError.new(:rank_data_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_flip_task_progress_list(acc, msg)) do
          try do
            case(msg.flip_task_progress_list) do
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
              reraise(
                Protox.EncodingError.new(:flip_task_progress_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_sign_in_data(acc, msg)) do
          try do
            case(msg.sign_in_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, ":", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:sign_in_data, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_richman_data(acc, msg)) do
          try do
            case(msg.richman_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "B", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:richman_data, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_period_task_progress_list(acc, msg)) do
          try do
            case(msg.period_task_progress_list) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "J", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:period_task_progress_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_random_task_progress_list(acc, msg)) do
          try do
            case(msg.random_task_progress_list) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "R", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:random_task_progress_list, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_chest_up_data(acc, msg)) do
          try do
            case(msg.chest_up_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "Z", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:chest_up_data, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_sns_data(acc, msg)) do
          try do
            if(msg.sns_data == nil) do
              acc
            else
              [acc, "b", Protox.Encode.encode_message(msg.sns_data)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:sns_data, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_mine_data(acc, msg)) do
          try do
            case(msg.mine_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "j", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:mine_data, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_rpg_data(acc, msg)) do
          try do
            case(msg.rpg_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "r", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:rpg_data, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_arena_data(acc, msg)) do
          try do
            case(msg.arena_data) do
              [] ->
                acc

              values ->
                [
                  acc,
                  Enum.reduce(values, [], fn value, acc ->
                    [acc, "z", Protox.Encode.encode_message(value)]
                  end)
                ]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:arena_data, "invalid field value"),
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
            parse_key_value(bytes, struct(Soulless.Lq.ResAccountActivityData))
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
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   exchange_records:
                     msg.exchange_records ++ [Soulless.Lq.ExchangeRecord.decode!(delimited)]
                 ], rest}

              {3, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   task_progress_list:
                     msg.task_progress_list ++ [Soulless.Lq.TaskProgress.decode!(delimited)]
                 ], rest}

              {4, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   accumulated_point_list:
                     msg.accumulated_point_list ++
                       [Soulless.Lq.ActivityAccumulatedPointData.decode!(delimited)]
                 ], rest}

              {5, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   rank_data_list:
                     msg.rank_data_list ++ [Soulless.Lq.ActivityRankPointData.decode!(delimited)]
                 ], rest}

              {6, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   flip_task_progress_list:
                     msg.flip_task_progress_list ++ [Soulless.Lq.TaskProgress.decode!(delimited)]
                 ], rest}

              {7, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sign_in_data:
                     msg.sign_in_data ++
                       [Soulless.Lq.ResAccountActivityData.ActivitySignInData.decode!(delimited)]
                 ], rest}

              {8, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   richman_data:
                     msg.richman_data ++
                       [Soulless.Lq.ResAccountActivityData.ActivityRichmanData.decode!(delimited)]
                 ], rest}

              {9, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   period_task_progress_list:
                     msg.period_task_progress_list ++
                       [Soulless.Lq.TaskProgress.decode!(delimited)]
                 ], rest}

              {10, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   random_task_progress_list:
                     msg.random_task_progress_list ++
                       [Soulless.Lq.TaskProgress.decode!(delimited)]
                 ], rest}

              {11, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   chest_up_data:
                     msg.chest_up_data ++
                       [Soulless.Lq.ResAccountActivityData.ChestUpData.decode!(delimited)]
                 ], rest}

              {12, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   sns_data:
                     Protox.Message.merge(
                       msg.sns_data,
                       Soulless.Lq.ResAccountActivityData.ActivitySNSData.decode!(delimited)
                     )
                 ], rest}

              {13, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   mine_data:
                     msg.mine_data ++
                       [Soulless.Lq.ResAccountActivityData.MineActivityData.decode!(delimited)]
                 ], rest}

              {14, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
                {[rpg_data: msg.rpg_data ++ [Soulless.Lq.RPGActivity.decode!(delimited)]], rest}

              {15, _, bytes} ->
                {len, bytes} = Protox.Varint.decode(bytes)
                {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)

                {[
                   arena_data:
                     msg.arena_data ++ [Soulless.Lq.ActivityArenaData.decode!(delimited)]
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
          Soulless.Lq.ResAccountActivityData,
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
        2 => {:exchange_records, :unpacked, {:message, Soulless.Lq.ExchangeRecord}},
        3 => {:task_progress_list, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        4 =>
          {:accumulated_point_list, :unpacked,
           {:message, Soulless.Lq.ActivityAccumulatedPointData}},
        5 => {:rank_data_list, :unpacked, {:message, Soulless.Lq.ActivityRankPointData}},
        6 => {:flip_task_progress_list, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        7 =>
          {:sign_in_data, :unpacked,
           {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}},
        8 =>
          {:richman_data, :unpacked,
           {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}},
        9 => {:period_task_progress_list, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        10 => {:random_task_progress_list, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        11 =>
          {:chest_up_data, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}},
        12 =>
          {:sns_data, {:scalar, nil},
           {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}},
        13 =>
          {:mine_data, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}},
        14 => {:rpg_data, :unpacked, {:message, Soulless.Lq.RPGActivity}},
        15 => {:arena_data, :unpacked, {:message, Soulless.Lq.ActivityArenaData}}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        accumulated_point_list:
          {4, :unpacked, {:message, Soulless.Lq.ActivityAccumulatedPointData}},
        arena_data: {15, :unpacked, {:message, Soulless.Lq.ActivityArenaData}},
        chest_up_data:
          {11, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}},
        error: {1, {:scalar, nil}, {:message, Soulless.Lq.Error}},
        exchange_records: {2, :unpacked, {:message, Soulless.Lq.ExchangeRecord}},
        flip_task_progress_list: {6, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        mine_data:
          {13, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}},
        period_task_progress_list: {9, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        random_task_progress_list: {10, :unpacked, {:message, Soulless.Lq.TaskProgress}},
        rank_data_list: {5, :unpacked, {:message, Soulless.Lq.ActivityRankPointData}},
        richman_data:
          {8, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}},
        rpg_data: {14, :unpacked, {:message, Soulless.Lq.RPGActivity}},
        sign_in_data:
          {7, :unpacked, {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}},
        sns_data:
          {12, {:scalar, nil}, {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}},
        task_progress_list: {3, :unpacked, {:message, Soulless.Lq.TaskProgress}}
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
          json_name: "exchangeRecords",
          kind: :unpacked,
          label: :repeated,
          name: :exchange_records,
          tag: 2,
          type: {:message, Soulless.Lq.ExchangeRecord}
        },
        %{
          __struct__: Protox.Field,
          json_name: "taskProgressList",
          kind: :unpacked,
          label: :repeated,
          name: :task_progress_list,
          tag: 3,
          type: {:message, Soulless.Lq.TaskProgress}
        },
        %{
          __struct__: Protox.Field,
          json_name: "accumulatedPointList",
          kind: :unpacked,
          label: :repeated,
          name: :accumulated_point_list,
          tag: 4,
          type: {:message, Soulless.Lq.ActivityAccumulatedPointData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rankDataList",
          kind: :unpacked,
          label: :repeated,
          name: :rank_data_list,
          tag: 5,
          type: {:message, Soulless.Lq.ActivityRankPointData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "flipTaskProgressList",
          kind: :unpacked,
          label: :repeated,
          name: :flip_task_progress_list,
          tag: 6,
          type: {:message, Soulless.Lq.TaskProgress}
        },
        %{
          __struct__: Protox.Field,
          json_name: "signInData",
          kind: :unpacked,
          label: :repeated,
          name: :sign_in_data,
          tag: 7,
          type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "richmanData",
          kind: :unpacked,
          label: :repeated,
          name: :richman_data,
          tag: 8,
          type: {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "periodTaskProgressList",
          kind: :unpacked,
          label: :repeated,
          name: :period_task_progress_list,
          tag: 9,
          type: {:message, Soulless.Lq.TaskProgress}
        },
        %{
          __struct__: Protox.Field,
          json_name: "randomTaskProgressList",
          kind: :unpacked,
          label: :repeated,
          name: :random_task_progress_list,
          tag: 10,
          type: {:message, Soulless.Lq.TaskProgress}
        },
        %{
          __struct__: Protox.Field,
          json_name: "chestUpData",
          kind: :unpacked,
          label: :repeated,
          name: :chest_up_data,
          tag: 11,
          type: {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "snsData",
          kind: {:scalar, nil},
          label: :optional,
          name: :sns_data,
          tag: 12,
          type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "mineData",
          kind: :unpacked,
          label: :repeated,
          name: :mine_data,
          tag: 13,
          type: {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}
        },
        %{
          __struct__: Protox.Field,
          json_name: "rpgData",
          kind: :unpacked,
          label: :repeated,
          name: :rpg_data,
          tag: 14,
          type: {:message, Soulless.Lq.RPGActivity}
        },
        %{
          __struct__: Protox.Field,
          json_name: "arenaData",
          kind: :unpacked,
          label: :repeated,
          name: :arena_data,
          tag: 15,
          type: {:message, Soulless.Lq.ActivityArenaData}
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
        def(field_def(:exchange_records)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exchangeRecords",
             kind: :unpacked,
             label: :repeated,
             name: :exchange_records,
             tag: 2,
             type: {:message, Soulless.Lq.ExchangeRecord}
           }}
        end

        def(field_def("exchangeRecords")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exchangeRecords",
             kind: :unpacked,
             label: :repeated,
             name: :exchange_records,
             tag: 2,
             type: {:message, Soulless.Lq.ExchangeRecord}
           }}
        end

        def(field_def("exchange_records")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "exchangeRecords",
             kind: :unpacked,
             label: :repeated,
             name: :exchange_records,
             tag: 2,
             type: {:message, Soulless.Lq.ExchangeRecord}
           }}
        end
      ),
      (
        def(field_def(:task_progress_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "taskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :task_progress_list,
             tag: 3,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("taskProgressList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "taskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :task_progress_list,
             tag: 3,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("task_progress_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "taskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :task_progress_list,
             tag: 3,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end
      ),
      (
        def(field_def(:accumulated_point_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accumulatedPointList",
             kind: :unpacked,
             label: :repeated,
             name: :accumulated_point_list,
             tag: 4,
             type: {:message, Soulless.Lq.ActivityAccumulatedPointData}
           }}
        end

        def(field_def("accumulatedPointList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accumulatedPointList",
             kind: :unpacked,
             label: :repeated,
             name: :accumulated_point_list,
             tag: 4,
             type: {:message, Soulless.Lq.ActivityAccumulatedPointData}
           }}
        end

        def(field_def("accumulated_point_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "accumulatedPointList",
             kind: :unpacked,
             label: :repeated,
             name: :accumulated_point_list,
             tag: 4,
             type: {:message, Soulless.Lq.ActivityAccumulatedPointData}
           }}
        end
      ),
      (
        def(field_def(:rank_data_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankDataList",
             kind: :unpacked,
             label: :repeated,
             name: :rank_data_list,
             tag: 5,
             type: {:message, Soulless.Lq.ActivityRankPointData}
           }}
        end

        def(field_def("rankDataList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankDataList",
             kind: :unpacked,
             label: :repeated,
             name: :rank_data_list,
             tag: 5,
             type: {:message, Soulless.Lq.ActivityRankPointData}
           }}
        end

        def(field_def("rank_data_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rankDataList",
             kind: :unpacked,
             label: :repeated,
             name: :rank_data_list,
             tag: 5,
             type: {:message, Soulless.Lq.ActivityRankPointData}
           }}
        end
      ),
      (
        def(field_def(:flip_task_progress_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flipTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :flip_task_progress_list,
             tag: 6,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("flipTaskProgressList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flipTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :flip_task_progress_list,
             tag: 6,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("flip_task_progress_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "flipTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :flip_task_progress_list,
             tag: 6,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end
      ),
      (
        def(field_def(:sign_in_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signInData",
             kind: :unpacked,
             label: :repeated,
             name: :sign_in_data,
             tag: 7,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}
           }}
        end

        def(field_def("signInData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signInData",
             kind: :unpacked,
             label: :repeated,
             name: :sign_in_data,
             tag: 7,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}
           }}
        end

        def(field_def("sign_in_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "signInData",
             kind: :unpacked,
             label: :repeated,
             name: :sign_in_data,
             tag: 7,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySignInData}
           }}
        end
      ),
      (
        def(field_def(:richman_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "richmanData",
             kind: :unpacked,
             label: :repeated,
             name: :richman_data,
             tag: 8,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}
           }}
        end

        def(field_def("richmanData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "richmanData",
             kind: :unpacked,
             label: :repeated,
             name: :richman_data,
             tag: 8,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}
           }}
        end

        def(field_def("richman_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "richmanData",
             kind: :unpacked,
             label: :repeated,
             name: :richman_data,
             tag: 8,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivityRichmanData}
           }}
        end
      ),
      (
        def(field_def(:period_task_progress_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "periodTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :period_task_progress_list,
             tag: 9,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("periodTaskProgressList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "periodTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :period_task_progress_list,
             tag: 9,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("period_task_progress_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "periodTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :period_task_progress_list,
             tag: 9,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end
      ),
      (
        def(field_def(:random_task_progress_list)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :random_task_progress_list,
             tag: 10,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("randomTaskProgressList")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :random_task_progress_list,
             tag: 10,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end

        def(field_def("random_task_progress_list")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "randomTaskProgressList",
             kind: :unpacked,
             label: :repeated,
             name: :random_task_progress_list,
             tag: 10,
             type: {:message, Soulless.Lq.TaskProgress}
           }}
        end
      ),
      (
        def(field_def(:chest_up_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestUpData",
             kind: :unpacked,
             label: :repeated,
             name: :chest_up_data,
             tag: 11,
             type: {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}
           }}
        end

        def(field_def("chestUpData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestUpData",
             kind: :unpacked,
             label: :repeated,
             name: :chest_up_data,
             tag: 11,
             type: {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}
           }}
        end

        def(field_def("chest_up_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "chestUpData",
             kind: :unpacked,
             label: :repeated,
             name: :chest_up_data,
             tag: 11,
             type: {:message, Soulless.Lq.ResAccountActivityData.ChestUpData}
           }}
        end
      ),
      (
        def(field_def(:sns_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "snsData",
             kind: {:scalar, nil},
             label: :optional,
             name: :sns_data,
             tag: 12,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}
           }}
        end

        def(field_def("snsData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "snsData",
             kind: {:scalar, nil},
             label: :optional,
             name: :sns_data,
             tag: 12,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}
           }}
        end

        def(field_def("sns_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "snsData",
             kind: {:scalar, nil},
             label: :optional,
             name: :sns_data,
             tag: 12,
             type: {:message, Soulless.Lq.ResAccountActivityData.ActivitySNSData}
           }}
        end
      ),
      (
        def(field_def(:mine_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mineData",
             kind: :unpacked,
             label: :repeated,
             name: :mine_data,
             tag: 13,
             type: {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}
           }}
        end

        def(field_def("mineData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mineData",
             kind: :unpacked,
             label: :repeated,
             name: :mine_data,
             tag: 13,
             type: {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}
           }}
        end

        def(field_def("mine_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "mineData",
             kind: :unpacked,
             label: :repeated,
             name: :mine_data,
             tag: 13,
             type: {:message, Soulless.Lq.ResAccountActivityData.MineActivityData}
           }}
        end
      ),
      (
        def(field_def(:rpg_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpgData",
             kind: :unpacked,
             label: :repeated,
             name: :rpg_data,
             tag: 14,
             type: {:message, Soulless.Lq.RPGActivity}
           }}
        end

        def(field_def("rpgData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpgData",
             kind: :unpacked,
             label: :repeated,
             name: :rpg_data,
             tag: 14,
             type: {:message, Soulless.Lq.RPGActivity}
           }}
        end

        def(field_def("rpg_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "rpgData",
             kind: :unpacked,
             label: :repeated,
             name: :rpg_data,
             tag: 14,
             type: {:message, Soulless.Lq.RPGActivity}
           }}
        end
      ),
      (
        def(field_def(:arena_data)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arenaData",
             kind: :unpacked,
             label: :repeated,
             name: :arena_data,
             tag: 15,
             type: {:message, Soulless.Lq.ActivityArenaData}
           }}
        end

        def(field_def("arenaData")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arenaData",
             kind: :unpacked,
             label: :repeated,
             name: :arena_data,
             tag: 15,
             type: {:message, Soulless.Lq.ActivityArenaData}
           }}
        end

        def(field_def("arena_data")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "arenaData",
             kind: :unpacked,
             label: :repeated,
             name: :arena_data,
             tag: 15,
             type: {:message, Soulless.Lq.ActivityArenaData}
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
      def(default(:exchange_records)) do
        {:error, :no_default_value}
      end,
      def(default(:task_progress_list)) do
        {:error, :no_default_value}
      end,
      def(default(:accumulated_point_list)) do
        {:error, :no_default_value}
      end,
      def(default(:rank_data_list)) do
        {:error, :no_default_value}
      end,
      def(default(:flip_task_progress_list)) do
        {:error, :no_default_value}
      end,
      def(default(:sign_in_data)) do
        {:error, :no_default_value}
      end,
      def(default(:richman_data)) do
        {:error, :no_default_value}
      end,
      def(default(:period_task_progress_list)) do
        {:error, :no_default_value}
      end,
      def(default(:random_task_progress_list)) do
        {:error, :no_default_value}
      end,
      def(default(:chest_up_data)) do
        {:error, :no_default_value}
      end,
      def(default(:sns_data)) do
        {:ok, nil}
      end,
      def(default(:mine_data)) do
        {:error, :no_default_value}
      end,
      def(default(:rpg_data)) do
        {:error, :no_default_value}
      end,
      def(default(:arena_data)) do
        {:error, :no_default_value}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end