defmodule MnesiaDatabase.MixProject do
  use Mix.Project

  def project do
    [
      app: :mnesia_database,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      included_applications: [:mnesia],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mnesia_rocksdb, git: "https://github.com/aeternity/mnesia_rocksdb"}
    ]
  end
end
