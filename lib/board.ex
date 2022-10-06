defmodule IslandEngine.Board do
  def start_link() do
    Agent.start_link(fn -> %{} end)
  end

  @letters ~W(a b c d e f g h i j)
  @numbers [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  defp keys() do
    for letter <- @letters, number <- @numbers do
      String.to_atom("#{letter}#{number}")
    end
  end

  defp initialize_board() do
    Enum.reduce(keys(), %{}, fn(key, board)->)
  end
end
