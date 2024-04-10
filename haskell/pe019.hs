-- this computes projecteuler.net problem 019

sum_tuesdays n cycle [] dow count     | n > 0 = sum_tuesdays (n - 1) cycle cycle dow count
sum_tuesdays n cycle (x:xs) dow count | n > 0 =
  do
    let new_dow = (dow + x) `rem` 7

    if dow == 0 then
      sum_tuesdays n cycle xs new_dow (count + 1)
    else
      sum_tuesdays n cycle xs new_dow count

sum_tuesdays _ _ _ _ count = count

mcycle = [
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      28,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
      31,
      29,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ]

pe019 :: Int
pe019 = sum_tuesdays 25 mcycle mcycle 2 0

main = print(pe019)
