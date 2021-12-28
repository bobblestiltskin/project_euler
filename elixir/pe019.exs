defmodule ProjectEuler do
  def pe019() do
    cycle = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ]

    sum_tuesdays(25, cycle, cycle, 2, 0)
  end

  defp sum_tuesdays(n, cycle, [], dow, count) when n > 0 do
    sum_tuesdays(n - 1, cycle, cycle, dow, count)
  end

  defp sum_tuesdays(n, cycle, [head | tail], dow, count) when n > 0 do
    new_dow = rem(dow + head, 7)

    if dow == 0 do
      sum_tuesdays(n, cycle, tail, new_dow, count + 1)
    else
      sum_tuesdays(n, cycle, tail, new_dow, count)
    end
  end

  defp sum_tuesdays(_, _, _, _, count) do
    count
  end
end

IO.puts(ProjectEuler.pe019())
