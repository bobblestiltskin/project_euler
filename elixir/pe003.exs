# '<p>The prime factors of 13195 are 5, 7, 13 and 29.</p><p>What is the largest prime factor of the number 600851475143 ?</p>'

defmodule ProjectEuler do
  def pe003(n) do
    largest_prime(1, n, 0)
  end

  defp largest_prime(current, n, _) when current <= n and rem(n, current) == 0 do
    largest_prime(current + 2, div(n, current), current)
  end

  defp largest_prime(current, n, maxval) when current <= n do
    largest_prime(current + 2, n, maxval)
  end

  defp largest_prime(_, _, maxval) do
    maxval
  end
end

IO.puts(ProjectEuler.pe003(600_851_475_143))
