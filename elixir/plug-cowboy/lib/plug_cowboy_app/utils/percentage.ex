defmodule Utils.Percentage do
  @moduledoc false
  @max 100

  def isInPercentage(@max), do: true
  def isInPercentage(percentage) do
    :rand.uniform(@max) <= percentage
  end

end
