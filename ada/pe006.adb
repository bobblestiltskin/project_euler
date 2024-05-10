--  this computes projecteuler.net problem 006

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe006 is

MAX   : constant Integer := 100;

sumsq : Integer := 0;
sqsum : Integer := 0;

begin
  for i in 1 .. MAX loop
    sumsq := sumsq + (i * i);
  end loop;
  sqsum := ((MAX + 1) * (MAX / 2)) ** 2;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(sqsum - sumsq), Side => Both));
end pe006;
