defmodule Runner do
  def run(board \\ random_intial_state) do
    board |>
    Enum.each(fn (row)-> IO.inspect(row) end)
    IO.puts ""
    :timer.sleep 1000
    IEx.Helpers.clear
    GameOfLife.run_step(board) |> 
    run
  end

  def random_intial_state do
    Enum.map(1..10, fn (_)->
      Enum.map(1..10, fn (_) ->
        :random.seed(:os.timestamp)
        if :random.uniform > 0.5 do
          "x"
        else
          "o"
        end
      end)
    end)
  end
end
