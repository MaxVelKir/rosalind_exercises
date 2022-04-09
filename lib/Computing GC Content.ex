defmodule GC do
  def main() do
    {:ok, input} = File.read("source/GC.txt")

    [_ | x] =
      input
      |> String.trim()
      |> String.split(">")
      |> Enum.map(fn x -> x |> String.trim() |> String.split("\n") end)

    result =
      x
      |> Stream.map(fn [y | z] ->
        word = Enum.join(z)
        lenTotal = String.length(word)
        word = String.replace(word, "C", "") |> String.replace("G", "")
        percent = (lenTotal - String.length(word)) / lenTotal * 100
        [y, Float.round(percent, 6)]
      end)
      |> Enum.reduce(["", 0], fn [y, z], [accY, accZ] ->
        if z > accZ, do: [y, z], else: [accY, accZ]
      end)

    result
  end
end
