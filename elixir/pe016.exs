# <p>2<sup>15</sup> = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.</p>
# <p>What is the sum of the digits of the number 2<sup>1000</sup>?</p>

defmodule ProjectEuler do
  def pe016(n) do
    sum_digits(String.graphemes(to_string(power(2, n))), 0)
  end
   
  def power(base, 1) do
    base
  end

  def power(base, exp) do
    base * power(base, exp - 1)
  end

  defp sum_digits([], sum) do
    sum
  end

  defp sum_digits(list, sum) do
    [ head | tail ] = list
    sum_digits(tail, sum + String.to_integer(head))
  end
end

IO.puts(ProjectEuler.pe016(1000))
