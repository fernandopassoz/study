defmodule Commandline.CLI do
  def main(args) do
    options = [switches: [number: :string], aliases: [n: :string]]
    {opts, _, _} = OptionParser.parse(args, options)
    IO.inspect(opts, label: "Command Line Arguments")
    IO.inspect(args, label: "Arguments")
  end
end
