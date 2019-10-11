with Ada.Text_IO; use Ada.Text_IO;

procedure pe001 is

total : Integer := 0;
max   : constant Integer := 1000;

begin
  for i in 1 .. (max - 1) loop
    if ((i mod 3 = 0) or (i mod 5 = 0)) then
      total := total + i;
    end if;
  end loop;
  Put_Line (Integer'Image(total));
end pe001;
