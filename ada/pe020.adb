--  this computes projecteuler.net problem 020

pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

procedure pe020 is

max_prime : Integer := 0;
i         : Integer := 3;
number    : Long_Integer := 600851475143;

last: Integer := 100;
factorial: Big_Integer := 1;

begin
  for i in 1 .. last loop
    factorial := factorial * Long_Integer(i + 1);
  end loop;

  while number /= 1 loop
    if (number mod Long_Integer(i) = 0) then
       max_prime := i;
       number := number / Long_Integer(i);
    else
       i := i + 2;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(max_prime), Side => Both));
end pe020;
--pe016.adb:with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;
--pe016.adb:num        : Big_Integer := 2 ** limit;
--pe016.adb:num_length : Integer := Ada.Strings.Fixed.Trim(Big_Integer'Image(num), Side => Both)'Length;
--pe016.adb:  numstring := Ada.Strings.Fixed.Trim(Big_Integer'Image(num), Side => Both);
--  
--  last = 100
--  factorial = 1
--  for i in range(last):
--    factorial *= i+1
--
--  fstring = str(factorial)
--  flen = len(fstring) 
--        
--  fsum = 0
--  for i in range(flen): 
--    fsum += int(fstring[i])
--
--  print(fsum)
