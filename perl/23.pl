#!/usr/bin/perl -w
use strict;

my $MAX = 28123;

#my @deficient;
#my @perfect;
my @abundant;
foreach (1 .. $MAX) {
#  push @perfect, $_ if ($_ == sum_factors($_));
#  push @deficient, $_ if ($_ > sum_factors($_));
  push @abundant, $_ if ($_ < sum_factors($_));
}

my $sum=0;
my $addi;
foreach my $i (1 .. $MAX) {
  $addi = 0;
  foreach my $j (@abundant) {
    if ($i < $j) {
      $addi = 1;
      last;
    }
    my $diff = $i - $j;
    last if (grep {/^$diff$/} @abundant);
  }
  if ($addi) {
    print "ADDING $i\n";
    $sum += $i;
  }
}
print "SUM is $sum\n";

sub sum_factors {
  my $number = shift;

  my $sum = 1;
  for (my $i = 2; $i <= sqrt($number); $i++) {
    if (!($number % $i)) {
      my $divisor = $number / $i;
      $sum += $i;
      $sum += $divisor if ($i != $divisor);
    }
  }
  return $sum;
}
