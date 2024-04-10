-- this computes projecteuler.net problem 018

a = [
      [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
      [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
      [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
      [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
      [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
      [41, 41, 26, 56, 83, 40, 80, 70, 33],
      [99, 65, 04, 28, 06, 16, 70, 92],
      [88, 02, 77, 73, 07, 63, 67],
      [19, 01, 23, 75, 03, 34],
      [20, 04, 82, 47, 65],
      [18, 35, 87, 10],
      [17, 47, 82],
      [95, 64],
      [75]
    ]

first_row = [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]

mymax :: Integral a => a -> a -> a
mymax a b | a > b = a
mymax _  b = b

process_row :: Integral a => [a] -> [a] -> [a]
process_row [] out     = reverse out
process_row (x:xs) out =
  do
    if length xs > 0 then
      do
        let new_out = (mymax x (head xs)) : out
        process_row xs new_out
    else
      process_row [] out

add_rows :: Integral a => [a] -> [a] -> [a] ->[a]
add_rows [] [] list = reverse list
add_rows (x:xs) (y:ys) out = add_rows xs ys ((x + y) : out)

sum_triangles :: Integral a => [[a]] -> [a] -> a
sum_triangles [[]] maxv = head maxv
sum_triangles a row =
  do
    let max_vals = process_row row []
    let new_row = add_rows (head a) max_vals []
    if length a > 1 then
      sum_triangles (tail a) new_row
    else
      sum_triangles [[]] new_row

pe018 :: Int
pe018 = sum_triangles a first_row

main = print(pe018)
