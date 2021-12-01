# <p>Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.</p>
# <div class="center">
# <img src="project/images/p015.png" class="dark_img" alt="" /></div>
# <p>How many such routes are there through a 20×20 grid?</p>

# need to compute 2n!/((n!)*(n!))

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
