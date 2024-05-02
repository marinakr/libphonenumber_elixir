defmodule Libphonenumber.MixProject do
  use Mix.Project

  def project do
    [
      app: :libphonenumber,
      version: "0.1.1",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),

      # Docs
      name: "Libphonenumber",
      source_url: "https://github.com/marinakr/libphonenumber_elixir",
      homepage_url: "https://github.com/marinakr/libphonenumber_elixir",
      package: package(),
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  defp description() do
    "Elixir partial version of [libphonenumber](https://github.com/googlei18n/libphonenumber) by Google "
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
      {:libphonenumber_erlang, "~> 0.2.1"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "github" => "https://github.com/marinakr/libphonenumber_elixir"
      }
    ]
  end
end
