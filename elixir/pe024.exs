defmodule ProjectEuler do
  def pe024(n) do
    sum_permutations(n, 725_760 + 241_920 + 30240, 2_780_000_000)
  end

  defp sum_permutations(n, count, current) when n > count do
    cstring = to_string(current)

    if String.contains?(cstring, "0") and String.contains?(cstring, "1") and
         String.contains?(cstring, "2") and String.contains?(cstring, "3") and
         String.contains?(cstring, "4") and String.contains?(cstring, "5") and
         String.contains?(cstring, "6") and String.contains?(cstring, "7") and
         String.contains?(cstring, "8") and String.contains?(cstring, "9") do
      sum_permutations(n, count + 1, current + 1)
    else
      sum_permutations(n, count, current + 1)
    end
  end

  defp sum_permutations(_, _, current) do
    current - 1
  end
end

IO.puts(ProjectEuler.pe024(1_000_000))
