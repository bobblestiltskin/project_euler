with Ada.Numerics.Elementary_Functions;  use Ada.Numerics.Elementary_Functions;

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

  function isprime_array(num : Integer; known_primes : prime_array) return boolean is
    root : Float := Float(num);
    begin
      root := Sqrt(root);
      for i in known_primes'range loop
        if Float(known_primes(i)) > root then
          return true;
        end if;
        if num mod known_primes(i) = 0 then
          return false;
        end if;
      end loop;
      return true;
  end isprime_array;

end prime;
