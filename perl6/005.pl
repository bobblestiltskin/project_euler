#!/usr/bin/perl6 -w
#use strict;

my $i = 2;
my $max = 20;
my $try_product = 1;
my $total = 1;
while ($i <= $max) {
  if (isprime($i)) {
    if ($try_product) {
      if (($i * $i) > $max) {
        $try_product = 0;
      } else {
        my $tmp = $i;
        my $last = $tmp;
        while ($tmp <= $max) {
          $last = $tmp;
          $tmp *= $i;
        }
        $total *= $last;
      }
    } 
    $total *= $i if (!$try_product);
  }
  $i++;
}
say $total;

sub isprime($num) {
  if ($num % 2) {
    if ($num < 8) {
      return $num == 1 ?? 0 !! 1; # 1 is the only odd number < 8 not prime
    } else {
      my $divisor = 3;
      while (($divisor * $divisor) <= $num) {
        return 0 unless ($num % $divisor);
        $divisor += 2;
      }
      return 1;
    }
  } else {
    return $num == 2 ?? 1 !! 0; # 2 is only even prime
  }
}
