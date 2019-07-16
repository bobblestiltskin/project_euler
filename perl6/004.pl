#!/usr/bin/perl6 -w
#use strict;

my $MAX3 = 999;
my $MIN3 = 100;
my $maxp = 0;

my $mini = $MIN3;
my $minj = $MIN3;
my $maxj = $MAX3;
loop (my $i = $MAX3; $i >= $mini; $i--) {
  loop (my $j = $maxj; $j >= $minj; $j--) {
    my $product = $i * $j;
    if ($product eq $product.flip) {
      if ($product > $maxp) {
        $maxp = $product;
        $mini = $minj = $product / 1000; # optimize
      }
    }
  }
  $maxj = $i;
}
say $maxp;
