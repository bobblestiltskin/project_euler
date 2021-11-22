defmodule Pe001 do
  def sum_multiples(n, sum) do
    if n > 0 do
#      IO.puts(n)
      if rem(n, 3) == 0 || rem(n, 5) == 0 do
        sum_multiples(n - 1, sum + n)
      else 
        sum_multiples(n - 1, sum)
      end    
    else 
      IO.puts(sum)
    end    
  end
end

Pe001.sum_multiples(999, 0)
