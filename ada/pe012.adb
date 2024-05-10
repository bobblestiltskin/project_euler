--  this computes projecteuler.net problem 012

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;

procedure pe012 is

LAST   : constant Integer := 250; -- halve the space by counting up to the square root of num

function get_num_divisors(num : Integer) return Integer is
  counter : Integer := 0;
  running : Integer := 1;
  upper : Integer := Integer(Float'Floor(Sqrt(Float(num))));
  begin
    while running <= upper loop
      if (num mod running = 0) then
        counter := counter + 1;
      end if;
      running := running + 1;
    end loop;
    return counter;
end get_num_divisors;

num    : Integer := 0;
i      : Integer := 0;
j      : Integer := 1;

begin
  while num < LAST loop
    i := i + j;
    num := get_num_divisors(i);
    j := j + 1;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(i), Side => Both));
end pe012;
