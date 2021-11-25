# '<p>If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.</p><p>Find the sum of all the multiples of 3 or 5 below 1000.</p>',

defmodule ProjectEuler do
  def pe001(n) do
    sum_multiples(n, 0)
  end
   
  defp sum_multiples(n, sum) when n > 0 and rem(n, 3) == 0 or rem(n, 5) == 0 do
    sum_multiples(n - 1, sum + n)
  end

  defp sum_multiples(n, sum) when n > 0 do
    sum_multiples(n - 1, sum)
  end

  defp sum_multiples(_, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe001(999))
