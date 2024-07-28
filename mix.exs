defmodule Soulless.MixProject do
  use Mix.Project

  @version "0.2.0-pre"
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
      extra_applications: [:logger, :inets, :ssl]
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
      {:typed_struct, "~> 0.3.0"},
      {:protox, "~> 1.6"},
      {:websockex, "~> 0.4.3"},
      {:castore, "~> 1.0"},
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
      "generate.game":
        "protox.generate --namespace=Soulless.Game --output-path=lib/soulless/game/lq --multiple-files priv/protos/majsoul.proto",
      "update.game": ["fetch.game.proto", "generate.game.proto", "generate.game"],
    ]
  end
end
