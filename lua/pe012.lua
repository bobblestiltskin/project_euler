-- this computes projecteuler.net problem 12

function get_num_divisors(num)
  counter = 0
  running = 1
  while running <= math.sqrt(num) do
    if (num % running) == 0 then
      counter = 1 + counter
    end
    running = 1 + running
  end
  return counter
end

last = 250
num = 0
i = 0
j = 1

while num < last do
  i = i + j
  num = get_num_divisors(i)
  j = 1 + j
end

print(i)
