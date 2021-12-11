defmodule ProjectEuler do
  def pe015(n) do
    div(div(factorial(2 * n, 1), factorial(n, 1)), factorial(n, 1))
  end

  defp factorial(n, sum) when n > 0 do
    factorial(n - 1, sum * n)
  end

  defp factorial(_, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe015(20))
