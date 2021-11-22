defmodule Pe001 do
  def sum_multiples(n, sum) when n > 0 do
    if rem(n, 3) == 0 || rem(n, 5) == 0 do
      sum_multiples(n - 1, sum + n)
    else
      sum_multiples(n - 1, sum)
    end
  end

  def sum_multiples(_, sum) do
    IO.puts(sum)
  end
end

Pe001.sum_multiples(999, 0)
