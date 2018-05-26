defmodule MistexTest do
  use ExUnit.Case
  doctest Mistex

  test "greets the world" do
    assert Mistex.hello() == :world
  end
end
