defmodule ProjectEuler do
  def pe007(n) do
    count_primes(3, 1, n)
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
    root = Kernel.round(:math.sqrt(n))
    is_prime?(n, root)
  end

  defp count_primes(current, index, limit) when index < limit do
    next = current + 2

    if is_prime?(current) do
      count_primes(next, index + 1, limit)
    else
      count_primes(next, index, limit)
    end
  end

  defp count_primes(next, _, _) do
    next - 2
  end
end

IO.puts(ProjectEuler.pe007(10_001))
