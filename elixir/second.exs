System.cmd("ps", ["aux"])
|> Tuple.to_list()
|> List.first()
|> String.split("\n")
|> Enum.filter(fn el -> Regex.match?(~r/firefox/, el) end)
|> Enum.map(fn el ->
  String.split(el, " ", trim: true)
  |> IO.inspect()

  # |> Enum.at(el, 0)
end)
