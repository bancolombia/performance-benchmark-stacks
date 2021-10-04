defmodule SieveOfEratosthenesTest do
  use ExUnit.Case

  test "should get primes" do
    assert SieveOfEratosthenes.get_primes_list(10) == [2, 3, 5, 7]
  end

end
