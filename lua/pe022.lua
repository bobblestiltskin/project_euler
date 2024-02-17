-- this computes projecteuler.net problem 022

local OFFSET = 64

local function read_file(path)
  local file = io.open(path, "r") -- r read mode for text file
  if not file then return nil end
  local content = file:read "*a" -- *a or *all reads the whole file
  file:close()
  return content
end

local filename = "../names.txt"
local fileContent = read_file(filename)

local names = {}
local name_count = 0
for name in string.gmatch(fileContent, "([^,]+)") do
  len = string.len(name)
  name = string.sub(name, 2, len - 1)
  table.insert(names, name)
  name_count = 1 + name_count
end
table.sort(names)

local total = 0
for i =1, name_count do
  letters = 0
  for j = 1, string.len(names[i]) do
    letter_code = string.byte(names[i], j, j) - OFFSET
    letters = letter_code + letters
  end
  total = letters * i + total
end
print(total)
