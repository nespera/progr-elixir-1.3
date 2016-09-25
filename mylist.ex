defmodule MyList do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def mapsum([], _), do: 0
  def mapsum([head | tail], f), do: f.(head) + mapsum(tail, f)
end