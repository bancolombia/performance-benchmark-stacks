import Config

config :benchmark_hub_agent, timezone: "America/Bogota"

config :benchmark_hub_agent,
  container_cli: "docker",
  in_test: false

config :logger,
  level: :warning
