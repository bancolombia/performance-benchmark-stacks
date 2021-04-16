defmodule Controllers.CryptController do
  import Services.Crypt
  import Utils.DelayedTask
  alias Models.LoopStatus
  @moduledoc false

  def hash(percentage, delay) do
    times = start(&process/0, percentage, delay)
    LoopStatus.ok(times > 0, times)
  end

end
