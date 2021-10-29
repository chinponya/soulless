defmodule Soulless.MixProject do
  use Mix.Project

  def project do
    [
      app: :soulless,
      name: "Soulless",
      version: "0.1.0",
      elixir: "~> 1.12",
      description: "Mahjong Soul API client",
      source_url: "https://github.com/chinponya/soulless",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
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
      {:nimble_parsec, "~> 1.1"}
    ]
  end
end
