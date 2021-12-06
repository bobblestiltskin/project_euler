# <p><i>n</i>! means <i>n</i> × (<i>n</i> − 1) × ... × 3 × 2 × 1</p>
# <p>For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,<br />and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.</p>
# <p>Find the sum of the digits in the number 100!</p>

defmodule ProjectEuler do
  def pe020(n) do
    sum_digits(String.graphemes(to_string(factorial(n, 1))), 0)
  end

  defp sum_digits([], sum) do
    sum
  end

  defp sum_digits(list, sum) do
    [ head | tail ] = list
    sum_digits(tail, sum + String.to_integer(head))
  end

  defp factorial(n, sum) when n > 0 do
    factorial(n - 1, sum * n)
  end

  defp factorial(_, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe020(100))
