defmodule FuctionalTest do
  use ExUnit.Case
  doctest Fuctional

  test "greets the world" do
    assert Fuctional.hello() == :world
  end
end
