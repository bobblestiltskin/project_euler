#!/usr/bin/perl -w
use strict;
use CGI;
use Sys::Hostname;
use DataHash qw(get_data_hash);

my $InfoName = "Linux::Proc::Cpuinfo";
my $have_proc_cpuinfo = 0;
eval qq(require $InfoName;);
if ($@) {
  print "Require failure for Linux::Proc::Cpuinfo, $@";
  print "Available from http://search.cpan.org/CPAN/authors/id/H/HA/HAGGAI/Linux-Proc-Cpuinfo-0.02.tar.gz\n";
  print "With dependencies http://search.cpan.org/CPAN/authors/id/M/MA/MATTN/Devel-CheckLib-0.98.tar.gz\n";
  print "and latest version of https://savannah.nongnu.org/projects/proccpuinfo/\n";
  print "which is http://download.savannah.gnu.org/releases/proccpuinfo/libproccpuinfo-0.0.8.tar.bz2";
  exit;
} else {
  $have_proc_cpuinfo = 1;
  import $InfoName;
}

my $query = CGI->new;
my $output_dir = "../output";
my $hash = get_data_hash($output_dir);
my $info = Linux::Proc::Cpuinfo->new;

my $hostname = hostname;
my $file = 'project_euler_timings_' . $hostname . '.html';
if (open(my $fh, '>', join('/', $output_dir, $file))) {
  print $fh $query->start_html(-title => 'Project Euler Timings for ' . $hostname),"\n";
  if ($have_proc_cpuinfo) {
    print $fh $query->start_table({-border => 1}),"\n";
    print_cpuinfo($fh, "Architecture", $info->architecture);
    print_cpuinfo($fh, "Hardware Platform", $info->hardware_platform);
    print_cpuinfo($fh, "Frequency", $info->frequency);
    print_cpuinfo($fh, "Bogomips", $info->bogomips);
    print_cpuinfo($fh, "Cache", $info->cache);
    print_cpuinfo($fh, "CPUs", $info->cpus);
    print $fh $query->end_table,"\n";
  }
  print $fh $query->start_table({-border => 1}),"\n";
  print $fh $query->start_Tr;
  print $fh $query->start_td;
  print $fh "Problem";
  print $fh $query->end_td;
  foreach my $language (sort keys %$hash) {
    print $fh $query->start_td;
    print $fh $language;
    print $fh $query->end_td;
  }
  print $fh $query->end_Tr,"\n";
  
  my $language = 'perl';
  foreach my $number (sort {$a <=> $b} keys %{$hash->{$language}}) {
    print $fh $query->start_Tr;
    print $fh $query->start_td;
    print $fh $number;
    print $fh $query->end_td;
    foreach my $language (sort keys %$hash) {
      print $fh $query->start_td({-align=>"right"});
      print $fh $hash->{$language}->{$number}->{elapsed} if (defined $hash->{$language}->{$number}->{elapsed});
      print $fh $query->end_td;
    }
    print $fh $query->end_Tr,"\n";
  }
  print $fh $query->end_table,"\n";
  print $fh $query->end_html,"\n";
} else {
  print "Could not open $file for writing, $!";
}

sub print_cpuinfo {
  my $fh = shift;
  my $text = shift;
  my $info = shift;
  if (defined $info) {
    print $fh $query->start_Tr;
    print $fh $query->start_td;
    print $fh $query->start_b;
    print $fh $text;
    print $fh $query->end_b;
    print $fh $query->end_td;
    print $fh $query->start_td;
    print $fh $info;
    print $fh $query->end_td;
    print $fh $query->end_Tr,"\n";
  }
}
