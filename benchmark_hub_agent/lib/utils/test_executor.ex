defmodule TestExecutor do
  @moduledoc false

  def start_test(scenario, image, replier) do
    output = Files.write_scenario(scenario)

    Task.Supervisor.async(AsyncTask.Supervisor, fn ->
      case Containers.start_performance(image) do
        {:ok, _log} -> Files.read_results() |> replier.()
        other -> replier.(other)
      end
    end)

    output
  end
end
