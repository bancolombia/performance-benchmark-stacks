defmodule Controllers.HashController do
  import Services.Hash
  import Utils.DelayedTask
  alias Models.LoopStatus
  @moduledoc false

  def hash(percentage, delay) do
    times = start(&process/0, percentage, delay)
    LoopStatus.ok(times > 0, times)
  end

end
