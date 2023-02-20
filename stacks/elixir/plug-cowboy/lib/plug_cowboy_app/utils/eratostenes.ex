defmodule SieveOfEratosthenes do
  @moduledoc """
  Implements Sieve of Eratosthenes algorithm for finding all prime numbers up to the given limit.
  Uses Elixir Map to store the list of odd integers for sieving.
  Taken from: https://github.com/ybod/elixir_primes
  """

  alias Helper.Sequence

  @doc """
  Returns the list of the prime numbers up to the given limit. Limit must be integer and larger than 0.

  ## Examples

     iex> SieveOfEratosthenes.get_primes_list(10)
     [2, 3, 5, 7]
  """
  @spec get_primes_list(pos_integer) :: [pos_integer]
  def get_primes_list(limit) when limit == 2, do: [2]
  def get_primes_list(limit) when limit < 2, do: []
  def get_primes_list(limit) when limit > 2 do
    map =
      Sequence.get_odd(3, limit)
      |> Map.new(&{&1, :prime})

    sieve(map, 3, limit)
  end

  # Sieving: all primes already found, no need to look further
  defp sieve(map, odd_num, limit) when odd_num * odd_num > limit, do: get_primes(map)

  # Check if the next odd number can be found as a Map key.
  # If found - it's a prime number and we need to remove all multiples of this prime from Map.
  defp sieve(map, odd_num, limit) do
    new_map =
      if Map.has_key?(map, odd_num), do: delete_composite(odd_num, map, limit), else: map

    sieve(new_map, odd_num + 2, limit)
  end


  defp get_primes(map) do
    primes =
      Map.keys(map)
      |> Enum.sort()

    [2 | primes]
  end


  defp delete_composite(first, map, limit) do
    composite_nums = Sequence.get(first * first, limit, 2 * first)
    Map.drop(map, composite_nums)
  end
end

defmodule Helper.Sequence do
  @moduledoc """
    Helper functions for generating sequence of integers
  """

  import Integer, only: [is_odd: 1]

  @doc """
  Returns the sequence of the odd integers starting from the first element and up to the given limit. First element must be 1 or greater!
  ## Examples
     iex> Helper.Sequence.get_odd(3, 20)
     [3, 5, 7, 9, 11, 13, 15, 17, 19]
  """
  @spec get_odd(pos_integer, pos_integer) :: [pos_integer]
  def get_odd(first, limit)
      when is_odd(first) and first > 0 and limit >= first,
      do: :lists.seq(first, limit, 2)

  @doc """
  Returns the sequence of integers starting from the first element and up to the given limit with the specified increment.
  ## Examples
     iex> Helper.Sequence.get(1, 26, 3)
     [1, 4, 7, 10, 13, 16, 19, 22, 25]
  """
  @spec get(pos_integer, pos_integer, pos_integer) :: [pos_integer]
  def get(first, limit, incr) when first + incr > limit, do: [first]
  def get(first, limit, incr), do: :lists.seq(first, limit, incr)
end
