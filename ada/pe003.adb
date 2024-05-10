--  this computes projecteuler.net problem 003

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe003 is

max_prime : Integer := 0;
i         : Integer := 3;
number    : Long_Integer := 600851475143;

begin
  while number /= 1 loop
    if number mod Long_Integer(i) = 0 then
       max_prime := i;
       number := number / Long_Integer(i);
    else
       i := i + 2;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(max_prime), Side => Both));
end pe003;
