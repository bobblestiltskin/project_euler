--  this computes projecteuler.net problem 015

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure pe015 is

asize: constant Integer := 20;

num : Long_Integer;
denom : Long_Integer;

denominator: array(1 .. asize) of Integer := (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
numerator: array(1 .. asize) of Integer := (21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40);

begin
--
--  need to compute 2n!/((n!)*(n!))
--
--  walk through lists and cast away multiples to reduce size of numbers from
--  factorials - this is incomplete factoring but sufficient for this problem
--  we could factor both completely if we wanted
--  or skip this initialisation phase and use Big_Integers for num and denom 

  for i in 1 .. asize loop
    for j in 1 .. asize loop
      if ((denominator(i) /= 1) and (numerator(j) mod denominator(i) = 0)) then
        numerator(j) := numerator(j) / denominator(i);
        denominator(i) := 1;
      end if;
    end loop;
  end loop;

  num := 1;
  denom := 1;
  for i in 1 .. asize loop
    num := num * Long_Integer(numerator(i));
    denom := denom * Long_Integer(denominator(i));
  end loop;
  Put (Ada.Strings.Fixed.Trim(Long_Integer'Image(num / denom), Side => Both));
end pe015;
