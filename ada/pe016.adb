--  this computes projecteuler.net problem 016

pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

procedure pe016 is

limit      : constant Integer := 1000;
num        : Big_Integer := 2 ** limit;
num_length : Integer := Ada.Strings.Fixed.Trim(Big_Integer'Image(num), Side => Both)'Length;
numstring  : String (1 .. num_length);

digit  : Character;
idigit : Integer ;
ssum   : Integer := 0;

begin
  numstring := Ada.Strings.Fixed.Trim(Big_Integer'Image(num), Side => Both);
  for i in 1 .. num_length loop
    digit := numstring(i);
    idigit := Integer'Value ((1 => digit));
    ssum := ssum + idigit;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(ssum), Side => Both));
end pe016;
