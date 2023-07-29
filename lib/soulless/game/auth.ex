defmodule Soulless.Game.Auth do
  require Logger

  def endpoint(:en = region) do
    with {:ok, version_json} <- version(region),
         {:ok, config_json} <- config(region, version_json["version"]),
         {:ok, servers_json} <- server_list(config_json) do
      {:ok,
       %{
         endpoint_url: "wss://#{List.first(servers_json["servers"])}",
         passport_url: "#{List.first(config_json["yo_service_url"])}/user/login",
         version: String.trim_trailing(version_json["version"], ".w")
       }}
    else
      error -> error
    end
  end

  def endpoint({:custom, _opts} = region) do
    with {:ok, version_json} <- version(region) do
      {:ok,
       %{
         endpoint_url: socket_base_url(region),
         passport_url: "#{base_url(region)}/user/login",
         version: String.trim_trailing(version_json["version"], ".w")
       }}
    else
      error -> error
    end
  end

  def endpoint(region) do
    raise "Region '#{String.to_atom(region)}' is not supported"
  end

  def version(region) do
    with {:ok, version_response} <- Soulless.HTTP.get(version_url(region)) do
      Jason.decode(version_response.body)
    else
      error -> error
    end
  end

  def config(region, version) do
    with {:ok, config_response} <- Soulless.HTTP.get(config_url(region, version)) do
      Jason.decode(config_response.body)
    else
      error -> error
    end
  end

  def server_list(config_json) when is_map(config_json) do
    server_list(server_list_url_from_config(config_json))
  end

  def server_list(server_list_url) when is_binary(server_list_url) do
    with {:ok, servers_response} <- Soulless.HTTP.get(server_list_url),
         {:ok, servers_json} <- Jason.decode(servers_response.body),
         {:maintenance, false} <- {:maintenance, Map.has_key?(servers_json, "maintenance")} do
      {:ok, servers_json}
    else
      {:maintenance, true} -> {:error, :maintenance}
      error -> error
    end
  end

  defp base_url(:en) do
    "https://mahjongsoul.game.yo-star.com"
  end

  defp base_url({:custom, opts}) do
    Soulless.Auth.test_server_url(opts, false)
  end

  defp version_url(region) do
    "#{base_url(region)}/version.json?randv=#{:rand.uniform(9_999_999_999_999_999)}"
  end

  defp config_url(region, version) do
    "#{base_url(region)}/v#{version}/config.json"
  end

  defp socket_base_url({:custom, opts} = _region) do
    url = Soulless.Auth.test_server_url(opts, true)
    "#{url}/socket"
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
