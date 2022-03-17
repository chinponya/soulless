defmodule Soulless.MockServer.Repo do
  use Agent

  @version "0.10.86.w"

  def start_link(opts) do
    Agent.start_link(
      fn ->
        %{
          version: @version,
          users: %{},
          tokens: %{},
          sessions: %{}
        }
      end,
      name: opts[:name] || __MODULE__
    )
  end

  def get(key, default \\ nil) do
    Agent.get(__MODULE__, &Map.get(&1, key, default))
  end

  def put(key, value) do
    Agent.update(__MODULE__, &Map.put(&1, key, value))
  end

  def put_in(key, value) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, key, value)
    end)
  end

  def update_with(key, default_value, fun) when is_function(fun, 1) do
    Agent.update(__MODULE__, fn state ->
      Map.update(state, key, default_value, fn value -> fun.(value) end)
    end)
  end

  def get_version() do
    get(:version)
  end

  def add_user(uid, token) do
    update_with(:users, %{}, fn users ->
      Map.put(users, uid, %{uid: uid, token: token})
    end)
  end

  def get_user(uid) do
    user =
      get(:users)
      |> Map.get(uid)

    case user do
      nil -> {:error, :user_does_not_exist}
      user -> {:ok, user}
    end
  end

  defp check_credentials(user, token) do
    if Map.get(user, :token) == token do
      {:ok, token}
    else
      {:error, :invalid_credentials}
    end
  end

  def create_access_token(uid, token) do
    with {:ok, user} <- get_user(uid),
         {:ok, _} <- check_credentials(user, token) do
      access_token = random_token()

      update_with(:tokens, nil, fn tokens ->
        Map.put(tokens, access_token, uid)
      end)

      {:ok, access_token}
    end
  end

  defp random_token(bytes \\ 16) do
    bytes
    |> :crypto.strong_rand_bytes()
    |> Base.encode16(case: :lower)
  end

  def verify_token(uid, token) do
    owner = get(:tokens) |> Map.get(token)

    if owner == uid do
      {:ok, owner}
    else
      {:error, :invalid_token}
    end
  end

  def create_session_token(uid, token) do
    case verify_token(uid, token) do
      {:ok, _} ->
        session_token = UUID.uuid4()

        update_with(:sessions, nil, fn session ->
          Map.put(session, session_token, uid)
        end)

        {:ok, session_token}

      error ->
        error
    end
  end

  def verify_session(session_token) do
    owner = get(:sessions) |> Map.get(session_token)

    if owner do
      {:ok, owner}
    else
      {:error, :invalid_token}
    end
  end
end
