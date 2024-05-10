--  this computes projecteuler.net problem 021

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

procedure pe021 is

SIZE: constant Integer := 10000;

package One_D_Vec is new Ada.Containers.Vectors (Index_Type   => Positive, Element_Type => Integer);

spd  : One_D_Vec.Vector;

function sum_factors(num : Integer) return Integer is
  total : Integer := 1;
  upper : Integer := Integer(Float'Floor(Sqrt(Float(num))));
  begin
    for i in 2 .. upper loop
      if num mod i = 0 then
        total := total + (i + (num / i));
      end if;
    end loop;
    return total;
end sum_factors;

result: Integer := 0;

begin
  for i in 1 .. SIZE loop
    spd.Append(sum_factors(i));
  end loop;
  for i in 1 .. SIZE loop
     if spd(i) < SIZE then
       if i /= spd(i) then
         if spd(spd(i)) = i then
           result := result + i;
         end if;
       end if;
     end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(result), Side => Both));
end pe021;
