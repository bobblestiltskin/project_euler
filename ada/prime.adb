--package prime is

--  function isprime(num : Integer) return boolean;

package body prime is

  function isprime(num : Integer) return boolean is
    divisor : Integer;
    begin
      if (num mod 2 = 1) then
        if (num < 8) then
          if (num = 1) then
            return false;
          else
            return true;
          end if;
        else
          divisor := 3;
          while ((divisor * divisor) <= num) loop
            if (num mod divisor = 0) then
              return false;
            end if;
            divisor := divisor + 2;
          end loop;
          return true;
        end if;
      else
        if (num = 2) then
          return true;
        else
          return false;
        end if;
      end if;
  end isprime;

end prime;
