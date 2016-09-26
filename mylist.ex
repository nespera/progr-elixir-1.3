defmodule MyList do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum([], _), do: 0
  def mapsum([head | tail], f), do: f.(head) + mapsum(tail, f)

  def max([]), do: raise "Cannot find max of empty list"
  def max(list), do: _max(list, 0)
  defp _max([], maxval), do: maxval
  defp _max([head | tail], maxval) when head > maxval, do: _max(tail, head)
  defp _max([_head | tail], maxval), do: _max(tail, maxval)

  def caesar([], _n), do: []
  def caesar([head | tail], n), do: [_caesar(head + n) | caesar(tail, n)]
  defp _caesar(char) when char <= ?z, do: char
  defp _caesar(char), do: _caesar(char - 26)

  def flatten([]), do: []
  def flatten([h | t]) when is_list(h), do: flatten(h) ++ flatten(t)
  def flatten([h | t]), do: [h | flatten(t)]
end