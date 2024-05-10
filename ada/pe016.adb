--  this computes projecteuler.net problem 016

pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;

procedure pe016 is

LIMIT      : constant Integer := 1000;
NUM        : constant Big_Integer := 2 ** LIMIT;
NUM_LENGTH : constant Integer := Ada.Strings.Fixed.Trim(Big_Integer'Image(NUM), Side => Both)'Length;
NUMSTRING  : constant String (1 .. NUM_LENGTH) := Ada.Strings.Fixed.Trim(Big_Integer'Image(NUM), Side => Both);

ssum   : Integer := 0;

digit  : Character;
idigit : Integer ;

begin
  for i in 1 .. NUM_LENGTH loop
    digit := NUMSTRING(i);
    idigit := Integer'Value ((1 => digit));
    ssum := ssum + idigit;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(ssum), Side => Both));
end pe016;
