-- this computes projecteuler.net problem 016 

function double_string(in_string)
-- walk backwards through the string doubling as we go
  local carry = false
  local out_string = ""
  for j = string.len(in_string), 1, -1 do
    local jchar = string.char(string.byte(in_string, j))
  
    if jchar == "0" then
      if carry then
        out_string = "1" .. out_string
      else
        out_string = "0" .. out_string
      end
      carry = false
    end
    if jchar == "1" then
      if carry then
        out_string = "3" .. out_string
      else
        out_string = "2" .. out_string
      end
      carry = false
    end
    if jchar == "2" then
      if carry then
        out_string = "5" .. out_string
      else
        out_string = "4" .. out_string
      end
      carry = false
    end
    if jchar == "3" then
      if carry then
        out_string = "7" .. out_string
      else
        out_string = "6" .. out_string
      end
      carry = false
    end
    if jchar == "4" then
      if carry then
        out_string = "9" .. out_string
      else
        out_string = "8" .. out_string
      end
      carry = false
    end
    if jchar == "5" then
      if carry then
        out_string = "1" .. out_string
      else
        out_string = "0" .. out_string
      end
      carry = true
    end
    if jchar == "6" then
      if carry then
        out_string = "3" .. out_string
      else
        out_string = "2" .. out_string
      end
      carry = true
    end
    if jchar == "7" then
      if carry then
        out_string = "5" .. out_string
      else
        out_string = "4" .. out_string
      end
      carry = true
    end
    if jchar == "8" then
      if carry then
        out_string = "7" .. out_string
      else
        out_string = "6" .. out_string
      end
      carry = true
    end
    if jchar == "9" then
      if carry then
        out_string = "9" .. out_string
      else
        out_string = "8" .. out_string
      end
      carry = true
    end
  end
  if carry then
    out_string = "1" .. out_string
  end
 return out_string
end

local my_string = "2"
local limit = 1000

local ssum = 0
for i =1, limit - 1 do
  my_string = double_string(my_string)
end

ssum = 0
for i = 1, string.len(my_string) do
  ssum = math.floor(string.char(string.byte(my_string, i))) + ssum
end
print(ssum)
