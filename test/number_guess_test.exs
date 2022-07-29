defmodule NUMBER_GUESSTest do
  use ExUnit.Case
  doctest NUMBER_GUESS

  test "greets the world" do
    assert NUMBER_GUESS.hello() == :world
  end
end
