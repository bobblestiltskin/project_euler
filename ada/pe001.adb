--  this computes projecteuler.net problem 001

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe001 is

MAX   : constant Integer := 1000;

total : Integer := 0;

begin
  for i in 1 .. MAX - 1 loop
    if (i mod 3 = 0) or (i mod 5 = 0) then
      total := total + i;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(total), Side => Both));
end pe001;
