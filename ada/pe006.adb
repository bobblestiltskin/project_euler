with Ada.Text_IO; use Ada.Text_IO;

procedure pe006 is

max   : constant Integer := 100;
sumsq : Integer := 0;
sqsum : Integer := 0;

begin
  for i in 1 .. max loop
    sumsq := sumsq + (i * i);
  end loop;
  sqsum := ((max + 1) * (max / 2)) ** 2;
  Put_Line (Integer'Image(sqsum - sumsq));
end pe006;
