# <p>The following iterative sequence is defined for the set of positive integers:</p>
# <p class="margin_left"><var>n</var> → <var>n</var>/2 (<var>n</var> is even)<br /><var>n</var> → 3<var>n</var> + 1 (<var>n</var> is odd)</p>
# <p>Using the rule above and starting with 13, we generate the following sequence:</p>
# <div class="center">13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1</div>
# <p>It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.</p>
# <p>Which starting number, under one million, produces the longest chain?</p>
# <p class="note"><b>NOTE:</b> Once the chain starts the terms are allowed to go above one million.</p>

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
