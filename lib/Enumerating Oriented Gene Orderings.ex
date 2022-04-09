defmodule SIGN do

  def main(n) do

    # w = 1
    # x = 2
    # y = 3
    # z = 4

    file = File.open!("SIGN", [:read, :utf8, :write])

    [1, 2, 3, 4, 5, 6, 7]
    |> combinations
    |> Stream.map(fn [a, b, c, d, e, f, g] ->
      w = if a != 1 do -1 else 1 end
      x = if b != 2 do -2 else 2 end
      y = if c != 3 do -3 else 3 end
      z = if d != 4 do -4 else 4 end
      q = if e != 5 do -5 else 5 end
      r = if e != 6 do -6 else 6 end
      s = if e != 7 do -7 else 7 end

      case n do
        2 -> [w, x]
        3 -> [w, x, y]
        4 -> [w, x, y, z]
        5 -> [w, x, y, z, q]
        6 -> [w, x, y, z, q, r]
      end

    end)
    |> Stream.uniq
    |> Enum.map(fn x -> combinations(x) end)
    # |> Enum.map(fn x -> x |> Enum.with_index end)
    # |> Enum.with_index
    |> Enum.each(fn x -> Enum.each(x, fn [a, b, c] -> IO.puts(file, "#{a} #{b} #{c}") end) end)

  end

  def combinations([]) do
      [[]]
    end

    def combinations(list) do
      for h <- list, t <- combinations(list -- [h]), do: [h | t]
    end


end
