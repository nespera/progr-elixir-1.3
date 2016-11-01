defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "can pop values" do
    Stack.Server.start_link([1])
    assert Stack.Server.pop == 1
    Stack.Server.stop
  end

  test "can push and pop values" do
    Stack.Server.start_link([])
    Stack.Server.push(23)
    assert Stack.Server.pop == 23
    Stack.Server.stop
  end

end
