import Config

config :perf_analizer,
       url: "http://ip:8080/status",
       request: %{
         method: "GET",
         headers: [],
         body: nil
       },
       execution: %{
         steps: 20,
         increment: 100,
         duration: 10000,
         constant_load: true
       },
       distributed: :master

config :logger,
       level: :warn
