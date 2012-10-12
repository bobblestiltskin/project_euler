#!/usr/bin/perl -w
use strict;

my $last = 10001;
my @primes = qw(2 3);

my $test = $primes[-1] + 2;
while (@primes < $last) {
  if (is_prime($test, \@primes)) {
    push @primes, $test;
  }
  $test += 2;
}
print $primes[-1],"\n";

sub is_prime {
  my $test = shift;
  my $known_primes_ref = shift;

  my $root = sqrt($test);
  foreach my $number (@$known_primes_ref) {
    return 1 if ($number > $root);
    return 0 unless ($test % $number);
  }
  return 1;
}
