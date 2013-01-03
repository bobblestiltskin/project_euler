package DataHash;

use strict;
use warnings;

use Exporter;
our (@ISA, @EXPORT_OK);
@ISA =qw(Exporter);
@EXPORT_OK = qw(get_data_hash dump_column_to_files);

use DirHandle;

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
            my ($user, $system, $elapsed) = ($_ =~ /^([\d.]+)user\s+([\d.]+)system\s+([\d.:]+)elapsed/);
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
  return $hash;
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
        print $fh $hash->{$language}->{$number}->{$field},"\n";
      }
    } else {
      print "Can not open $file, $!\n"
    }
  }
}

1;
