--  this computes projecteuler.net problem 019

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe019 is

count: Integer := 0;
dow: Integer := 2; --  start on tuesday 1901.1.1
                   --           2000 is a leap year too!

cycle : array(1 .. 48) of Integer := (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                                      31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                                      31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31,
                                      31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  for i in 1 .. 25 loop
    for j in 1 .. 48 loop
      if dow = 0 then
        count := count + 1;
      end if;
      dow := (dow + cycle(j)) mod 7;
    end loop;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(count), Side => Both));
end pe019;
