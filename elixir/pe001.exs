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
