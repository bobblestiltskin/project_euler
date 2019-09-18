with Ada.Text_IO; use Ada.Text_IO;
procedure pe003 is

max_prime : Integer := 0;
i         : Integer := 3;
number    : Long_Integer := 600851475143;

begin
  while number /= 1 loop
    if (number mod Long_Integer(i) = 0) then
       max_prime := i;
       number := number / Long_Integer(i);
    else
       i := i + 2;
    end if;
  end loop;
  Put_Line (Integer'Image(max_prime));
end pe003;
