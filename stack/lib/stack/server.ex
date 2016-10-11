defmodule Stack.Server do

  use GenServer

  def handle_call(:pop, _from, current_state) do
    case current_state do
     [head | tail] -> {:reply, head, tail}
    end
  end

  def handle_cast({:push, new_value}, current_state) do
    {:noreply, [new_value | current_state]}
  end
end