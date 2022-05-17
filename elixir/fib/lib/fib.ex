defmodule Fib do
  def main(args) do
    [head] = args
    fib(String.to_integer(head))
  end

  defp fib(value) do
    a = 0
    b = 1
    IO.puts(a)
    fib(a, b, value)
  end

  defp fib(a, b, value) when b <= value do
    o = a
    a = b
    b = a + o
    IO.puts(a)
    fib(a, b, value)
  end

  defp fib(_, b, value) when b > value do
  end
end
