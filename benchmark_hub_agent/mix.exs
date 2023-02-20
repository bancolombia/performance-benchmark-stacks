defmodule BenchmarkHubAgent.MixProject do
  use Mix.Project

  def project do
    [
      app: :benchmark_hub_agent,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      metrics: false,
      releases: [
        agent: [
          include_executables_for: [:unix],
          applications: [runtime_tools: :permanent]
        ],
      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BenchmarkHubAgent.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
