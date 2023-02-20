defmodule Commands do
  @moduledoc false

  def run(cmd, args, cd \\ "#{System.get_env("HOME")}") do
    log = "Running '#{cmd} #{Enum.join(args, " ")}'"
    Mix.shell().info([:green, log])

    case System.cmd(cmd, args, cd: cd) do
      {output, code} ->
        Mix.shell().info([:green, "Code: #{code}"])
        {"#{log}\n#{output}", output, code}
    end
  end

  def normalize({log, _, 0}), do: {:ok, log}
  def normalize({log, _out, code}), do: {:error, "code: #{code}\n\n#{log}"}
  def normalize(logs) when is_list(logs), do: {:ok, Enum.join(logs, "\n\n")}
end
