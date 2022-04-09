defmodule SUBS do

    @s "CCCGCCCTGGCGCCCTGCCGCCCTGCTTAGCATGCGCCCTGCTTCCGCCCTGCAGGAACCGTTCGCCCTGGGCTCGCCCTGTCCGCCCTGTATCGCCCTGTACGCCCTGTGCGCCCTGCGGCCGCCCTGTACGCCCTGCCTCCGCCCTGGTGGCGACGCCCTGCGCCCTGGTAGCGCCCTGGCGCCCTGGTCCGCCCTGGTTCTCGCCCTGACGCCCTGTTCGCCCTGCCACGCCCTGGCCGCCCTGTCGCCCTGGACGCCCTGACGCCCTGCTTGCCACGCCCTGCGCCCTGATGCTTTCGCCCTGCCGCCCTGCGCCCTGCGCCCTGCGCCCTGGCGCCCTGCCGCCCTGTCTCCTAACCCATCGCCCTGGTCTCGCCCTGAGCCGGGCTGCGCCCTGCGCCCTGAGCACGCCCTGCGCCCTGGGCACGCCCTGTCTGAATCGCCCTGCTCGCCCTGCGCCCTGTCGCCCTGGCCGCCCTGCCCGCCCTGGGTCGCCCTGGAGCGCCCTGACGCCCTGATCAAACCGCCCTGCGCCCTGTTTCAAATTCGCCCTGTCTGCGCCCTGCGCCCTGGCAGCGCGCCCTGCATGGCGCCCTGCACGGCACGCCCTGCGCCCTGCGCCCTGCGCCCTGTCGCCCTGACAGCTTAACGGATTGTAGTGTACGCCCTGACCGCCCTGTCCGCCCTGTCTAGTGTCAATGCGCCCTGCCGCCCTGGGTGGACTTCGCCCTGTCGCCCTGCGCCCTGCGCCCTGCCCCGCCCTGACGTTCAGCTAGCTTACGCCCTGGCGCCCTGCGAACCGCCCTGGTATCGCCCTGTTACGCCCTGC"
    @t "CGCCCTGCG"

    @lengthS String.length(@s)
    @lengthT String.length(@t)

  def main(s \\ @s, t \\ @t) do

    s = String.split(s, "") |> Stream.filter(fn x -> x != "" end) |> Enum.reduce({}, fn x, acc -> Tuple.append(acc, x) end)
    t = String.split(t, "") |> Stream.filter(fn x -> x != "" end) |> Enum.reduce({}, fn x, acc -> Tuple.append(acc, x) end)

    Enum.reverse(loop(s, t, 0, [])) |> Enum.join(" ")

  end

  def loop(s, t, iterator, result) do
    if iterator == @lengthS - @lengthT, do: result,
    else: if elem(s, iterator) == elem(t, 0),
    do: checkIfContains(s, t, 0, iterator, result), else:
    loop(s, t, iterator + 1, result)
  end

  def checkIfContains(s, t, iteratorT, iterator, result) do
    if iteratorT == @lengthT,
    do: loop(s, t, iterator - iteratorT + 1, [iterator - iteratorT + 1 | result]),
  else: if elem(s, iterator) == elem(t, iteratorT), do: checkIfContains(s, t, iteratorT + 1, iterator + 1, result),
    else: loop(s, t, iterator - iteratorT + 1, result)
  end

end
