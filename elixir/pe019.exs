# <p>You are given the following information, but you may prefer to do some research for yourself.</p>
# <ul><li>1 Jan 1900 was a Monday.</li>
# <li>Thirty days has September,<br />
# April, June and November.<br />
# All the rest have thirty-one,<br />
# Saving February alone,<br />
# Which has twenty-eight, rain or shine.<br />
# And on leap years, twenty-nine.</li>
# <li>A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.</li>
# </ul><p>How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?</p> 

defmodule ProjectEuler do
  def pe019() do
    cycle = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
             31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

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
