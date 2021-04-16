defmodule Services.Hash do
  import UUID
  import Utils.Hash
  @moduledoc false

  def process do
    uuid4()
    |> sha256()
  end

end
