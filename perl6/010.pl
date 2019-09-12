#!/usr/bin/perl6

my $last = 2000000;

my @primes = (2);
my $sum = 2;
loop (my $test=3; $test < $last; $test += 2) {
  if (is_prime($test, @primes)) {
    push @primes, $test;
    $sum += $test;
  }
}

print $sum,"\n";

sub is_prime($test, @known_primes) {
  my $root = sqrt($test);
  for (@known_primes) {
    return 1 if ($_ > $root);
    return 0 unless ($test % $_);
  }
  return 1;
}
