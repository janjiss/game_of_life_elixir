defmodule GameOfLifeTest do
  use ExUnit.Case

  test "ir runs blinker example" do
    initial_state = [
      ~w(x o x),
      ~w(x o x),
      ~w(x o x)
    ]
    first_step = GameOfLife.run_step(initial_state)
    assert(first_step == [
        ~w(x x x),
        ~w(o o o),
        ~w(x x x)
      ]
    )
    second_step = GameOfLife.run_step(first_step)
    assert(second_step == 
      [
        ~w(x o x),
        ~w(x o x),
        ~w(x o x)
      ]
    )
  end

  test "runs toad example" do
    initial_state = [
      ~w(x x x x),
      ~w(x o o o),
      ~w(o o o x),
      ~w(x x x x)
    ]
    first_step = GameOfLife.run_step(initial_state)
    assert(first_step == [
        ~w(x x o x),
        ~w(o x x o),
        ~w(o x x o),
        ~w(x o x x)
      ]
    )
    second_step = GameOfLife.run_step(first_step)
    assert(second_step == 
      [
        ~w(x x x x),
        ~w(x o o o),
        ~w(o o o x),
        ~w(x x x x)
      ]
    )
  end
end
