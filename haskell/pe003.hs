largest_prime :: (Integral a) => a -> a -> a -> a
largest_prime n current _    | current <= n && n `rem` current == 0    = largest_prime (n `div` current) (current + 2) current
largest_prime n current maxp | current <= n                            = largest_prime n (current + 2) maxp
largest_prime _ _ maxp                                                 = maxp

main = print(largest_prime 600851475143 1 1)
