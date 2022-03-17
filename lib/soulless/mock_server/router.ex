defmodule Soulless.MockServer.Router do
  use Plug.Router

  alias Soulless.MockServer.Repo

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["text/*"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  get "/status" do
    send_resp(conn, 200, "ok")
  end

  get "/version.json" do
    version = Repo.get_version()
    body = %{version: version, force_version: version, code: "#{version}/code.js"}
    json(conn, body)
  end

  post "/user/login" do
    with uid when is_binary(uid) <- Map.get(conn.body_params, "uid"),
         token when is_binary(token) <- Map.get(conn.body_params, "token"),
         {:ok, access_token} <- Repo.create_access_token(uid, token) do
      body = %{
        result: 0,
        accessToken: access_token,
        current_timestamp_ms: :os.system_time(:millisecond),
        uid: uid,
        token: token
      }

      json(conn, body)
    else
      # Real server replies with 200 status code on bad requests.
      # Don't ask me why.
      _error -> json(conn, %{result: 1}, 200)
    end
  end

  match _ do
    json(conn, %{error: "not found"}, 404)
  end

  def json(conn, body, code \\ 200) when is_map(body) do
    conn
    |> put_resp_content_type("text/json")
    |> send_resp(code, Jason.encode!(body))
  end
end

