defmodule BenchmarkHubAgent.Config.AppConfig do

  @moduledoc """
   Provides strcut for app-config
  """

   defstruct [
     :sample
   ]

   def load_config do
     %__MODULE__{
       sample: load(:enable_server)
     }
   end

   defp load(property_name), do: Application.get_env(:benchmark_hub_agent, property_name, false)
 end
