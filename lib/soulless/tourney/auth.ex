defmodule Soulless.Tourney.Auth do
  require Logger

  def endpoint_url(:en = region) do
    with {:ok, config_response} <- HTTPoison.get(config_url(region)),
         {:ok, config_map} <- parse_config(config_response.body),
         mj_dhs_lb <- config_map["MJ_DHS_LB"],
         false <- is_nil(mj_dhs_lb),
         {:ok, servers_response} <- HTTPoison.get(server_list_url(mj_dhs_lb)),
         {:ok, servers_json} <- Jason.decode(servers_response.body),
         server_url <- List.first(servers_json["servers"]),
         false <- is_nil(server_url) do
      {:ok, %{endpoint_url: "wss://#{server_url}", passport_url: passport_url(region)}}
    else
      true -> {:error, :not_found}
      error -> error
    end
  end

  def endpoint_url({:custom, _opts} = region) do
    {:ok, %{endpoint_url: socket_base_url(region), passport_url: passport_url(region)}}
  end

  def endpoint_url(region) do
    raise "Region '#{String.to_atom(region)}' is not supported"
  end

  def passport_url(:en) do
    "https://passport.mahjongsoul.com/user/login"
  end

  def passport_url({:custom, _opts} = region) do
    "#{base_url(region)}/user/login"
  end

  defp base_url(:en) do
    "https://mahjongsoul.tournament.yo-star.com"
  end

  defp base_url({:custom, opts}) do
    Soulless.Auth.test_server_url(opts, false)
  end

  defp socket_base_url({:custom, opts} = _region) do
    url = Soulless.Auth.test_server_url(opts, true)
    "#{url}/socket"
  end

  defp config_url(region) do
    "#{base_url(region)}/dhs/js/config.js"
  end

  defp server_list_url(mj_dhs_lb) do
    "#{mj_dhs_lb}/api/customized_contest/random"
  end

  defp parse_config(config_string) do
    # Input should look something like:
    # (function () {window.__MJ_DHS_URL__ = 'https://mahjongsoul.tournament.yo-star.com/dhs/index.html';window.__MJ_DHS_REDIRECT__ = 'https://mahjongsoul.tournament.yo-star.com/dhs/redirect';window.__MJ_DHS_LB__ = 'https://mjusgs.mahjongsoul.com:7988';window['__MJ_GAME_INFO_API__'] = 'http://mjusgs.mahjongsoul.com:7443';})()

    # Looks for javascript assignments to variables surrounded by __
    # Produces two capture groups per match: one with the name and another with the assigned url literal
    regex = ~r"[\'\[]*__([\w]+)__[\'\]]* = '([.:/\-\w]+)'"

    matches =
      Regex.scan(regex, config_string)
      |> Enum.map(&Enum.drop(&1, 1))
      |> Enum.map(&List.to_tuple/1)
      |> Map.new()

    if Enum.count(matches) > 0 do
      {:ok, matches}
    else
      {:error, :not_found}
    end
  end
end
