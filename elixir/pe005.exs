defmodule ProjectEuler do
  def pe005(n) do
    lowest_common_multiple(n, n, 1)
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

  defp power_less_than(n, p, max) do
    product = n * p
    if product > max do
      p
    else
      power_less_than(n, product, max)
    end
  end
 
  defp lowest_common_multiple(n, max, product) when n > 1 do
    if is_prime?(n) do
      x = power_less_than(n, 1, max)
      lowest_common_multiple(n - 1, max, product * x)
    else
      lowest_common_multiple(n - 1, max, product)
    end
  end

  defp lowest_common_multiple(_, _, product) do
    product
  end
end

IO.puts(ProjectEuler.pe005(20))
