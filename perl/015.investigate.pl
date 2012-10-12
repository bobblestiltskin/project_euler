#!/usr/bin/perl -w
use strict;

# there is a pattern ..
#
# we can reflect about the diagonal and specify
# the routes through the grid (all routes)
#
# O    
# 
# 01 11
# so 2 routes
# 
# OO 
# OO
# 
# 01 02 12 22
# 01 11 12 22
# 01 11 21 22
#
# 6 routes as specified
# 
# OOO  
# OOO 
# OOO
# 
# 01 02 03 13 23 33
# 01 02 12 13 23 33
# 01 02 12 22 23 33
# 01 02 12 22 32 33
# 01 11 12 13 23 33
# 01 11 12 22 23 33
# 01 11 12 22 32 33
# 01 11 21 31 32 33
# 01 11 21 22 23 33
# 01 11 21 22 32 33
# 
# 20 routes

# for i in 1 2 3 4 5 6 7 8
# > do
# > perl perl/015.pl $i
# > done
# COUNTER is 2 or 2*1
# COUNTER is 6 or 2*3
# COUNTER is 20 or 2*10
# COUNTER is 70 or 2*35
# COUNTER is 252 or 2*126
# COUNTER is 924 or 2*462
# COUNTER is 3432 or 2*1716
# COUNTER is 12870 or 2*6435
# 
# and then we find that this is
# described in 
# http://en.wikipedia.org/wiki/Central_binomial_coefficient
# which allows for the solution to be computed ...

use Data::Dumper;
#use Memoize;
#memoize('add_child');

(@ARGV == 1) or die "Need a number to count up to, $!";
my $max = $ARGV[0];

my $a;
my $key = "00,00";
my $counter = 0;
$a = add_child($a, $key, $max);
print Data::Dumper->Dump([$a]);
print "COUNTER is $counter or 2*",$counter>>1,"\n";

sub add_child {
  my $ptr = shift;
  my $key = shift;
  my $max = shift;

  my ($i, $j) = split /,/, $key;
#print "add_child : I is $i and J is $j\n";

  my $list = [];
  if ($j < $max) {
    my $new_key = sprintf("%02d,%02d",$i,$j+1);
    push @{$list}, add_child($ptr->{$key}, $new_key, $max);
#print "J KEY is $key, NEW KEY is $new_key, MAX is $max\n";
  }
    
  if ($i < $max) {
    my $new_key = sprintf("%02d,%02d",$i+1,$j);
    push @{$list}, add_child($ptr->{$key}, $new_key, $max);
#print "I KEY is $key, NEW KEY is $new_key, MAX is $max\n";
  }
  $ptr->{$key} = $list;
  $counter++ unless @$list;

  return $ptr;
}
