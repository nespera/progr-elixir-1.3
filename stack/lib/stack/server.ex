defmodule Stack.Server do

  use GenServer

  def handle_call(:pop, _from, current_state) do
    case current_state do
     [head | tail] -> {:reply, head, tail}
    end
  end
end