defmodule Soulless.MixProject do
  use Mix.Project

  @version "0.1.4"
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
      deps: deps(),
      aliases: aliases()
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
      links: %{"GitHub" => @source_url},
      exclude_patterns: [
        "flake.nix",
        "flake.lock",
        "lib/example.ex",
        ~r/config\/.*/,
        ~r/priv\/scripts\/.*/
      ]
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Soulless",
      source_ref: "v#{@version}",
      canonical: "https://hexdocs.pm/soulless",
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

  defp aliases do
    [
      "fetch.game.proto": "run priv/scripts/fetch_proto.exs priv/protos/liqi.json",
      "generate.game.proto":
        "run priv/scripts/generate_proto_file.exs priv/protos/liqi.json priv/protos/majsoul.proto",
      "generate.tourney.proto":
        "run priv/scripts/generate_proto_file.exs priv/protos/dhs.json priv/protos/tourney.proto",
      "generate.game":
        "protox.generate --namespace=Soulless.Game --output-path=lib/soulless/game/lq --multiple-files priv/protos/majsoul.proto",
      "generate.tourney":
        "protox.generate --namespace=Soulless.Tourney --output-path=lib/soulless/tourney/lq --multiple-files priv/protos/tourney.proto",
      "update.game": ["fetch.game.proto", "generate.game.proto", "generate.game"],
      "update.tourney": ["generate.tourney.proto", "generate.tourney"]
    ]
  end
end
