#!/usr/bin/perl -w
use strict;

my $MAX = 28123;

my @abundant;
my %abundant;
foreach (1 .. $MAX) {
  my $sf = sum_factors($_);
  if ($_ < $sf) {
    push @abundant, $_;
    $abundant{$_} = $sf;
  }
}

my $sum=0;
foreach my $i (1 .. $abundant[0] - 1) {
  $sum += $i;
}
foreach my $i ($abundant[0] .. $MAX) {
  my $addi = 1;
  foreach my $j (@abundant) {
    last if ($j >= $i);
    if ($abundant{$i - $j}) {
      $addi = 0;
      last;
    }
  }
  if ($addi) {
    $sum += $i;
  }
}
print $sum,"\n";

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
