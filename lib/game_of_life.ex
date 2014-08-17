defmodule GameOfLife do
  def run_step(board) do
    do_run_step(board)
  end

  def do_run_step(board) do
    board |> 
    Enum.with_index |>
    Enum.map(fn ({x_axis, y_index})->
      x_axis |>
      Enum.with_index |>
      Enum.map(fn ({cell, x_index})-> 
        transform_cell(cell, board, y_index, x_index)  
      end)
    end)
  end

  def transform_cell(cell, board, y_index, x_index) do
    neighbours = get_all_neigbours(board, y_index, x_index) 
    alive_cell_count 
      = neighbours |>
      Enum.filter(fn (neighbour) -> neighbour == "o" end) |>
      Enum.count
    next_state(cell, alive_cell_count)
  end

  def next_state("o",  alive_cell_count) when alive_cell_count in 2..3 do
    "o"
  end

  def next_state("o", alive_cell_count) when alive_cell_count == 1 or alive_cell_count > 3 do
    "x"
  end

  def next_state("x", alive_cell_count) when alive_cell_count == 3 do
    "o"
  end

  def next_state("x", _) do
    "x"
  end

  def next_state("o", _) do
    "x"
  end


  def get_all_neigbours(board, y_index, x_index) do
    Enum.map(neighbour_coodrdinates, fn({neighbour_y, neighbour_x}) -> 
      neighbour(board, y_index + neighbour_y, x_index + neighbour_x)
    end)
  end

  def neighbour(_, y_index, x_index) when y_index < 0 or x_index < 0 do
    "x"
  end

  def neighbour(board, y_index, x_index) do
    board |>
    Enum.at(y_index, []) |>
    Enum.at(x_index, "x")
  end

  def neighbour_coodrdinates do
    [
      {-1, -1}, {-1, 0}, {-1, 1},
      { 0, -1},          { 0, 1},
      { 1, -1}, { 1, 0}, { 1, 1}
    ]
  end
end
