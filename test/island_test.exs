defmodule IslandTest do
  use ExUnit.Case

  alias IslandsEngine.{Coordinate, Island}

  describe "creating the different islands" do
    test "making an l-shape" do
      {:ok, coordinate} = Coordinate.new(4, 6)
      {:ok, island} = Island.new(:l_shape, coordinate) |> dbg
      assert MapSet.size(island.coordinates) == 4
      assert MapSet.size(island.hit_coordinates) == 0
    end

    test "trying to make an island out of bounds" do
      {:ok, coordinate} = Coordinate.new(9, 9)
      res = Island.new(:l_shape, coordinate) |> dbg
      assert res == {:error, :invalid_coordinate}
    end
  end

end
