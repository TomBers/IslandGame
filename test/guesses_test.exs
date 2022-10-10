defmodule GuessesTest do
  use ExUnit.Case

  alias IslandsEngine.{Coordinate, Guesses}

  describe "Adding guesses" do

    test "A hit" do
      guesses = Guesses.new()
      {:ok, coordinate1} = Coordinate.new(8, 3)
      guesses = Guesses.add(guesses, :hit, coordinate1)

      {:ok, coordinate2} = Coordinate.new(9, 7)
      guesses = Guesses.add(guesses, :hit, coordinate2) |> dbg
      assert MapSet.size(guesses.hits) == 2
      assert MapSet.size(guesses.misses) == 0
    end

    test "A miss" do
      guesses = Guesses.new()
      {:ok, coordinate1} = Coordinate.new(8, 3)
      guesses = Guesses.add(guesses, :miss, coordinate1) |> dbg
      assert MapSet.size(guesses.hits) == 0
      assert MapSet.size(guesses.misses) == 1
    end

  end

end
