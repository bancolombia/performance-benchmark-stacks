defmodule Controllers.StatusController do
  alias Models.Status
  @moduledoc false

  def status do
    Status.up()
  end

end
