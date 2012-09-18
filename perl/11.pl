#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my $orig = [[ qw(8 2 22 97 38 15 0 40 0 75 4 5 7 78 52 12 50 77 91 8) ],
         [ qw(49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 4 56 62 0) ],
         [ qw(81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 3 49 13 36 65) ],
         [ qw(52 70 95 23 4 60 11 42 69 24 68 56 1 32 56 71 37 2 36 91) ],
         [ qw(22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80) ],
         [ qw(24 47 32 60 99 3 45 2 44 75 33 53 78 36 84 20 35 17 12 50) ],
         [ qw(32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70) ],
         [ qw(67 26 20 68 2 62 12 20 95 63 94 39 63 8 40 91 66 49 94 21) ],
         [ qw(24 55 58 5 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72) ],
         [ qw(21 36 23 9 75 0 76 44 20 45 35 14 0 61 33 97 34 31 33 95) ],
         [ qw(78 17 53 28 22 75 31 67 15 94 3 80 4 62 16 14 9 53 56 92) ],
         [ qw(16 39 5 42 96 35 31 47 55 58 88 24 0 17 54 24 36 29 85 57) ],
         [ qw(86 56 0 48 35 71 89 7 5 44 44 37 44 60 21 58 51 54 17 58) ],
         [ qw(19 80 81 68 5 94 47 69 28 73 92 13 86 52 17 77 4 89 55 40) ],
         [ qw(4 52 8 83 97 35 99 16 7 97 57 32 16 26 26 79 33 27 98 66) ],
         [ qw(88 36 68 87 57 62 20 72 3 46 33 67 46 55 12 32 63 93 53 69) ],
         [ qw(4 42 16 73 38 25 39 11 24 94 72 18 8 46 29 32 40 62 76 36) ],
         [ qw(20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 4 36 16) ],
         [ qw(20 73 35 29 78 31 90 1 74 31 49 71 48 86 81 16 23 57 5 54) ],
         [ qw(1 70 54 71 83 51 54 69 16 92 33 48 61 43 52 1 89 19 67 48) ]];

# padding for left and right of data
my $three_zeroes = [ qw (0 0 0) ];
# padding of row of 26 zeroes for above and below data
my $zero_row;
foreach my $i (0 .. 25) {
  push @$zero_row, 0;
}
#
my $a;
# 3 zero rows 
for my $i (0 .. 2) {
  push @$a, $zero_row;
}
# the data padded either side with 3 zeroes
for my $i (0 .. 19) {
  push @$a, [ @$three_zeroes, @{$orig->[$i]}, @$three_zeroes ];
}
# and then 3 more zero rows
for my $i (0 .. 2) {
  push @$a, $zero_row;
}

my $max = 0;
my ($imax, $jmax, $type, @list);
# of course the matrix is stored upside down in memory cf with normal mathematical representation
# so we decrement our row counter and increment the column counter so then our 1,1 is the lower-left cell
for (my $i=22; $i > 2; $i--) {
  for (my $j=3; $j < 23; $j++) {
    my ($point, $direction, @tmp_list) = compute_point($a, $i, $j);
    if ($point > $max) {
      $max = $point;
      $type = $direction;
      $imax = 23 - $i;
      $jmax = $j - 2;
      @list = @tmp_list;
    }
  }
}
print "MAX is $max and ROW is $imax COLUMN is $jmax TYPE is $type and list is ",join(", ", @list),"\n";

sub compute_point {
  my ($a, $i, $j) = @_;

  my $max = 0;
  my $direction;
  my @list;

# north
  my $n = $a->[$i]->[$j] * $a->[$i-1]->[$j] * $a->[$i-2]->[$j] * $a->[$i-3]->[$j];
  if ($n > $max) {
    $max = $n;
    $direction = "north";
    @list = ($a->[$i]->[$j], $a->[$i-1]->[$j], $a->[$i-2]->[$j], $a->[$i-3]->[$j]);
  }    

# northeast
  my $ne = $a->[$i]->[$j] * $a->[$i-1]->[$j+1] * $a->[$i-2]->[$j+2] * $a->[$i-3]->[$j+3]; 
  if ($ne > $max) {
    $max = $ne;
    $direction = "northeast";
    @list = ($a->[$i]->[$j], $a->[$i-1]->[$j+1], $a->[$i-2]->[$j+2], $a->[$i-3]->[$j+3]);
  }    

# east
  my $e = $a->[$i]->[$j] * $a->[$i]->[$j+1] * $a->[$i]->[$j+2] * $a->[$i]->[$j+3]; 
  if ($e > $max) {
    $max = $e;
    $direction = "east";
    @list = ($a->[$i]->[$j], $a->[$i]->[$j+1], $a->[$i]->[$j+2], $a->[$i]->[$j+3]);
  }    

# southeast
  my $se = $a->[$i]->[$j] * $a->[$i+1]->[$j+1] * $a->[$i+2]->[$j+2] * $a->[$i+3]->[$j+3]; 
  if ($se > $max) {
    $max = $se;
    $direction = "southeast";
    @list = ($a->[$i]->[$j], $a->[$i+1]->[$j+1], $a->[$i+2]->[$j+2], $a->[$i+3]->[$j+3]);
  }    

# south
  my $s = $a->[$i]->[$j] * $a->[$i+1]->[$j] * $a->[$i+2]->[$j] * $a->[$i+3]->[$j]; 
  if ($s > $max) {
    $max = $s;
    $direction = "south";
    @list = ($a->[$i]->[$j], $a->[$i+1]->[$j], $a->[$i+2]->[$j], $a->[$i+3]->[$j]); 
  }    

# southwest
  my $sw = $a->[$i]->[$j] * $a->[$i+1]->[$j-1] * $a->[$i+2]->[$j-2] * $a->[$i+3]->[$j-3]; 
  if ($sw > $max) {
    $max = $sw;
    $direction = "southwest";
    @list = ($a->[$i]->[$j], $a->[$i+1]->[$j-1], $a->[$i+2]->[$j-2], $a->[$i+3]->[$j-3]);
  }    

# west
  my $w = $a->[$i]->[$j] * $a->[$i]->[$j-1] * $a->[$i]->[$j-2] * $a->[$i]->[$j-3]; 
  if ($w > $max) {
    $max = $w;
    $direction = "west";
    @list = ($a->[$i]->[$j], $a->[$i]->[$j-1], $a->[$i]->[$j-2], $a->[$i]->[$j-3]);
  }    

# northwest
  my $nw = $a->[$i]->[$j] * $a->[$i-1]->[$j-1] * $a->[$i-2]->[$j-2] * $a->[$i-3]->[$j-3]; 
  if ($nw > $max) {
    $max = $nw;
    $direction = "northwest";
    @list = ($a->[$i]->[$j], $a->[$i-1]->[$j-1], $a->[$i-2]->[$j-2], $a->[$i-3]->[$j-3]);
  }    

  return ($max, $direction, @list);
}
