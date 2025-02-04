defmodule MnesiaDatabaseTest do
  use ExUnit.Case
  doctest MnesiaDatabase

  test "greets the world" do
    assert MnesiaDatabase.hello() == :world
  end
end
