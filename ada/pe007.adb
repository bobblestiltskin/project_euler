with Ada.Text_IO; use Ada.Text_IO;
with Prime; use Prime;

procedure pe007 is

last   : Integer := 10001;
primes : prime_array(1 .. last) := (1 => 2, 2 => 3, others => 0);
test   : Integer;
vsize  : Integer := 2;

begin
  test := primes(vsize) + 2;
  while vsize < last loop
    if isprime_array(test, primes) then
      vsize := vsize + 1;
      primes(vsize) := test;
    end if;
    test := test + 2;
  end loop;
  Put_Line (Integer'Image(primes(vsize)));
end pe007;
