--  this computes projecteuler.net problem 020

pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

procedure pe020 is

LAST: constant Integer := 100;

factorial: Big_Integer := 1;
factorial_string: Unbounded_String;

fsum: Integer := 0;
idigit : Integer := 0;
digit  : Character;

begin
  for i in 1 .. LAST loop
    factorial := factorial * To_Big_Integer(i);
  end loop;
  factorial_string := To_Unbounded_String(Ada.Strings.Fixed.Trim(Big_Integer'Image(factorial), Side => Both));
  for i in 1 .. Ada.Strings.Fixed.Trim(Big_Integer'Image(factorial), Side => Both)'Length loop
    digit := Element(Source => factorial_string, Index => i);
    idigit := Integer'Value ((1 => digit));
    fsum := fsum + idigit;
  end loop;
  Put(Ada.Strings.Fixed.Trim(Integer'Image(fsum), Side => Both));
end pe020;
