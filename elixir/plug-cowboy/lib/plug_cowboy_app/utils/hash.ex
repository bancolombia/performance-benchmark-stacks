defmodule Utils.Hash do
  @moduledoc false

  def sha256(plain) do
    :crypto.hash(:sha256, plain)
    |> Base.encode16()
  end

end
