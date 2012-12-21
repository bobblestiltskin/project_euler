#! /usr/bin/gforth

create primes 2 c, 3 c, 5 c, 7 c, 11 c, 13 c, 17 c, 19 c,

: myloop
( maximum power of 2 in 1..20 is 16 or 2^4 )
( maximum power of 3 in 1..20 is 9 or 3^2 )
( maximum power of other primes < 20 is n^1 )
( we initialise the result to the powers of 2 and 3 above 1 )
2 2 * 2 * 3 *
( and then multiply by each of the primes )
8 0 do 
  i primes + c@ * 
loop
;

myloop . cr

bye
