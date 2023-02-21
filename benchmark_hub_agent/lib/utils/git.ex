defmodule Git do
  import Commands
  @moduledoc false
  @path "#{Application.compile_env(:benchmark_hub_agent, :home)}/performance-benchmark-stacks"

  def clone(url, branch) do
    if File.exists?(@path) do
      clone_existing(branch)
    else
      clone_new(url, branch)
    end
  end

  def clone_new(url, branch) do
    with {log1, _, 0} <- clone(url),
         {log2, _, 0} <- checkout(branch) do
      normalize([log1, log2])
    else
      other -> normalize(other)
    end
  end

  def clone_existing(branch) do
    with {log1, _, 0} <- checkout(branch),
         {log2, _, 0} <- fetch() do
      normalize([log1, log2])
    else
      other -> normalize(other)
    end
  end

  defp checkout(branch), do: run("git", ["checkout", branch], @path)
  defp fetch(), do: run("git", ["fetch"], @path)
  defp clone(url), do: run("git", ["clone", url])
end
