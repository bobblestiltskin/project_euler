#!/usr/bin/perl6 -w
#use strict;

my $last = 10001;
my @primes = <2 3>;

my $test = @primes[*-1] + 2;
while (@primes < $last) {
  if (is_prime($test, @primes)) {
    push @primes, $test;
  }
  $test += 2;
}
say @primes[*-1];

sub is_prime($test, @known_primes) {
  my $root = sqrt($test);
  for (@known_primes) {
    return 1 if ($_ > $root);
    return 0 unless ($test % $_);
  }
  return 1;
}
