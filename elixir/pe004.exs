# '<p>A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.</p><p>Find the largest palindrome made from the product of two 3-digit numbers.</p>',

defmodule ProjectEuler do
  def pe004(n) do
    longest_palindrome(n, n, n, 0)
  end
   
  defp is_palindromic(product) do
    product_s = to_string(product)
    product_s == String.reverse(product_s)
  end

  defp longest_palindrome(i, j, jstart, maxv) when j > 99 and i > 99 do
    product = i * j
    if product > maxv and is_palindromic(product) do
      longest_palindrome(i, j - 1, jstart, product)
    else
      longest_palindrome(i, j - 1, jstart, maxv)
    end
  end

  defp longest_palindrome(i, _, jstart, maxv) when i > 99 do
    longest_palindrome(i - 1, jstart, jstart, maxv)
  end

  defp longest_palindrome(_, _, _, maxv) do
    maxv
  end
end

IO.puts(ProjectEuler.pe004(999))
