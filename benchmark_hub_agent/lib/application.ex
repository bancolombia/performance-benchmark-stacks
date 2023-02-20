defmodule BenchmarkHubAgent.Application do
  alias BenchmarkHubAgent.Config.{AppConfig, ConfigHolder}

  use Application
  require Logger
  @env Mix.env()

  def start(_type, _args) do
#    config = AppConfig.load_config()

    children = all_env_children() ++ env_children(@env)

    opts = [strategy: :one_for_one, name: BenchmarkHubAgent.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def all_env_children() do
    [
      {ConfigHolder, AppConfig.load_config()},
      {Task.Supervisor, name: AsyncTask.Supervisor},
      RemoteAgent
    ]
  end

  def env_children(:test) do
    []
  end

  def env_children(_other_env) do
    []
  end
end
