#!/usr/bin/perl6

my $MAX = 28123;

my @abundant;
my %abundant;
for (1 .. $MAX) {
  my $sf = sum_factors($_);
  if ($_ < $sf) {
    push @abundant, $_;
    %abundant{$_} = $sf;
  }
}

my $sum=0;
for (1 .. @abundant[0] - 1) {
  $sum += $_;
}
for (@abundant[0] .. $MAX) -> $i {
  my $addi = 1;
  for @abundant -> $j {
    last if ($j >= $i);
    if (%abundant{$i - $j}) {
      $addi = 0;
      last;
    }
  }
  if ($addi) {
    $sum += $i;
  }
}
say $sum;

sub sum_factors($number)
{
  my $sum = 1;
  loop (my $i = 2; $i <= sqrt($number); $i++) {
    if (!($number % $i)) {
      my $divisor = $number / $i;
      $sum += $i;
      $sum += $divisor if ($i != $divisor);
    }
  }
  return $sum;
}
