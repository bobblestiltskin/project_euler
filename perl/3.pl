#!/usr/bin/perl -w
use strict;

my $number = 600851475143;

my $max_prime = 0;
for my $i (2 .. sqrt($number)) {
  my $matched_2 = 0;
  my $matched_3 = 0;
  my $divi = 0;
  unless ($number % $i) {
    $divi = $number/$i;
    print "FACTOR of $number is  ($i * $divi)\n";
    for my $j (2 .. sqrt($i)) {
      unless ($i % $j) {
        print "2 FACTOR of $i is ($j * ",$i/$j,")\n";
        $matched_2 = 1;
      }
    }
    for my $k (2 .. sqrt($divi)) {
      unless ($divi % $k) {
        print "3 FACTOR of $divi is ($k * ",$divi/$k,")\n";
        $matched_3 = 1;
      }
    }
  }
  if ($divi) {
    $max_prime = $i if (!$matched_2 && ($i > $max_prime));
    $max_prime = $divi if (!$matched_3 && ($divi > $max_prime));
  }
}
print "MAX PRIME divisor of $number is $max_prime\n";
