import Config

config :perf_analyzer,
       url: "http://ip:8080/status",
       request: %{
         method: "GET",
         headers: [],
         body: ""
       },
       execution: %{
         steps: 10,
         increment: 50,
         duration: 10000,
         constant_load: false,
         dataset: :none,
         separator: ","
       },
       distributed: :master,
       jmeter_report: false

config :logger,
       level: :warn
