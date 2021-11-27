#   '<p>A Pythagorean triplet is a set of three natural numbers, <var>a</var> &lt; <var>b</var> &lt; <var>c</var>, for which,</p>
# <div class="center"> <var>a</var><sup>2</sup> + <var>b</var><sup>2</sup> = <var>c</var><sup>2</sup></div>
# <p>For example, 3<sup>2</sup> + 4<sup>2</sup> = 9 + 16 = 25 = 5<sup>2</sup>.</p>
# <p>There exists exactly one Pythagorean triplet for which <var>a</var> + <var>b</var> + <var>c</var> = 1000.<br />Find the product <var>abc</var>.</p>

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
