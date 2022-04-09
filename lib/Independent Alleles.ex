defmodule LIA do
  @k 2
  @n 1

  def main do
    sum_last_gen = :math.pow(2, @k)
    chance_last_gen = :math.pow(0.25, @k)

    IO.puts("#{sum_last_gen} #{chance_last_gen}")
  end
end
