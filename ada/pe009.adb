with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe009 is

stop   : constant Integer := 1000;

begin
  for a in 1 .. stop loop
    for b in (a+1) .. stop loop
      for c in (b+1) .. stop loop
        if (a+b+c) = stop then
          if ((a*a)+(b*b)) = (c*c) then
            Put (Ada.Strings.Fixed.Trim(Integer'Image(a*b*c), Side => Both));
          end if;
        end if;
      end loop;
    end loop;
  end loop;
end pe009;
