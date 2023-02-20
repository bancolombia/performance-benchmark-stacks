defmodule Files do
  @moduledoc false
  @path "#{System.get_env("HOME")}/config"

  def write_scenario(scenario) do
    with :ok <- File.mkdir_p(@path),
         :ok <- File.write("#{@path}/performance.exs", scenario) do
      {:ok, "File performance.exs created"}
    else
      other -> other
    end
  end

  def read_results(), do: File.read("#{@path}/result.csv")
end
