import Config

config :perf_analyzer,
       url: "http://ip:8080/prime/10000",
       request: %{
         method: "GET",
         headers: [],
         body: ""
       },
       execution: %{
         steps: 10,
         increment: 50,
         duration: 10000,
         constant_load: false
       },
       distributed: :master,
       jmeter_report: false

config :logger,
       level: :warn
