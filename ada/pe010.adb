--  this computes projecteuler.net problem 010

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

with Prime; use Prime;

procedure pe010 is

LAST : constant Integer := 2000000;

primes : prime_array(1 .. LAST) := (1 => 2, 2 => 3, others => 0);

vsize  : Integer := 2;
psum   : Long_Integer := 5;

test   : Integer;

begin
  test := primes(vsize) + 2;
  while test < LAST loop
    if isprime_array(test, primes) then
      vsize := vsize + 1;
      primes(vsize) := test;
      psum := psum + Long_Integer(test);
    end if;
    test := test + 2;
  end loop;
  Put (Ada.Strings.Fixed.Trim(Long_Integer'Image(psum), Side => Both));
end pe010;
