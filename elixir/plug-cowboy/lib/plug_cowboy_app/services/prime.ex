defmodule Services.Prime do
  import UUID
  import Utils.Hash
  alias SieveOfEratosthenes
  @moduledoc false

  def process(top) do
    SieveOfEratosthenes.get_primes_list(top)
  end

end
