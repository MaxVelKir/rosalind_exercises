defmodule CONS do
  def main do
    profile = %{
      "A" => %{},
      "C" => %{},
      "G" => %{},
      "T" => %{}
    }

    {:ok, input} = File.read("source/CONS.txt")

    [_ | dnaStrings] =
      input
      |> String.trim()
      |> String.split(">")
      |> Stream.map(fn x -> x |> String.trim() |> String.split("\n") end)
      |> Enum.map(fn [_ | x] -> x end)

    dnaStrings = Enum.map(dnaStrings, fn x -> [List.to_string(x)] end)

    length = List.first(dnaStrings) |> List.first() |> String.length()

    profile = Map.put(profile, "A", fillDaMap(%{}, length - 1))
    profile = Map.put(profile, "C", fillDaMap(%{}, length - 1))
    profile = Map.put(profile, "G", fillDaMap(%{}, length - 1))
    profile = Map.put(profile, "T", fillDaMap(%{}, length - 1))

    dnaStrings =
      dnaStrings
      |> Stream.map(fn [x] -> x |> String.split("") |> Enum.filter(fn y -> y != "" end) end)
      |> Stream.map(fn x -> Enum.with_index(x) end)
      |> Enum.reduce(profile, fn x, acc -> loop(x, acc) end)

    s = "" |> loop2(length - 1, dnaStrings)
  end

  def loop2(s, iterator, dnaStrings) when iterator >= 0 do
    list = [
      dnaStrings["A"][iterator],
      dnaStrings["C"][iterator],
      dnaStrings["G"][iterator],
      dnaStrings["T"][iterator]
    ]

    max = list |> Enum.max()

    list
    |> Enum.find_index(fn x -> x == max end)
    |> case do
      0 -> loop2(s <> "A", iterator - 1, dnaStrings)
      1 -> loop2(s <> "C", iterator - 1, dnaStrings)
      2 -> loop2(s <> "G", iterator - 1, dnaStrings)
      3 -> loop2(s <> "T", iterator - 1, dnaStrings)
    end
  end

  def loop2(s, _, dnaStrings) do
    IO.puts(s |> String.reverse())

    IO.puts(
      Map.values(dnaStrings["A"])
      |> Enum.reduce("A:", fn x, acc -> acc <> " " <> to_string(x) end)
    )

    IO.puts(
      Map.values(dnaStrings["C"])
      |> Enum.reduce("C:", fn x, acc -> acc <> " " <> to_string(x) end)
    )

    IO.puts(
      Map.values(dnaStrings["G"])
      |> Enum.reduce("G:", fn x, acc -> acc <> " " <> to_string(x) end)
    )

    IO.puts(
      Map.values(dnaStrings["T"])
      |> Enum.reduce("T:", fn x, acc -> acc <> " " <> to_string(x) end)
    )
  end

  def loop([], profile) do
    profile
  end

  def loop([x | dnaString], profile) do
    case elem(x, 0) do
      "A" -> loop(dnaString, Map.update!(profile, "A", fn oldV -> newV(oldV, elem(x, 1)) end))
      "T" -> loop(dnaString, Map.update!(profile, "T", fn oldV -> newV(oldV, elem(x, 1)) end))
      "C" -> loop(dnaString, Map.update!(profile, "C", fn oldV -> newV(oldV, elem(x, 1)) end))
      "G" -> loop(dnaString, Map.update!(profile, "G", fn oldV -> newV(oldV, elem(x, 1)) end))
    end
  end

  def newV(oldV, iterator) do
    Map.update!(oldV, iterator, fn y -> y + 1 end)
  end

  def fillDaMap(profile, iterator) when iterator >= 0 do
    fillDaMap(Map.put(profile, iterator, 0), iterator - 1)
  end

  def fillDaMap(profile, iterator) do
    profile
  end
end
