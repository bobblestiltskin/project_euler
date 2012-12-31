#!/usr/bin/perl -w
use strict;

my $i = 2;
my $max = 20;
my $try_prod = 1;
my $total = 1;
while ($i <= $max) {
  if (isprime($i)) {
    if ($try_prod) {
      my $tmp = 1;
      if (($i * $i) > $max) {
        $try_prod = 0;
        $total *= $i;
#        print "I is $i and TOTAL is $total\n";
      } else {
        my $last;
        while ($tmp <= $max) {
          $last = $tmp;
          $tmp *= $i;
        }
        $total *= $last;
#        print "I is $i and LAST is $last and TOTAL is $total\n";
      }
    } else {
      $total *= $i;
#      print "I is $i and TOTAL is $total\n";
    }
  }
#  print "i is ",$i," and isprime is ",isprime($i),"\n";
  $i++;
}
print "$total\n";

sub isprime {
  my $num = shift;
  if ($num % 2) {
    if ($num < 8) {
      return $num == 1 ? 0 : 1; # 1 is the only odd number < 8 not prime
    } else {
      my $divisor = 3;
      while (($divisor * $divisor) <= $num) {
        return 0 unless ($num % $divisor);
        $divisor += 2;
      }
      return 1;
    }
  } else {
    return $num == 2 ? 1 : 0; # 2 is only even prime
  }
}
