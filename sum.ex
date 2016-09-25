defmodule Sum do
  def oneTo(0), do: 0
  def oneTo(n), do: n + oneTo(n-1)
end