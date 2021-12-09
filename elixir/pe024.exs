# <p>A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:</p>
# <p class="center">012   021   102   120   201   210</p>
# <p>What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?</p>

#  9! is 362880 so after all the 10 digit numbers which 
#  start with 0 or 1 we will have passed 725760 of the 
#  combinations. The millionth combination will start
#  with a 2, since we need to count 274240 more combinations
#  after 2000000000.
#
#  8! is 40320, so there are that many 10 digit combinations starting 20.
#  The combination starting 22 is invalid (since the numerals must be
#  distinct), so we could count 6 sets of combinations of 40320 up to
#  2700000000 and then we would have seen 725760+241920 leaving 32320 to
#  find.
#
#  7! is 5040, so 6 sets are 30240. As before we count 6 sets from 
#  2700000000 (excluding 2 and 7) and get to 2780000000, leaving 2080 to find.

defmodule ProjectEuler do
  def pe024(n) do
    sum_permutations(n, 725760 + 241920 + 30240, 2780000000)
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
