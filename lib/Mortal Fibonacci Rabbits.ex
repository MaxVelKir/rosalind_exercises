defmodule FIBD do

  @totalMonths 94
  @lifeTime 18

  def main() do

    firstMonth = %{:children => 1, :adults => 0}
    generations = {firstMonth}
    loop(0, generations)

  end

  def loop(iterator, generations) when iterator < @lifeTime - 1 do
    lastMonth = %{:children => _, :adults => _} = elem(generations, iterator)
    nextMonth = %{:adults => lastMonth[:adults] + lastMonth[:children], :children => lastMonth[:adults]}
    generations = Tuple.append(generations, nextMonth)
    loop(iterator + 1, generations)
  end

  def loop(iterator, generations) when iterator >= @lifeTime - 1 and iterator < @totalMonths - 1 do
    lastMonth = %{:children => _, :adults => _} = elem(generations, @lifeTime - 1)
    nextMonth = %{:children => lastMonth[:adults], :adults => (lastMonth[:adults] + lastMonth[:children] - elem(generations, 0)[:children])}
    generations = Tuple.delete_at(generations, 0)
    generations = Tuple.append(generations, nextMonth)
    loop(iterator + 1, generations)
  end

  def loop(_iterator, generations) do
    elem(generations, @lifeTime - 1)[:adults] + elem(generations, @lifeTime - 1)[:children]
  end

end
