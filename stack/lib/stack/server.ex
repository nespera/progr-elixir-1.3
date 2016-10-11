defmodule Stack.Server do

  use GenServer

  def start_link(current_state) do
    GenServer.start_link(__MODULE__, current_state, name: __MODULE__)
  end

  def push(new_value) do
    GenServer.cast(__MODULE__, {:push, new_value})
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def handle_call(:pop, _from, current_state) do
    case current_state do
     [head | tail] -> {:reply, head, tail}
    end
  end

  def handle_cast({:push, new_value}, current_state) do
    {:noreply, [new_value | current_state]}
  end
end