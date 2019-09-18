with Ada.Text_IO; use Ada.Text_IO;
with Prime; use Prime;
procedure pe005 is

--function isprime(num : Integer) return boolean is
--
--  divisor : Integer;
--
--  begin
--    if (num mod 2 = 1) then
--      if (num < 8) then
--        if (num = 1) then
--          return false;
--        else
--          return true;
--        end if;
--      else
--        divisor := 3;
--        while ((divisor * divisor) <= num) loop
--          if (num mod divisor = 0) then
--            return false;
--          end if;
--          divisor := divisor + 2;
--        end loop;
--        return true;
--      end if;
--    else
--      if (num = 2) then
--        return true;
--      else
--        return false;
--      end if;
--    end if;
--end isprime;

i           : Integer := 2;
max         : constant Integer := 20;
try_product : boolean := true;
total       : Integer := 1;
tmp         : Integer;
last        : Integer;

begin
  while i <= max loop
    if isprime(i) then
      if try_product then
        if (i * i) > max then
          try_product := false;
        else
          tmp := i;
          last := i;
          while tmp <= max loop
            last := tmp;
            tmp := tmp * i;
          end loop;
          total := total * last;
        end if;
      end if;
      if not try_product then
        total := total * i;
      end if;
    end if;
    i := i + 1;
  end loop;
  Put_Line (Integer'Image(total));
end pe005;
