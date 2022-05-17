defmodule Fib do
  def fib do
  end

  def f(arg), do: IO.inspect(arg)
end

System.argv()
|> Enum.inspect(&Fib.f/1)
