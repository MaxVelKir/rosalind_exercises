defmodule GRPH do
  def main do
    {:ok, input} = File.read("source/GRPH.txt")

    [_ | dnaString] =
      input
      |> String.trim()
      |> String.split(">")
      |> Enum.map(fn x -> x |> String.trim() |> String.split("\n") end)

    dnaString
    |> Stream.map(fn [x | y] -> [x, List.to_string(y) |> String.split_at(3)] end)
    |> Enum.map(fn [x | [y]] ->
      [x, {elem(y, 0), elem(y, 1) |> String.slice(-3, String.length(elem(y, 1)))}]
    end)
    |> loop([])
    |> Enum.reverse()
    |> Enum.each(fn x -> IO.puts("#{elem(x, 0)} #{elem(x, 1)}") end)
  end

  def loop(dnaString, result) do
    [comparator | tail] = dnaString

    if(tail == []) do
      result
    else
      tempName = comparator |> List.first()
      tempCharL = comparator |> List.last() |> elem(1)
      tempCharF = comparator |> List.last() |> elem(0)

      result =
        Enum.reduce(tail, result, fn x, acc ->
          if x |> List.last() |> elem(1) == tempCharF do
            [{List.first(x), tempName} | acc]
          end

          if x |> List.last() |> elem(0) == tempCharL do
            [{tempName, List.first(x)} | acc]
          else
            acc
          end
        end)

      loop(tail, result)
    end
  end
end
