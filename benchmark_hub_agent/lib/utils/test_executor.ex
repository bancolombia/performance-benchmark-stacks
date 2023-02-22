defmodule TestExecutor do
  @moduledoc false

  def start_test(scenario, image, replier) do
    output = Files.write_scenario(scenario)

    Task.Supervisor.async(AsyncTask.Supervisor, fn ->
      with {:ok, log} <- Containers.start_performance(image),
           {:ok, results} <- Files.read_results() do
        replier.({:test_results, results})
      else
        other -> replier.(other)
      end
    end)

    output
  end
end
