defmodule PutItTogether do

  alias IslandsEngine.{Board, Coordinate, Island}

  def run do
    board = Board.new()

    {:ok, square_coord} = Coordinate.new(1, 1)
    {:ok, square} = Island.new(:square, square_coord)

    board = Board.position_island(board, :square, square)

    {:ok, dot_coord} = Coordinate.new(2, 2)
    {:ok, dot} = Island.new(:dot, dot_coord)

    Board.position_island(board, :dot, dot) |> IO.inspect


    {:ok, new_dot_coord} = Coordinate.new(3, 3)
    {:ok, dot} = Island.new(:dot, new_dot_coord)

    board = Board.position_island(board, :dot, dot)


    {:ok, guess_coord} = Coordinate.new(10, 10)

    {:miss, :none, :no_win, board} = Board.guess(board, guess_coord)

    {:ok, hit_coord} = Coordinate.new(1, 1)
    Board.guess(board, hit_coord)


  end

end
