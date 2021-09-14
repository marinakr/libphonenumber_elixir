defmodule Libphonenumber.MixProject do
  use Mix.Project

  def project do
    [
      app: :libphonenumber,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "Libphonenumber",
      source_url: "https://github.com/marinakr/libphonenumber_elixir",
      homepage_url: "https://github.com/marinakr/libphonenumber_elixir",
      docs: [
        extras: ["README.md"]
      ]
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
      {:libphonenumber_erlang,
       git: "https://github.com/marinakr/libphonenumber_erlang.git", branch: "master"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end
end
