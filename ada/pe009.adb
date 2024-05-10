--  this computes projecteuler.net problem 009

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Command_Line;

procedure pe009 is

STOP   : constant Integer := 1000;

begin
Outer_Loop:
  for a in 1 .. STOP loop
    for b in (a+1) .. STOP loop
      for c in (b+1) .. STOP loop
        if (a+b+c) = STOP then
          if ((a*a)+(b*b)) = (c*c) then
            Put (Ada.Strings.Fixed.Trim(Integer'Image(a*b*c), Side => Both));
            Ada.Command_Line.Set_Exit_Status(0);
            exit Outer_Loop;
          end if;
        end if;
      end loop;
    end loop;
    Ada.Command_Line.Set_Exit_Status(1);
  end loop Outer_Loop;
end pe009;
