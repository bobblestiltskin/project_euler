--  this computes projecteuler.net problem 005

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Prime; use Prime;

procedure pe005 is

MAX         : constant Integer := 20;

i           : Integer := 2;
try_product : boolean := true;
total       : Integer := 1;
tmp         : Integer;
last        : Integer;

begin
  while i <= MAX loop
    if isprime(i) then
      if try_product then
        if (i * i) > MAX then
          try_product := false;
        else
          tmp := i;
          last := i;
          while tmp <= MAX loop
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
  Put (Ada.Strings.Fixed.Trim(Integer'Image(total), Side => Both));
end pe005;
