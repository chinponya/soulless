defmodule FetchProto do
  def run([output_file]) do
    version_response = Soulless.HTTP.get!(version_url())
    version = Jason.decode!(version_response.body)["version"]
    res_response = Soulless.HTTP.get!(res_url(version))
    liqi_version = Jason.decode!(res_response.body)["res"]["res/proto/liqi.json"]["prefix"]
    liqi_response = Soulless.HTTP.get!(liqi_url(liqi_version))

    File.write!(output_file, liqi_response.body)
    IO.puts("Downloaded proto version #{liqi_version} to '#{output_file}'")
  end

  def base_url() do
    "https://mahjongsoul.game.yo-star.com"
  end

  def version_url() do
    "#{base_url()}/version.json?randv=#{:rand.uniform(9_999_999_999_999_999)}"
  end

  def res_url(version) do
    "#{base_url()}/resversion#{version}.json"
  end

  def liqi_url(version) do
    "#{base_url()}/#{version}/res/proto/liqi.json"
  end
end

FetchProto.run(System.argv())
