defmodule IEV do

  @input %{1 => 17145, 2 => 19550, 3 => 16719, 4 => 17678, 5 => 16247, 6 => 16910}

  def main(input \\ @input) do

    input[1] * 2 + input[2] * 2 + input[3] * 2 + input[4] * 0.75 * 2 + input[5] * 0.5 * 2 + input[6] * 2 * 0

  end

end
