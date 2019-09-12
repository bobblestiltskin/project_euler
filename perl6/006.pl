#!/usr/bin/perl6

my $sumsq = 0;
for (1 .. 100) {
  $sumsq += $_*$_;
}

my $sqsum = (101 * 50) ** 2;
say $sqsum - $sumsq;
