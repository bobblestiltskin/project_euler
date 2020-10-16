#!/usr/bin/perl6

my $number = 600851475143;

my $max_prime = 0;
my $i = 3;
while ($number != 1) {
  if ($number % $i) {
    $i += 2;
  } else {
    $max_prime = $i;
    $number = $number/$i;
  }
}
say $max_prime;
