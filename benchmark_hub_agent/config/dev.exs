import Config

config :benchmark_hub_agent, timezone: "America/Bogota"

config :benchmark_hub_agent,
  container_cli: "podman",
  home: System.get_env("HOME"),
  in_test: false

config :logger,
  level: :debug
