defmodule Commands do
  @moduledoc false
  require Logger

  def run(cmd, args, cd \\ "#{System.get_env("HOME")}") do
    log = "Running '#{cmd} #{Enum.join(args, " ")}'"
    Logger.info(log)

    case System.cmd(cmd, args, cd: cd) do
      {output, code} ->
        Logger.info("Code: #{code}")
        {"#{log}\n#{output}", output, code}
    end
  end

  def normalize({log, _, 0}), do: {:ok, log}
  def normalize({log, _out, code}), do: {:error, "code: #{code}\n\n#{log}"}
  def normalize(logs) when is_list(logs), do: {:ok, Enum.join(logs, "\n\n")}
end
