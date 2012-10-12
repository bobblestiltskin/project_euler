#!/usr/bin/perl -w
use strict;

my @primes = qw(2 3 5 7 11 13 17 19);

# maximum power of 2 in 1..20 is 16 or 2^4
# maximum power of 3 in 1..20 is 9 or 3^2
# maximum power of other primes < 20 is n^1
my $result = 2 * 2 * 2 * 3;
# we initialise the result to the powers of 2 and 3 above 1
foreach my $prime (@primes) {
  $result *= $prime;
}
# and then multiply by each of the primes

print "$result\n";
