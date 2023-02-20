defmodule PercentageTest do
  import Utils.Percentage
  use ExUnit.Case

  test "should be true" do
    assert isInPercentage(100) == true
  end

  test "should be near to percentage" do
    req_percentage = 50
    tolerance = 10
    max = 100
    real = Enum.map(1..max, fn _ -> isInPercentage(req_percentage) end)
           |> Enum.filter(fn isIn -> isIn end)
           |> Enum.count()
    IO.inspect("Expected percentage: #{req_percentage}% real percentage: #{real}%")
    assert real <= req_percentage + tolerance
    assert real >= req_percentage - tolerance
  end
end
