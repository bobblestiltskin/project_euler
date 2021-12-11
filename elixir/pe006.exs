defmodule ProjectEuler do
  def pe006(n) do
    square_sum(n) - sum_squares(n, 0)
  end

  defp square_sum(n) do
    x = sum(n, 0)
    x * x
  end

  defp sum(n, total) when n > 0 do
    sum(n - 1, total + n)
  end

  defp sum(_, total) do
    total
  end
   
  defp sum_squares(n, sum) when n > 0 do
    sum_squares(n - 1, sum + n *n )
  end

  defp sum_squares(_, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe006(100))
