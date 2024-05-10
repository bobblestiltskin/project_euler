--  this computes projecteuler.net problem 007

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Prime; use Prime;

procedure pe007 is

LAST   : constant Integer := 10001;

primes : prime_array(1 .. LAST) := (1 => 2, 2 => 3, others => 0);
vsize  : Integer := 2;
test   : Integer;

begin
  test := primes(vsize) + 2;
  while vsize < LAST loop
    if isprime_array(test, primes) then
      vsize := vsize + 1;
      primes(vsize) := test;
    end if;
    test := test + 2;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Integer'Image(primes(vsize)), Side => Both));
end pe007;
