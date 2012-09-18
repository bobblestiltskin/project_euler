#!/usr/bin/perl -w
use strict;

# O    
# 
# 01 11
# 
# OO 
# OO
# 
# 01 02 12 22
# 01 11 12 22
# 01 11 21 22
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
# OOOO
# OOOO
# OOOO
# OOOO

use Data::Dumper;
#use Memoize;
#memoize('add_child');

(@ARGV == 1) or die "Need a number to count up to, $!";
my $max = $ARGV[0];

my $a;
my $key = "00,00";
my $counter = 0;
$a = add_child($a, $key, $max);
#print Data::Dumper->Dump([$a]);
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
