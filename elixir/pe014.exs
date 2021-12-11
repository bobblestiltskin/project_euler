defmodule ProjectEuler do
  def pe014(n) do
    count_collatz(n, 0, 0)
  end
   
  defp count_collatz(n, maxn, maxc) when n > 0 do
    this_collatz = collatz(n, 0)
    if this_collatz > maxc do
      count_collatz(n - 1, n, this_collatz)
    else
      count_collatz(n - 1, maxn, maxc)
    end
  end

  defp count_collatz(_, maxn, _) do
    maxn
  end

  defp collatz(1, length) do
    length
  end

  defp collatz(n, length) when n > 0 and rem(n, 2) == 0 do
    collatz(div(n, 2), length + 1)
  end

  defp collatz(n, length) when n > 0 do
    collatz(3 * n + 1, length + 1)
  end
end

IO.puts(ProjectEuler.pe014(1_000_000))
