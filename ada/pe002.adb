with Ada.Text_IO; use Ada.Text_IO;

procedure pe002 is

total    : Integer := 0;
previous : Integer := 1;
current  : Integer := 1;
next     : Integer;
max      : constant Integer := 4000000;

begin
  while (current < max) loop
    next := previous + current;
    if (current mod 2 = 0) then
      total := total + current;
    end if;
    previous := current;
    current := next;
  end loop;
  Put_Line (Integer'Image(total));
end pe002;
