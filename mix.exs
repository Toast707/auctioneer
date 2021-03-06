defmodule Auctioneer.Mixfile do
  use Mix.Project

  def project do
    [app: :auctioneer,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Auctioneer, []},
     applications: [:ex_machina, :phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex, :auction_server]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:ex_machina, "~> 0.5"},
      {:plug_cors, "~> 0.7.3"},
      {:phoenix, "~> 1.0.2"},
      {:phoenix_ecto, "~> 1.1"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.1"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:cowboy, "~> 1.0"},
      {:auction_server, path: "../auction_server", env: Mix.env}
    ]
  end
end
