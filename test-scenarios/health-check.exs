use Mix.Config

config :perf_analizer,
       url: "http://ip:8080/status",
       request: %{
         method: "GET",
         headers: [],
         body: nil
       },
       execution: %{
         steps: 10,
         increment: 50,
         duration: 10000,
         constant_load: false
       },
       distributed: :master

config :logger,
       level: :warn
