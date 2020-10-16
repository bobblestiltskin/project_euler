#!/usr/bin/perl -w
use strict;

my $last = 2000000;

my @primes = (2);
my $sum = 2;
for (my $test=3; $test < $last; $test += 2) {
  if (is_prime($test, \@primes)) {
    push @primes, $test;
    $sum += $test;
  }
}

print $sum,"\n";

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
