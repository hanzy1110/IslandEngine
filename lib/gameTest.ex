defmodule IslandsEngine.Test do
  def main() do
    alias IslandsEngine.{Game, Rules}

    {:ok, game} = Game.start_link("Greeg")

    state = Game.call_demo(game)
    IO.puts(Rules.show_current_state(state.fsm))
    Game.add_player(game, "Betty")

    Game.set_island_coordinates(game, :player1, :atoll, [:a1])
    Game.set_island_coordinates(game, :player1, :square, [:a1])
    Game.set_island_coordinates(game, :player1, :l_shape, [:a1])
    Game.set_island_coordinates(game, :player1, :s_shape, [:a1])

    Game.set_island_coordinates(game, :player2, :s_shape, [:b10])

    Game.set_islands(game, :player1)
    Game.set_islands(game, :player2)

    IO.puts(Rules.show_current_state(state.fsm))

    Game.guess_coordinate(game, :player1, :d1)
    IO.puts(Rules.show_current_state(state.fsm))
    Game.guess_coordinate(game, :player2, :a1)

    IO.puts(Rules.show_current_state(state.fsm))
  end
end
