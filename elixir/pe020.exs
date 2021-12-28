defmodule ProjectEuler do
  def pe020(n) do
    sum_digits(String.graphemes(to_string(factorial(n, 1))), 0)
  end

  defp sum_digits([], sum) do
    sum
  end

  defp sum_digits(list, sum) do
    [head | tail] = list
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
