#!/usr/bin/perl -w
use strict;

# need to compute 2n!/((n!)*(n!))

my $limit = 20;
my ($numerator, $denominator);
for (my $i=0; $i < $limit; $i++) {
  push @$denominator, $i+1;
  push @$numerator, $i+$limit+1;
}

#  walk through lists and cast away multiples to reduce size of numbers from
#  factorials - this is incomplete factoring but sufficient for this problem
#  we could factor both completely if we wanted...

foreach my $i (@$denominator) {
  foreach my $j (@$numerator) {
    if (($i != 1) and (($j % $i) == 0)) {
      $j = $j / $i;
      $i = 1
    }
  }
}

my $num = 1;
my $denom = 1;
for (my $i = 0; $i < $limit; $i++) {
  $num *= $numerator->[$i];
  $denom *= $denominator->[$i];
}
    
print $num/$denom,"\n";
