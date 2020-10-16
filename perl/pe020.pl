#!/usr/bin/perl -w
use strict;
use Math::BigInt;

my $num = Math::BigInt->new(1);
for (1 .. 100) {
  $num *= $_;
}
my $string = "" . $num; # stringify
my $sum = 0;
for (0 .. length($string) - 1) {
  my $digit = substr($string, $_, 1);
  $sum += $digit;
}
print $sum,"\n";
