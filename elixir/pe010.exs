# <p>The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.</p>
# <p>Find the sum of all the primes below two million.</p> 

defmodule ProjectEuler do
  def pe010(n) do
    sum_primes(3, n, 2)
  end
   
  defp is_prime?(_, try) when try == 1 do
    true
  end

  defp is_prime?(n, try) when rem(n, try) == 0 do
    false
  end

  defp is_prime?(n, try) do
    is_prime?(n, try - 1)
  end

  defp is_prime?(n) do
    root = Kernel.round :math.sqrt(n)
    is_prime?(n, root)
  end

  defp sum_primes(n, max, sum) when n < max do
    if is_prime?(n) do
      sum_primes(n + 2, max, sum + n)
    else
      sum_primes(n + 2, max, sum)
    end
  end

  defp sum_primes(_, _, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe010(2_000_000))
