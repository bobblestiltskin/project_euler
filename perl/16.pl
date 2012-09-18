#!/usr/bin/perl -w
use strict;

use Math::BigInt;

my $x = Math::BigInt->new(2);
my $y = Math::BigInt->new(1000);
$x = $x->bpow($y);

my $string = $x->bstr();
my $sum = 0;
for my $offset (0 .. length($string) - 1) {
  $sum += substr($string, $offset, 1)
}
print "SUM is $sum\n";  

