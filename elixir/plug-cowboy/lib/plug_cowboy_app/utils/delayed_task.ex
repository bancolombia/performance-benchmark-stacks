defmodule Utils.DelayedTask do
  import Utils.Percentage
  @moduledoc false
  def start(fun, percentage, delay) do
    start_int(fun, isInPercentage(percentage), delay)
  end

  defp start_int(_fun, _applied = false, _delay), do: 0
  defp start_int(fun, _applied = true, _delay = 0) do
    fun.()
    1
  end
  defp start_int(fun, _applied = true, delay) do
    now = :os.system_time(:millisecond)
    loop(now + delay, now, 0, fun)
  end

  defp loop(end_at, now, times, _fun) when end_at <= now, do: times
  defp loop(end_at, _now, times, fun) do
    fun.()
    loop(end_at, :os.system_time(:millisecond), times + 1, fun)
  end

end
