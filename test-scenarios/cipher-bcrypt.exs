import Config

config :perf_analizer,
       url: "http://ip:8080/crypt",
       request: %{
         method: "GET",
         headers: [],
         body: nil
       },
       execution: %{
         steps: 50,
         increment: 1,
         duration: 5000,
         constant_load: false
       },
       distributed: :master

config :logger,
       level: :warn
