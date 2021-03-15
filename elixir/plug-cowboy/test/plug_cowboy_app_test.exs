defmodule PlugCowboyAppTest do
  use ExUnit.Case
  doctest PlugCowboyApp

  test "greets the world" do
    assert PlugCowboyApp.hello() == :world
  end
end
