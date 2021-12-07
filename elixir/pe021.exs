# <p>Let d(<i>n</i>) be defined as the sum of proper divisors of <i>n</i> (numbers less than <i>n</i> which divide evenly into <i>n</i>).<br />
# If d(<i>a</i>) = <i>b</i> and d(<i>b</i>) = <i>a</i>, where <i>a</i> ≠ <i>b</i>, then <i>a</i> and <i>b</i> are an amicable pair and each of <i>a</i> and <i>b</i> are called amicable numbers.</p>
# <p>For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.</p>
# <p>Evaluate the sum of all the amicable numbers under 10000.</p>

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
