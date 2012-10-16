#!/usr/bin/perl -w
use strict;

my $MAX = 28123;

my @abundant;
foreach (1 .. $MAX) {
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
    $sum += $i;
  }
}
print "$sum\n";

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
