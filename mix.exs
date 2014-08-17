defmodule GameOfLife.Mixfile do
  use Mix.Project

  def project do
    [app: :game_of_life,
     version: "0.0.1",
     elixir: "~> 0.15.1",
     deps: deps]
  end
  def application do
    [applications: [:logger]]
  end

  def deps do
    []
  end
end
