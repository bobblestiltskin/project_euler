--  this computes projecteuler.net problem 014

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe014 is

last        : Integer := 1000000;
half_last   : Integer := 500000;

collatz     : Long_Integer;
counter     : Integer;

maxv        : Integer := 0;
maxi        : Integer := 0;

function next_term(num : Long_Integer) return Long_Integer is
begin
  if num mod 2 = 0 then
    return num / 2;
  else
    return num + num + num + 1;
  end if;
end next_term;

begin
  for i in half_last ..  last loop
    counter := 1;
    collatz := Long_Integer(i);
    while collatz /= 1 loop
      collatz := next_term(collatz);
      counter := counter + 1;
    end loop;
    if counter > maxv then
      maxv := counter;
      maxi := i;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(maxi), Side => Both));
end pe014;
