#!/usr/bin/perl -w
use strict;

my $number = 600851475143;

my $max_prime = 0;
my $i = 3;
while ($number != 1) {
  unless ($number % $i) {
    $max_prime = set_max_prime($i, $max_prime);
    $number = $number/$i;
  }
  $i += 2;
}
print "$max_prime\n";

sub set_max_prime {
  my $big = shift;
  my $max_prime = shift;

  my $is_prime = 1;
  my $count = 3;
  while ($is_prime and ($count**2 < $big)) {
    $is_prime = 0 unless ($big % $count);
    $count = $count + 2;
  }
  $max_prime = $big if ($is_prime && ($big > $max_prime));

  return $max_prime;
}
