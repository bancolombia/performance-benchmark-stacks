import Config

config :benchmark_hub_agent, timezone: "America/Bogota"

config :benchmark_hub_agent,
  container_cli: "docker",
  home: "/home/ubuntu",
  in_test: false

config :logger,
  level: :warning
