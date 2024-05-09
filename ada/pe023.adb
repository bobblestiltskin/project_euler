--  this computes projecteuler.net problem 023

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;

procedure pe023 is

MAX : constant Integer := 28123;
MIN : constant Integer := 24;

package Bool_Vec is new Ada.Containers.Vectors (Index_Type   => Positive, Element_Type => Boolean);
abool    : Bool_Vec.Vector;

package One_D_Vec is new Ada.Containers.Vectors (Index_Type   => Positive, Element_Type => Integer);
abundant    : One_D_Vec.Vector;

function sum_factors(num : Integer) return Integer is
  asum : Integer := 1;
  divisor : Integer := 1;
  upper : Integer := Integer(Float'Floor(Sqrt(Float(num))));
  begin
    for i in 2 .. upper loop
      if num mod i = 0 then
        divisor := num / i;
        asum := asum + i;
        if i /= divisor then
          asum := asum + divisor;
        end if;
      end if;
    end loop;
    return asum;
end sum_factors;

fsum: Integer;
gasum : Integer := 0;

diff : Integer;
addi: Boolean := false;

begin
  for i in 1 .. MAX loop
    fsum := sum_factors(i);
    if i < fsum then
      abundant.Append(i);
      abool.Append(true);
    else
      abool.Append(false);
    end if;
  end loop;
  
  for i in 1 .. MIN - 1 loop
    gasum := gasum + i;
  end loop;

  for i in MIN .. MAX loop
    addi := true;
    for abundant_item of abundant loop
      if abundant_item >= i then
        exit;
      end if;
      diff := i - abundant_item;
      if abool(diff) then
        addi := false;
        exit;
      end if;
    end loop;

    if addi then
      gasum := gasum + i;
    end if;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(gasum), Side => Both));
end pe023;
