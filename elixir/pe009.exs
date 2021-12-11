defmodule ProjectEuler do
  def pe009(n) do
    pythagorean_triplet?(n, 1, 2, 3)
  end
   
  defp equal_sum?(a, b, c, n) do
    n == a + b + c
  end

  defp equal_squares?(a, b, c) do
    a * a + b * b == c * c
  end

  defp both_match?(a, b, c, n) do
    equal_sum?(a, b, c, n) and equal_squares?(a, b, c)
  end

  defp pythagorean_triplet?(n, a, b, c) when c < n do
    if both_match?(a, b, c, n) do
      a * b * c
    else
      pythagorean_triplet?(n, a, b, c + 1)
    end
  end

  defp pythagorean_triplet?(n, a, b, c) when b < n do
    if both_match?(a, b, c, n) do
      a * b * c
    else
      pythagorean_triplet?(n, a, b + 1, 1)
    end
  end

  defp pythagorean_triplet?(n, a, b, c) when a < n do
    if both_match?(a, b, c, n) do
      a * b * c
    else
      pythagorean_triplet?(n, a + 1, 1, 1)
    end
  end
end

IO.puts(ProjectEuler.pe009(1000))
