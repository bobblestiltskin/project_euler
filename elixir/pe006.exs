#  '<p>The sum of the squares of the first ten natural numbers is,</p> $$1^2 + 2^2 + ... + 10^2 = 385$$ <p>The square of the sum of the first ten natural numbers is,</p> $$(1 + 2 + ... + 10)^2 = 55^2 = 3025$$ <p>Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is $3025 - 385 = 2640$.</p> <p>Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.</p>'

defmodule ProjectEuler do
  def pe006(n) do
    square_sum(n) - sum_squares(n, 0)
  end

  defp square_sum(n) do
    x = sum(n, 0)
    x * x
  end

  defp sum(n, total) when n > 0 do
    sum(n - 1, total + n)
  end

  defp sum(_, total) do
    total
  end
   
  defp sum_squares(n, sum) when n > 0 do
    sum_squares(n - 1, sum + n *n )
  end

  defp sum_squares(_, sum) do
    sum
  end
end

IO.puts(ProjectEuler.pe006(100))
