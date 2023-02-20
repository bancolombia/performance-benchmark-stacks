defmodule Containers do
  import Commands
  @moduledoc false
  @base_dir "#{System.get_env("HOME")}/performance-benchmark-stacks/stacks/"
  @config_dir "#{System.get_env("HOME")}/config/"
  @docker "podman"

  def start_stack(stack, env) do
    with [language, _framework] <- String.split(stack, "/"),
         {log1, running, 0} <- check_running_docker(),
         {log2, _, 0} <- stop_docker(running),
         {log3, _, 0} <- delete_docker(),
         {log4, _, 0} <- build_docker(stack, language),
         {log5, _, 0} <- start_docker(env) do
      normalize([log1, log2, log3, log4, log5])
    else
      other -> normalize(other)
    end
  end

  def restart_stack() do
    restart_docker() |> normalize()
  end

  def start_performance(image) do
    run(@docker, ["run", "-v", "#{@config_dir}:/app/config", image])
    |> normalize()
  end

  defp check_running_docker() do
    case run(@docker, ["ps", "-q"]) do
      {log, running, 0} ->
        ids =
          String.split(running, "\n")
          |> Enum.filter(&(&1 != ""))

        {log, ids, 0}

      other ->
        other
    end
  end

  defp stop_docker([]), do: {"", "", 0}
  defp stop_docker(running), do: run(@docker, ["stop"] ++ running)

  defp delete_docker() do
    case run(@docker, ["rm", "stack"]) do
      {log, out, 1} -> {log, out, 0}
      other -> other
    end
  end

  defp build_docker(stack, language) do
    run(@docker, [
      "build",
      "-t",
      "stack",
      "-f",
      "#{@base_dir}#{stack}/Dockerfile",
      "#{@base_dir}#{language}"
    ])
  end

  defp start_docker(env),
    do: run(@docker, ["run", "-d"] ++ env ++ ["--name", "stack", "-p", "8080:8080", "stack"])

  defp restart_docker(), do: run(@docker, ["restart", "stack"])
end
