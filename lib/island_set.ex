defmodule IslandsEngine.IslandSet do
  alias IslandsEngine.{Island, IslandSet}

  defstruct atoll: :none, dot: :none, l_shape: :none, s_shape: :none, square: :none

  def start_link() do
    Agent.start_link(fn -> %IslandSet{} end)
  end

  def initialize_set() do
    Enum.reduce(keys(), %IslandSet{}, fn key, acc ->
      {:ok, island} = Island.start_link()
      Map.put(acc, key, island)
    end)
  end

  defp keys() do
    %IslandSet{}
    |> Map.from_struct()
    |> Map.keys()
  end
end
