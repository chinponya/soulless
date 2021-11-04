# credo:disable-for-this-file
defmodule(Soulless.Game.Lq.GamePlayerState) do
  @moduledoc false
  (
    defstruct([])

    (
      @spec default() :: :NULL
      def(default()) do
        :NULL
      end
    )

    @spec encode(atom()) :: integer() | atom()
    [
      (
        def(encode(:NULL)) do
          0
        end

        def(encode("NULL")) do
          0
        end
      ),
      (
        def(encode(:AUTH)) do
          1
        end

        def(encode("AUTH")) do
          1
        end
      ),
      (
        def(encode(:SYNCING)) do
          2
        end

        def(encode("SYNCING")) do
          2
        end
      ),
      (
        def(encode(:READY)) do
          3
        end

        def(encode("READY")) do
          3
        end
      )
    ]

    def(encode(x)) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def(decode(0)) do
        :NULL
      end,
      def(decode(1)) do
        :AUTH
      end,
      def(decode(2)) do
        :SYNCING
      end,
      def(decode(3)) do
        :READY
      end
    ]

    def(decode(x)) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def(constants()) do
      [{0, :NULL}, {1, :AUTH}, {2, :SYNCING}, {3, :READY}]
    end
  )
end