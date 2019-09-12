#!/usr/bin/perl6

# need to compute 2n!/((n!)*(n!))

my $limit = 20;
my (@numerator, @denominator);
loop (my $i=0; $i < $limit; $i++) {
  push @denominator, $i+1;
  push @numerator, $i+$limit+1;
}

#  walk through lists and cast away multiples to reduce size of numbers from
#  factorials - this is incomplete factoring but sufficient for this problem
#  we could factor both completely if we wanted...

for (@denominator) -> $i {
  my $n = $i;
  for (@numerator) -> $j {
    my $k = $j;
    if (($n != 1) and (($k % $n) == 0)) {
      $k = $k / $n;
      $n = 1
    }
  }
}

my $num = 1;
my $denom = 1;
loop (my $m = 0; $m < $limit; $m++) {
  $num *= @numerator[$m];
  $denom *= @denominator[$m];
}
    
say $num/$denom;
