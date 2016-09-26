defmodule MyString do
  def calculate(calc) do
    [_, first, op, second] = Regex.run ~r{^([0-9]+)([+-/*])([0-9]+)}, calc
    {one, _} = Integer.parse(first)
    {two, _} = Integer.parse(second)
    case op do
      "+" -> one+two
      "-" -> one-two
      "*" -> one*two
      "/" -> one/two
    end
  end
end