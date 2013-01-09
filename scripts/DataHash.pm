package DataHash;

use strict;
use warnings;

use DirHandle;
use List::Util qw(max);
use List::MoreUtils qw{uniq};

use Exporter;
our (@ISA, @EXPORT_OK);
@ISA =qw(Exporter);
@EXPORT_OK = qw(get_data_hash dump_column_to_files);

sub get_data_hash {
  my $output_dir = shift;
  
  my $hash;
  my $d = DirHandle->new($output_dir);
  if (defined $d) {
    while (defined(my $file = $d->read)) {
      next unless ($file =~ /^data\.([\w+]+)\.(\d+)$/);
      my $language = $1;
      my $number = $2;
      if (open(my $fh, "<", join('/', $output_dir, $file))) {
        while (<$fh>) {
          if ($. == 2) {
            chomp;
            $hash->{$language}->{$number}->{result} = $_;
          } elsif ($. == 3) {
            my ($user, $system, $elapsed) = ($_ =~ /^([\d.:]+)user\s+([\d.:]+)system\s+([\d.:]+)elapsed/);
            $hash->{$language}->{$number}->{user} = $user;
            $hash->{$language}->{$number}->{system} = $system;
            $hash->{$language}->{$number}->{elapsed} = $elapsed;
          }
        }
        close $fh;
      } else {
        print "Can not open $file, $!\n";
      }
    }
    undef $d;
  }
  check_results($hash);
  return $hash;
}

sub check_results {
  my $hash = shift;

# find the language with the highest number of solutions

  my @lang_nums;
  foreach my $language (keys %$hash) {
    push @lang_nums, {$language => scalar keys %{$hash->{$language}}};
  }
  my $max_pair = max values @lang_nums;
  
# check the unique number of results per problem -
# if it is > 1 then we have found an anomaly

  foreach my $number (sort {$a <=> $b} keys $hash->{(keys %$max_pair)[0]}) {
    my @results;
    foreach my $language (sort keys $hash) {
      my $result = $hash->{$language}->{$number}->{result};
      push @results, $result if defined $result;
    }
    my $uniq = uniq @results;
    if ($uniq > 1) {
      print "----------------------------\n";
      print "RESULTS ERROR for number $number\n";
      foreach my $language (keys %$hash) {
        print $language,"\t",$hash->{$language}->{$number}->{result},"\n";
      }
    }
  }
}

sub dump_column_to_files {
  my $output_dir = shift;
  my $suffix = shift;
  my $field = shift;

  my $hash = get_data_hash($output_dir);

  foreach my $language (sort keys $hash) {
    my $file = join('.', $language, $suffix);
    if (open(my $fh, ">", join('/', $output_dir, $file))) {
      foreach my $number (sort {$a <=> $b} keys $hash->{$language}) {
        my $hlnf = $hash->{$language}->{$number}->{$field};
        print $fh (defined $hlnf) ? $hlnf : '*',"\n";
      }
    } else {
      print "Can not open $file, $!\n"
    }
  }
}

1;