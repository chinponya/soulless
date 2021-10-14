defmodule Soulless.Application do
  use Application

  def start(_type, _args) do
    children = [
      Soulless.Client
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
