defmodule INI do
  def main() do
    {:ok, input} = File.read("source/INI.txt")

    result = %{"A" => 0, "C" => 0, "G" => 0, "T" => 0}

    result =
      input
      |> String.split("")
      |> Enum.filter(fn x -> x != "" and x != "\n" and x != " " end)
      |> Enum.reduce(result, fn x, acc -> Map.update!(acc, x, &(&1 + 1)) end)

    IO.puts("#{result["A"]} #{result["C"]} #{result["G"]} #{result["A"]}")
  end
end
