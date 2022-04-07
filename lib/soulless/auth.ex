defmodule Soulless.Auth do
  def get_passport(passport_url, uid, access_token) do
    headers = [{"Content-type", "application/json"}, {"Accept", "application/json"}]
    body = Jason.encode!(%{uid: uid, token: access_token, deviceId: "web|#{uid}"})

    with {:ok, response} <- HTTPoison.post(passport_url, body, headers),
         {:ok, json} <- Jason.decode(response.body) do
      json
    else
      {:error, %Jason.DecodeError{}} -> {:error, :ip_banned}
      error -> error
    end
  end
end
