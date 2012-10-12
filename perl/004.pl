#!/usr/bin/perl -w
use strict;

my $MAX3 = 999;
my $MIN3 = 100;
my $maxp = 0;

my $mini = $MIN3;
my $minj = $MIN3;
for (my $i = $MAX3; $i >= $mini; $i--) {
  for (my $j = $MAX3; $j >= $minj; $j--) {
    my $product = $i * $j;
    if ($product eq reverse $product) {
      if ($product > $maxp) {
        $maxp = $product;
        $mini = $minj = $product / 1000; # optimize
      }
    }
  }
}
print "$maxp\n";
