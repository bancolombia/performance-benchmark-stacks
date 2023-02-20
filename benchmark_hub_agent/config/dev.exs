import Config

config :benchmark_hub_agent, timezone: "America/Bogota"

config :benchmark_hub_agent,
  container_cli: "podman",
  in_test: false

config :logger,
  level: :debug
