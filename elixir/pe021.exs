defmodule ProjectEuler do
  def pe021(n) do
    sum_amicable(n, 0, compute_amicable(n, %{}))
  end
   
  defp sum_amicable(n, sum, amicable) when n > 0 do
    x = amicable[n]
    if x != n and amicable[x] == n do
      sum_amicable(n - 1, sum + n, amicable)
    else
      sum_amicable(n - 1, sum, amicable)
    end  
  end
    
  defp sum_amicable(_, sum, _) do
    sum
  end
    
  defp compute_amicable(n, amicable) when n > 0 do
    root = Kernel.round :math.sqrt(n)
    tmp = sum_divisors(n, root, 1)
    new_amicable = Map.put amicable, n, tmp
    compute_amicable(n - 1, new_amicable)
  end
    
  defp compute_amicable(_, amicable) do
    amicable
  end
    
  defp sum_divisors(n, max, sum) when max > 1 do
    if (rem(n, max) == 0) do
      sum_divisors(n, max - 1, sum + max + div(n, max))
    else
      sum_divisors(n, max - 1, sum)
    end
  end

  defp sum_divisors(_, _, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe021(10_000))
