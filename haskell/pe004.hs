-- this computes projecteuler.net problem 004
is_palindromic :: Int -> Bool
is_palindromic a =
  do
    let pstring = show a
    pstring == reverse pstring

longest_palindrome :: Int -> Int -> Int -> Int -> Int
longest_palindrome i j jstart maxv | i > 99 && j > 99 =
  do 
    let product = i * j
    if (product > maxv) && is_palindromic product then
      longest_palindrome i (j - 1) jstart product
    else
      longest_palindrome i (j - 1) jstart maxv

longest_palindrome i _ jstart maxv | i > 99 = longest_palindrome (i - 1) jstart jstart maxv

longest_palindrome _ _ _ maxv = maxv

pe004:: Int -> Int
pe004 n = longest_palindrome n n n 0

main = print(pe004 999)
