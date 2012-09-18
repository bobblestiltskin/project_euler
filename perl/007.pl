#!/usr/bin/perl -w
use strict;

(@ARGV == 1) or die "Need an integer which specifies which prime to find, $!";
my $last = shift;
my @primes = qw(2 3);

my $test = $primes[-1] + 2;
while (@primes < $last) {
#print "TEST is $test\n";
  if (is_prime($test, \@primes)) {
    push @primes, $test;
  }
  $test += 2;
}
#print "P are ",join(" ", @primes),"\n";
print "PRIME ",$last," is ", $primes[-1],"\n";

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
