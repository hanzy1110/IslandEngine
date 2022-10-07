defmodule IslandsEngine.Rules do
  @behaviour :gen_statem
  alias IslandsEngine.Rules

  def init(:ok) do
    {:ok, :initialized, []}
  end

  def callback_mode, do: :state_functions

  def code_change(_vsn, state_name, state_data, _extra) do
    {:ok, state_name, state_data}
  end

  def terminate(_reason, _state, _data), do: :nothing

  def initialized({:call, from}, :add_player, state_data) do
    {:next_state, :players_set, state_data, {:reply, from, :ok}}
  end

  def initialized({:call, from}, :show_current_state, state_data) do
    {:keep_state_and_data, :players_set, state_data, {:reply, from, :ok}}
  end

  def initialized({:call, from}, _, _state_data) do
    {:keep_state_and_data, {:reply, from, :error}}
  end

  def players_set({:call, from}, {:move_island, player}, state_data) do
    case Map.get(state_data, player) do
      :islands_not_set ->
        {:keep_state_and_data, {:reply, from, :ok}}

      :islands_set ->
        {:keep_state_and_data, {:reply, from, :error}}
    end
  end

  def start_link do
    :gen_statem.start_link(__MODULE__, :initialized, [])
  end
end
