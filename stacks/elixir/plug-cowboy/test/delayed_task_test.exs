defmodule DelayedTaskTest do
  alias Utils.DelayedTask
  use ExUnit.Case

  test "should run" do
    percentage = 100
    delay = 100
    times = DelayedTask.start(fn -> 10 / 50.0 end, percentage, delay)
    IO.inspect("Executed: #{times} times")
    assert times > 0
  end

  test "should run exactly one time" do
    percentage = 100
    delay = 0
    times = DelayedTask.start(fn -> 10 / 50.0 end, percentage, delay)
    assert times == 1
  end
end
