defmodule ProjectEuler do
  def pe002(n) do
    sum_even_fibonacci(1, 1, n, 0)
  end

  defp sum_even_fibonacci(previous, current, n, sum) when current < n and rem(current, 2) == 0 do
    sum_even_fibonacci(current, previous + current, n, sum + current)
  end

  defp sum_even_fibonacci(previous, current, n, sum) when current < n do
    sum_even_fibonacci(current, previous + current, n, sum)
  end

  defp sum_even_fibonacci(_, _, _, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe002(4_000_000))
