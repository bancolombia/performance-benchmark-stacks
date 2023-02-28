import Config

config :perf_analyzer,
       url: "http://ip:8080/status",
       request: %{
         method: "GET",
         headers: [],
         body: ""
       },
       execution: %{
         steps: 20,
         increment: 100,
         duration: 10000,
         constant_load: true
       },
       distributed: :master,
       jmeter_report: false

config :logger,
       level: :warn
