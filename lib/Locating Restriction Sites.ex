# defmodule REVP do
#   def main do
#     {:ok, input} = File.read("REVP.txt")
#
#     dnaString =
#       input
#       |> String.split(">")
#       |> Stream.filter(&(&1 != ""))
#       |> Enum.map(fn x -> x |> String.trim() |> String.split("\n") end)
#       |> List.last()
#       |> List.last()
#
#     length = String.length(dnaString)
#
#     # loop(dnaString, length, length, [])
#   end
#
#   def loop(dnaString, iterator, length, result) when iterator >= 4 do
#     # cut = fn ->
#     #   if iterator < 12 do
#     #     iterator
#     #   else
#     #     12
#     #   end
#     # end
#     #
#     # IO.inspect(cut)
#     # lengthOfPalindrom = loop2(String.slice(dnaString, iterator - 12, cut), cut)
#     #
#     # if iterator == 21, do: IO.inspect(lengthOfPalindrom)
#     #
#     # if lengthOfPalindrom != 0 do
#     #   loop(dnaString, iterator - 1, length, [{iterator, lengthOfPalindrom} | result])
#     # else
#     #   loop(dnaString, iterator - 1, length, result)
#     # end
#   end
#
#   def loop(_, _, _, result) do
#     result
#   end
#
#   def loop2(dnaStringSplit, iterator) when iterator >= 4 do
#     dnaComp =
#       dnaStringSplit
#       |> String.slice(0, iterator)
#       |> stringToList
#       |> complement
#       |> List.to_string()
#
#     IO.inspect(dnaStringSplit)
#     IO.inspect(dnaComp)
#
#     if dnaComp == dnaStringSplit do
#       iterator
#     else
#       loop2(String.slice(dnaStringSplit, 0, iterator - 2), iterator - 2)
#     end
#   end
#
#   def loop2(_, _) do
#     0
#   end
#
#   def stringToList(string) do
#     string
#     |> String.split("")
#     |> Enum.filter(fn x -> x != "" end)
#   end
#
#   def complement(dnaList) do
#     dnaList
#     |> Stream.map(fn x ->
#       case x do
#         "A" -> "T"
#         "T" -> "A"
#         "C" -> "G"
#         "G" -> "C"
#       end
#     end)
#     |> Enum.reverse()
#   end
# end
