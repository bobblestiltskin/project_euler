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

=pod

=head1 get_data_hash

get_data_hash hashes all of the data.number.language files in the output directory and returns
all of the information from the data files hashed. The results are checked for consistency via ...

=cut

sub get_data_hash {
  my $output_dir = shift;
  
  my $hash;
  my $d = DirHandle->new($output_dir);
  if (defined $d) {
    while (defined(my $file = $d->read)) {
      next unless ($file =~ /^data\.([\w+-]+)\.(\d+)$/);
      my $language = $1;
      my $number = $2;
      if (open(my $fh, "<", join('/', $output_dir, $file))) {
        while (<$fh>) {
          if ($. == 2) {
            chomp;
            $_ =~ s/\s+//g;
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

=pod

=head1 check_results

check results takes the hash constructed in get_data_hash and checks that all of the results are consistent.

=cut

sub check_results {
  my $hash = shift;

# find the language with the highest number of solutions

  my @lang_nums;
  foreach my $language (keys %$hash) {
    push @lang_nums, {$language => scalar keys %{$hash->{$language}}};
  }
  my $max_pair = max @lang_nums;
  
# check the unique number of results per problem -
# if it is > 1 then we have found an anomaly

  my $first = (keys %$max_pair)[0];
  foreach my $number (sort {$a <=> $b} keys %{$hash->{$first}}) {
    my @results;
    foreach my $language (sort keys %$hash) {
      my $result = $hash->{$language}->{$number}->{result};
      push @results, $result if defined $result;
    }
    my $uniq = uniq @results;
    if ($uniq > 1) {
      print "----------------------------\n";
      print "RESULTS ERROR for number $number\n";
      foreach my $language (keys %$hash) {
        print $language,"\t'",$hash->{$language}->{$number}->{result},"'\n";
      }
    }
  }
}

=pod

=head1 dump_column_to_files

dump_column_to_files constructs a hash via get_data_hash and dumps a slice of this hash into a file.

invoked via : dump_column_to_files($output_dir, "times", "user");
        and : dump_column_to_files($output_dir, "output", "result");

=cut

sub dump_column_to_files {
  my $output_dir = shift;
  my $suffix = shift;
  my $field = shift;

  my $hash = get_data_hash($output_dir);

  foreach my $language (sort keys %$hash) {
    my $file = join('.', $language, $suffix);
    if (open(my $fh, ">", join('/', $output_dir, $file))) {
      foreach my $number (sort {$a <=> $b} keys %{$hash->{$language}}) {
        my $hlnf = $hash->{$language}->{$number}->{$field};
        print $fh (defined $hlnf) ? $hlnf : '*',"\n";
      }
    } else {
      print "Can not open $file, $!\n"
    }
  }
}

1;
