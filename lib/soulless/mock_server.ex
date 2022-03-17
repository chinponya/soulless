defmodule Soulless.MockServer do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    env =
      Application.get_application(__MODULE__)
      |> Application.get_env(__MODULE__)

    port = Keyword.get(env, :port, 8081)
    router = Keyword.get(env, :router, __MODULE__.Router)
    socket = Keyword.get(env, :socket, __MODULE__.Socket)

    children = [
      {Soulless.MockServer.Repo, []},
      {Plug.Cowboy,
       scheme: :http,
       plug: Soulless.MockServer.Router,
       options: [port: port, dispatch: dispatch(router, socket)]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  defp dispatch(router, socket) do
    [
      {:_,
       [
         {"/socket", socket, []},
         {:_, Plug.Cowboy.Handler, {router, []}}
       ]}
    ]
  end
end
