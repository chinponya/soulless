defmodule Soulless.Application do
  use Application

  @impl true
  def start(_type, args) do
    children =
      case args do
        [env: :prod] ->
          []

        [env: :test] ->
          [
            Soulless.MockServer
          ]

        [env: :dev] ->
          []

        [_] ->
          []
      end

    opts = [strategy: :one_for_one, name: Soulless.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
