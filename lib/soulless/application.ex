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
            {Soulless.MockServer.Repo, []},
            {Plug.Cowboy,
             scheme: :http,
             plug: Soulless.MockServer.Router,
             options: [port: 8081, dispatch: dispatch()]}
          ]

        [env: :dev] ->
          []

        [_] ->
          []
      end

    opts = [strategy: :one_for_one, name: Soulless.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/socket", Soulless.MockServer.Socket, []},
         {:_, Plug.Cowboy.Handler, {Soulless.MockServer.Router, []}}
       ]}
    ]
  end
end
