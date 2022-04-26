defmodule Second do
  def exec() do
    System.cmd("ps", ["aux"])
    |> Tuple.to_list()
    |> List.first()
    |> String.split("\n")
    |> Enum.filter(fn el -> Regex.match?(~r/firefox/, el) end)
    |> Enum.map(fn el ->
      String.split(el, " ", trim: true)
      |> process_list()
      |> IO.puts()
    end)
  end

  defp process_list(list) when is_list(list) and list > 3 do
    # [head | tail] = list
    # IO.puts(head)
    # process_list(tail)
    %{user: Enum.fetch!(list, 0), pid: Enum.fetch!(list, 1)}
  end
end

Second.exec()
