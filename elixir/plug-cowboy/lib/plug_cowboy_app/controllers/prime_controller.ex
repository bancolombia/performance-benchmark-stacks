defmodule Controllers.PrimeController do
  import Services.Prime
  import Utils.DelayedTask
  alias Models.LoopStatus
  @moduledoc false

  def primes(percentage, delay, top) do
    times = start(fn -> process(top) end, percentage, delay)
    LoopStatus.ok(times > 0, times)
  end

end
