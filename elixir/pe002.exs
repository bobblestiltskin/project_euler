# '<p>Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:</p><p class="center">1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...</p>
# <p>By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.</p>'

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
