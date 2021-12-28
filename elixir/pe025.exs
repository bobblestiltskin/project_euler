defmodule ProjectEuler do
  def pe025(n) do
    fibonacci_digits(1, 1, n, 0, 1)
  end

  defp fibonacci_digits(previous, current, n, length, index) when length < n do
    fibonacci_digits(current, previous + current, n, String.length(to_string(current)), index + 1)
  end

  defp fibonacci_digits(_, _, _, _, index) do
    index
  end
end

IO.puts(ProjectEuler.pe025(1000))
