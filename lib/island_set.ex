defmodule IslandsEngine.IslandSet do
  alias IslandsEngine.{Island, IslandSet}

  defstruct atoll: :none, dot: :none, l_shape: :none, s_shape: :none, square: :none

  def start_link() do
    Agent.start_link(fn -> initialize_set() end)
  end

  defp initialize_set() do
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

  def to_string(island_set) do
    "%IslandSet{" <> string_body(island_set) <> "}"
  end

  defp string_body(island_set) do
    Enum.reduce(keys(), "", fn key, acc ->
      nil
    end)
  end
end
