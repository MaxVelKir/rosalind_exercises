defmodule PERM do

  def fill(n, list) when n > 0 do
    fill(n - 1, [n | list])
  end

  def fill(_, list) do
    list
  end

  def main(n) do

    list = fill(n, []) |> permutation |> Enum.with_index

    IO.puts((List.last(list) |> elem(1)) + 1)
    list |> Enum.each(fn {[a, b, c, d, e, f, g], _} -> IO.puts('#{a} #{b} #{c} #{d} #{e} #{f} #{g}') end)

  end

  def permutation(list) do
    for h <- list, t <- permutation(list -- [h]), do: [h | t]
  end

  def permutation([]) do
      [[]]
    end

end
