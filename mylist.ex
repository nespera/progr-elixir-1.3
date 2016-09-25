defmodule MyList do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum([], _), do: 0
  def mapsum([head | tail], f), do: f.(head) + mapsum(tail, f)

  def max([]), do: raise "Cannot find max of empty list"
  def max(list), do: _max(list, 0)
  defp _max([], maxval), do: maxval
  defp _max([head | tail], maxval) when head > maxval, do: _max(tail, head)
  defp _max([head | tail], maxval), do: _max(tail, maxval)
end