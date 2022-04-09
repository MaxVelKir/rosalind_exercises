defmodule LCSM do
  def main do
    {:ok, input} = File.read("source/rosalind_lcsm.txt")

    list =
      input
      |> String.split(">")
      |> Stream.map(&(&1 |> String.trim() |> String.split("\n")))
      |> Stream.filter(&(&1 != ""))
      |> Stream.map(fn [_ | x] -> List.to_string(x) end)
      |> Enum.filter(&(&1 != ""))
  end

  def lcs(strings) do
  end
end
