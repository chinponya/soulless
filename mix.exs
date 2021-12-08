defmodule Soulless.MixProject do
  use Mix.Project

  @version "0.1.1"
  @source_url "https://github.com/chinponya/soulless"

  def project do
    [
      app: :soulless,
      name: "Soulless",
      version: @version,
      elixir: "~> 1.12",
      description: "Mahjong Soul API client",
      start_permanent: Mix.env() == :prod,
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      licenses: ["AGPL-3.0-only"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Soulless",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/soulless",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:protox, "~> 1.6"},
      {:websockex, "~> 0.4.3"},
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:uuid, "~> 1.1"},
      {:nimble_parsec, "~> 1.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
