--  this computes projecteuler.net problem 025

pragma Ada_2022;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Numerics.Big_Numbers.Big_Integers; use Ada.Numerics.Big_Numbers.Big_Integers;
with Ada.Containers.Vectors;

procedure pe025 is

LIMIT : constant Integer := 1000;

package Big_Integer_Vec is new Ada.Containers.Vectors (Index_Type => Positive, Element_Type => Big_Integer);
fibs  : Big_Integer_Vec.Vector;

function fib(n: Integer; vector: Big_Integer_Vec.Vector) return Big_Integer is
begin
  if n < 3 then
    return To_Big_Integer(1);
  else
    return vector(n - 2) + vector(n - 1);
  end if;
end fib;

i: Integer := 1;
last_fib_len: Integer := 1;
fibi: Big_Integer;

begin
  fibs.Append(fib(1, fibs));
  last_fib_len := 1;
  while last_fib_len < LIMIT loop
    i := i + 1;
    fibi := fib(i, fibs);
    fibs.Append(fibi);
    last_fib_len := Ada.Strings.Fixed.Trim(Big_Integer'Image(fibi), Side => Both)'Length;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(i), Side => Both));
end pe025;
