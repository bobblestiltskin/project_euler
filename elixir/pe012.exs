defmodule ProjectEuler do
  def pe012(n) do
    triangle_number(0, div(n, 2), 0, 1)
  end
   
  defp triangle_number(n, last, i, j) when n < last do
    root = Kernel.round :math.sqrt(i + j)
    triangle_number(get_number_of_divisors(i + j, root, 1, 0), last, i + j, j + 1)
  end

  defp triangle_number(_, _, i, _) do
    i
  end

  defp get_number_of_divisors(n, root, running, num_divisors) when running < root do
    if rem(n, running) == 0 do
      get_number_of_divisors(n, root, running + 1,  num_divisors + 1)
    else
      get_number_of_divisors(n, root, running + 1,  num_divisors)
    end
  end

  defp get_number_of_divisors(_, _, _, num_divisors) do
    num_divisors
  end
end

IO.puts(ProjectEuler.pe012(500))
