# credo:disable-for-this-file
defmodule Soulless.Game.Lq.CustomizedContestBase do
  @moduledoc false
  defstruct unique_id: 0,
            contest_id: 0,
            contest_name: "",
            state: 0,
            creator_id: 0,
            create_time: 0,
            start_time: 0,
            finish_time: 0,
            open: false,
            contest_type: 0,
            public_notice: "",
            check_state: 0,
            checking_name: "",
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
        |> encode_unique_id(msg)
        |> encode_contest_id(msg)
        |> encode_contest_name(msg)
        |> encode_state(msg)
        |> encode_creator_id(msg)
        |> encode_create_time(msg)
        |> encode_start_time(msg)
        |> encode_finish_time(msg)
        |> encode_open(msg)
        |> encode_contest_type(msg)
        |> encode_public_notice(msg)
        |> encode_check_state(msg)
        |> encode_checking_name(msg)
        |> encode_unknown_fields(msg)
      end
    )

    []

    [
      defp encode_unique_id(acc, msg) do
        try do
          if msg.unique_id == 0 do
            acc
          else
            [acc, "\b", Protox.Encode.encode_uint32(msg.unique_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:unique_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_contest_id(acc, msg) do
        try do
          if msg.contest_id == 0 do
            acc
          else
            [acc, "\x10", Protox.Encode.encode_uint32(msg.contest_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_contest_name(acc, msg) do
        try do
          if msg.contest_name == "" do
            acc
          else
            [acc, "\x1A", Protox.Encode.encode_string(msg.contest_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_name, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_state(acc, msg) do
        try do
          if msg.state == 0 do
            acc
          else
            [acc, " ", Protox.Encode.encode_uint32(msg.state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_creator_id(acc, msg) do
        try do
          if msg.creator_id == 0 do
            acc
          else
            [acc, "(", Protox.Encode.encode_uint32(msg.creator_id)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:creator_id, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_create_time(acc, msg) do
        try do
          if msg.create_time == 0 do
            acc
          else
            [acc, "0", Protox.Encode.encode_uint32(msg.create_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:create_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_start_time(acc, msg) do
        try do
          if msg.start_time == 0 do
            acc
          else
            [acc, "8", Protox.Encode.encode_uint32(msg.start_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:start_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_finish_time(acc, msg) do
        try do
          if msg.finish_time == 0 do
            acc
          else
            [acc, "@", Protox.Encode.encode_uint32(msg.finish_time)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:finish_time, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_open(acc, msg) do
        try do
          if msg.open == false do
            acc
          else
            [acc, "H", Protox.Encode.encode_bool(msg.open)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:open, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_contest_type(acc, msg) do
        try do
          if msg.contest_type == 0 do
            acc
          else
            [acc, "P", Protox.Encode.encode_uint32(msg.contest_type)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:contest_type, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_public_notice(acc, msg) do
        try do
          if msg.public_notice == "" do
            acc
          else
            [acc, "Z", Protox.Encode.encode_string(msg.public_notice)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:public_notice, "invalid field value"),
                    __STACKTRACE__
        end
      end,
      defp encode_check_state(acc, msg) do
        try do
          if msg.check_state == 0 do
            acc
          else
            [acc, "`", Protox.Encode.encode_uint32(msg.check_state)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:check_state, "invalid field value"), __STACKTRACE__
        end
      end,
      defp encode_checking_name(acc, msg) do
        try do
          if msg.checking_name == "" do
            acc
          else
            [acc, "j", Protox.Encode.encode_string(msg.checking_name)]
          end
        rescue
          ArgumentError ->
            reraise Protox.EncodingError.new(:checking_name, "invalid field value"),
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
          parse_key_value(bytes, struct(Soulless.Game.Lq.CustomizedContestBase))
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
              {[unique_id: value], rest}

            {2, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[contest_id: value], rest}

            {3, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[contest_name: Protox.Decode.validate_string(delimited)], rest}

            {4, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[state: value], rest}

            {5, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[creator_id: value], rest}

            {6, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[create_time: value], rest}

            {7, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[start_time: value], rest}

            {8, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[finish_time: value], rest}

            {9, _, bytes} ->
              {value, rest} = Protox.Decode.parse_bool(bytes)
              {[open: value], rest}

            {10, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[contest_type: value], rest}

            {11, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[public_notice: Protox.Decode.validate_string(delimited)], rest}

            {12, _, bytes} ->
              {value, rest} = Protox.Decode.parse_uint32(bytes)
              {[check_state: value], rest}

            {13, _, bytes} ->
              {len, bytes} = Protox.Varint.decode(bytes)
              {delimited, rest} = Protox.Decode.parse_delimited(bytes, len)
              {[checking_name: Protox.Decode.validate_string(delimited)], rest}

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
        Soulless.Game.Lq.CustomizedContestBase,
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
        1 => {:unique_id, {:scalar, 0}, :uint32},
        2 => {:contest_id, {:scalar, 0}, :uint32},
        3 => {:contest_name, {:scalar, ""}, :string},
        4 => {:state, {:scalar, 0}, :uint32},
        5 => {:creator_id, {:scalar, 0}, :uint32},
        6 => {:create_time, {:scalar, 0}, :uint32},
        7 => {:start_time, {:scalar, 0}, :uint32},
        8 => {:finish_time, {:scalar, 0}, :uint32},
        9 => {:open, {:scalar, false}, :bool},
        10 => {:contest_type, {:scalar, 0}, :uint32},
        11 => {:public_notice, {:scalar, ""}, :string},
        12 => {:check_state, {:scalar, 0}, :uint32},
        13 => {:checking_name, {:scalar, ""}, :string}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def defs_by_name() do
      %{
        check_state: {12, {:scalar, 0}, :uint32},
        checking_name: {13, {:scalar, ""}, :string},
        contest_id: {2, {:scalar, 0}, :uint32},
        contest_name: {3, {:scalar, ""}, :string},
        contest_type: {10, {:scalar, 0}, :uint32},
        create_time: {6, {:scalar, 0}, :uint32},
        creator_id: {5, {:scalar, 0}, :uint32},
        finish_time: {8, {:scalar, 0}, :uint32},
        open: {9, {:scalar, false}, :bool},
        public_notice: {11, {:scalar, ""}, :string},
        start_time: {7, {:scalar, 0}, :uint32},
        state: {4, {:scalar, 0}, :uint32},
        unique_id: {1, {:scalar, 0}, :uint32}
      }
    end
  )

  (
    @spec fields_defs() :: list(Protox.Field.t())
    def fields_defs() do
      [
        %{
          __struct__: Protox.Field,
          json_name: "uniqueId",
          kind: {:scalar, 0},
          label: :optional,
          name: :unique_id,
          tag: 1,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestId",
          kind: {:scalar, 0},
          label: :optional,
          name: :contest_id,
          tag: 2,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestName",
          kind: {:scalar, ""},
          label: :optional,
          name: :contest_name,
          tag: 3,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "state",
          kind: {:scalar, 0},
          label: :optional,
          name: :state,
          tag: 4,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "creatorId",
          kind: {:scalar, 0},
          label: :optional,
          name: :creator_id,
          tag: 5,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "createTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :create_time,
          tag: 6,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 7,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "finishTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :finish_time,
          tag: 8,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "open",
          kind: {:scalar, false},
          label: :optional,
          name: :open,
          tag: 9,
          type: :bool
        },
        %{
          __struct__: Protox.Field,
          json_name: "contestType",
          kind: {:scalar, 0},
          label: :optional,
          name: :contest_type,
          tag: 10,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "publicNotice",
          kind: {:scalar, ""},
          label: :optional,
          name: :public_notice,
          tag: 11,
          type: :string
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkState",
          kind: {:scalar, 0},
          label: :optional,
          name: :check_state,
          tag: 12,
          type: :uint32
        },
        %{
          __struct__: Protox.Field,
          json_name: "checkingName",
          kind: {:scalar, ""},
          label: :optional,
          name: :checking_name,
          tag: 13,
          type: :string
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def field_def(:unique_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("uniqueId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end

        def field_def("unique_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "uniqueId",
             kind: {:scalar, 0},
             label: :optional,
             name: :unique_id,
             tag: 1,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:contest_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("contestId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end

        def field_def("contest_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestId",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_id,
             tag: 2,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:contest_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("contestName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 3,
             type: :string
           }}
        end

        def field_def("contest_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestName",
             kind: {:scalar, ""},
             label: :optional,
             name: :contest_name,
             tag: 3,
             type: :string
           }}
        end
      ),
      (
        def field_def(:state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 4,
             type: :uint32
           }}
        end

        def field_def("state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "state",
             kind: {:scalar, 0},
             label: :optional,
             name: :state,
             tag: 4,
             type: :uint32
           }}
        end

        []
      ),
      (
        def field_def(:creator_id) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("creatorId") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
           }}
        end

        def field_def("creator_id") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "creatorId",
             kind: {:scalar, 0},
             label: :optional,
             name: :creator_id,
             tag: 5,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:create_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("createTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :uint32
           }}
        end

        def field_def("create_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "createTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :create_time,
             tag: 6,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:start_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("startTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 7,
             type: :uint32
           }}
        end

        def field_def("start_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 7,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:finish_time) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("finishTime") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 8,
             type: :uint32
           }}
        end

        def field_def("finish_time") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "finishTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :finish_time,
             tag: 8,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:open) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "open",
             kind: {:scalar, false},
             label: :optional,
             name: :open,
             tag: 9,
             type: :bool
           }}
        end

        def field_def("open") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "open",
             kind: {:scalar, false},
             label: :optional,
             name: :open,
             tag: 9,
             type: :bool
           }}
        end

        []
      ),
      (
        def field_def(:contest_type) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("contestType") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 10,
             type: :uint32
           }}
        end

        def field_def("contest_type") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "contestType",
             kind: {:scalar, 0},
             label: :optional,
             name: :contest_type,
             tag: 10,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:public_notice) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :public_notice,
             tag: 11,
             type: :string
           }}
        end

        def field_def("publicNotice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :public_notice,
             tag: 11,
             type: :string
           }}
        end

        def field_def("public_notice") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "publicNotice",
             kind: {:scalar, ""},
             label: :optional,
             name: :public_notice,
             tag: 11,
             type: :string
           }}
        end
      ),
      (
        def field_def(:check_state) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("checkState") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 12,
             type: :uint32
           }}
        end

        def field_def("check_state") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkState",
             kind: {:scalar, 0},
             label: :optional,
             name: :check_state,
             tag: 12,
             type: :uint32
           }}
        end
      ),
      (
        def field_def(:checking_name) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 13,
             type: :string
           }}
        end

        def field_def("checkingName") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 13,
             type: :string
           }}
        end

        def field_def("checking_name") do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "checkingName",
             kind: {:scalar, ""},
             label: :optional,
             name: :checking_name,
             tag: 13,
             type: :string
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
    def default(:unique_id) do
      {:ok, 0}
    end,
    def default(:contest_id) do
      {:ok, 0}
    end,
    def default(:contest_name) do
      {:ok, ""}
    end,
    def default(:state) do
      {:ok, 0}
    end,
    def default(:creator_id) do
      {:ok, 0}
    end,
    def default(:create_time) do
      {:ok, 0}
    end,
    def default(:start_time) do
      {:ok, 0}
    end,
    def default(:finish_time) do
      {:ok, 0}
    end,
    def default(:open) do
      {:ok, false}
    end,
    def default(:contest_type) do
      {:ok, 0}
    end,
    def default(:public_notice) do
      {:ok, ""}
    end,
    def default(:check_state) do
      {:ok, 0}
    end,
    def default(:checking_name) do
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
