-- this computes projecteuler.net problem 020
local BASE = 10

local function mul_digit_string(digit, in_string)
  -- multiplies the in_string by a single digit 

  local OFFSET = 48
  local result_string = ""
  local carry = 0;
  if digit == 0 then
    return "0"
  elseif digit == 1 then
    return in_string
  else
    carry = 0;
    for i = string.len(in_string), 1, -1 do
      local inch = string.byte(in_string, i) - OFFSET
  
      local product = inch * digit + carry
      local new = product % BASE
      result_string = new .. result_string
      carry = math.floor(product / BASE)
    end
  end

  if carry ~= 0 then
    result_string = carry .. result_string
  end
  return result_string
end

local function handle_carry(carry, in_string)
  if carry == 0 then
    return in_string
  else
    return tostring(carry) .. in_string
  end
end

local function add_strings_short_to_long(short_string, long_string)

  local min_len = string.len(short_string)
  local max_len = string.len(long_string)

  local carry = 0
  local out_string =""
  -- walk backwards through the short string adding as we go
  for short_index = min_len, 1, -1 do
    local long_index = max_len - min_len + short_index 
    local in1 = tonumber(string.sub(short_string, short_index, short_index))
    local in2 = tonumber(string.sub(long_string, long_index, long_index))
    tmp = in1 + in2 + carry
    out_string = tostring(tmp % BASE) .. out_string
    carry = math.floor(tmp / BASE)
  end
  -- walk backwards through the remaining elements of the long string
  for j = max_len - min_len, 1, -1 do
    local in2 = tonumber(string.sub(long_string, j, j))
    local tmp = in2 + carry
    out_string = tostring(tmp % BASE) .. out_string
    carry = math.floor(tmp / BASE)
  end
  out_string = handle_carry(carry, out_string)
  return out_string
end

local function add_digit_strings(in_1_string, in_2_string)
  if string.len(in_1_string) < string.len(in_2_string) then
    return add_strings_short_to_long(in_1_string, in_2_string)
  else
    return add_strings_short_to_long(in_2_string, in_1_string)
  end
end

local function mul_int_string(alpha, in_string)

  -- multiplies the input string in_string by the integer alpha

  local a_length = string.len(tostring(alpha))
  local in_length = string.len(in_string)

  local out_string = ""
  local zeroes = ""
  for i = 1, a_length do
    local modulo = alpha % BASE
    alpha = math.floor(alpha / BASE)
    if modulo == 1 then
       out_string = add_digit_strings(out_string, in_string .. zeroes)
    elseif modulo ~= 0 then
      local in_tmp = mul_digit_string(modulo, in_string) .. zeroes
      out_string = add_digit_strings(out_string, in_tmp)
    end
    zeroes = zeroes .. "0"
  end

  return out_string
end

local last = 100
local factorial = "1"
for i = 1, last do
  factorial = mul_int_string(i, factorial)
end

local fstring = tostring(factorial)
local flen = string.len(fstring) 
      
local fsum = 0
for i = 1, flen do
  fsum = tonumber(string.sub(fstring, i, i)) + fsum
end

print(fsum)
