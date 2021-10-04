import Config

config :perf_analizer,
       url: "http://ip:8080/prime/100000?percentage=10",
       request: %{
         method: "GET",
         headers: [],
         body: nil
       },
       execution: %{
         steps: 21,
         increment: 10,
         duration: 10000,
         constant_load: false
       },
       distributed: :master

config :logger,
       level: :warn
