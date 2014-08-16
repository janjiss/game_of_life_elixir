defmodule Runner do
  def run(board \\ inital_state) do
    board |>
    Enum.each(fn (row)-> IO.inspect(row) end)
    IO.puts ""
    :timer.sleep 1000
    IEx.Helpers.clear
    GameOfLife.run_step(board) |> 
    run
  end

  def inital_state do
    [
      ~w(x o x),
      ~w(x o x),
      ~w(x o x)
    ]
  end
end
