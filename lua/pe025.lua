-- this computes projecteuler.net problem 025

limit = 1000
vector = {}

function handle_carry(carry, in_string)
  if carry == 0 then
    return in_string
  else
    return tostring(carry) .. in_string
  end
end

function add_strings_short_to_long(short_string, long_string)

  BASE = 10

  min_len = string.len(short_string)
  max_len = string.len(long_string)

  carry = 0
  out_string =""
  -- walk backwards through the short string adding as we go
  for short_index = min_len, 1, -1 do
    long_index = max_len - min_len + short_index 
    in1 = tonumber(string.sub(short_string, short_index, short_index))
    in2 = tonumber(string.sub(long_string, long_index, long_index))
    tmp = in1 + in2 + carry
    out_string = tostring(tmp % BASE) .. out_string
    carry = math.floor(tmp / BASE)
  end
  -- walk backwards through the remaining elements of the long string
  for j = max_len - min_len, 1, -1 do
    in2 = tonumber(string.sub(long_string, j, j))
    tmp = in2 + carry
    out_string = tostring(tmp % BASE) .. out_string
    carry = math.floor(tmp / BASE)
  end
  out_string = handle_carry(carry, out_string)
 return out_string
end

function add_digit_strings(in_1_string, in_2_string)
  if string.len(in_1_string) < string.len(in_2_string) then
    return add_strings_short_to_long(in_1_string, in_2_string)
  else
    return add_strings_short_to_long(in_2_string, in_1_string)
  end
end

function fib(n, vector)
  -- this computes the fibonacci number of the passed number
  if n < 3 then
    return "1"
  else
    return add_digit_strings(vector[n - 2], vector[n - 1])
  end
end

i = 1
vector[1] = fib(1, vector)

while string.len(vector[i]) < limit do
  i = 1 + i
  vector[i] = fib(i, vector)
end

print(i)
