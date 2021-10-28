defmodule Soulless.Client.Auth do
  require Logger

  def get_passport(passport_url, uid, access_token) do
    headers = [{"Content-type", "application/json"}, {"Accept", "application/json"}]
    body = Jason.encode!(%{uid: uid, token: access_token, deviceId: "web|#{uid}"})

    response = HTTPoison.post!(passport_url, body, headers)
    passport = Jason.decode!(response.body)

    Logger.debug("Obtained passport: #{inspect(passport)}")

    passport
  end

  def endpoint(:en = region) do
    with {:ok, version_response} <- HTTPoison.get(version_url(region)),
         {:ok, version_json} <- Jason.decode(version_response.body),
         {:ok, config_response} <- HTTPoison.get(config_url(region, version_json["version"])),
         {:ok, config_json} <- Jason.decode(config_response.body),
         {:ok, servers_response} <- HTTPoison.get(server_list_url_from_config(config_json)),
         {:ok, servers_json} <- Jason.decode(servers_response.body),
         {:maintenance, false} <- {:maintenance, Map.has_key?(servers_json, "maintenance")} do
      {:ok,
       %{
         endpoint_url: "wss://#{List.first(servers_json["servers"])}",
         passport_url: "#{List.first(config_json["yo_service_url"])}/user/login",
         version: String.trim_trailing(version_json["version"], ".w")
       }}
    else
      {:maintenance, true} ->
        {:error, :maintenance}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def endpoint(region) do
    raise "Authentication flow for region '#{String.to_atom(region)}' is not supported"
  end

  defp base_url(:en) do
    "https://mahjongsoul.game.yo-star.com"
  end

  defp version_url(region) do
    "#{base_url(region)}/version.json?randv=#{:rand.uniform(9999999999999999)}"
  end

  defp config_url(region, version) do
    "#{base_url(region)}/v#{version}/config.json"
  end

  defp server_list_url_from_config(config_json) do
    config_json
    |> Map.get("ip")
    |> List.first()
    |> Map.get("region_urls")
    |> List.first()
    |> Map.get("url")
    |> Kernel.<>("?service=ws-gateway&protocol=ws&ssl=true")
  end
end
