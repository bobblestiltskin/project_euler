#!/usr/bin/perl -w

# to display solutions for any problem in all written languages
use strict;
use CGI;
use DirHandle;
use PEcgi qw(display_file get_web_page decode_web_page get_problem_as_string);

my $extensions = {
  asm    => 's',
  c      => 'c',
  'c++'  => 'cpp',
  java   => 'java',
  forth  => 'fs',
  perl   => 'pl',
  python => 'py',
};

my $prefix = {
  java => 'pe',
};

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;
my $number = $query->param('number');
if ((defined $number) and ($number =~ /^\d+$/)) {
  print $query->start_html(-title => 'Project Euler Problem ' . $number);
  print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";
  print get_problem_as_string($number);
  my $dirh = DirHandle->new($dir);
  if (defined $dirh) {
    while (defined (my $subdir = $dirh->read)) {
      next if (($subdir eq '.') or ($subdir eq '..'));
      next unless (grep {/^$subdir$/} keys %$extensions);
      my $subdirh = DirHandle->new($dir . $subdir);
      if (defined $subdirh) {
        while (defined (my $file = $subdirh->read)) {
          if ($file eq join('', $prefix->{$subdir}, join(".", $number, $extensions->{$subdir}))) {
            print $query->h3($subdir);
            display_file($query, join('/', $dir, $subdir), $file);
            if ($subdir eq 'forth') {
              open(my $fh, "<", join('/', $dir, $subdir, $file)) or print "Cannot open ",$file,": $!";
              while (<$fh>) {
                if (/^\s*include\s+(.+\.fs)\s*$/) {
                  display_file($query, join('/', $dir, $subdir), $1);
                }
              }
              close $fh;
            }
            last;
          }
        }
        $subdirh->rewind;
        while (defined (my $file = $subdirh->read)) {
          if ($file eq "Makefile") {
            $file = join('/', $dir, $subdir, $file);
            open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
            while (<$fh>) {
              if (s/^$number: //) {
                my @dependencies = split(/ /);
                foreach my $file (@dependencies) {
                  if ($file =~ /\.(s|c\w*)$/) {
                    (my $header = $file) =~ s/\.\w+$/.h/;
                    chomp(my $full_header = join('/', $dir, $subdir, $header));
                    if (-e "$full_header") {
                      display_file($query, join('/', $dir, $subdir), $header);
                    }
                  }
                  display_file($query, join('/', $dir, $subdir), $file) unless ($file eq join('', $prefix->{$subdir}, join(".", $number, $extensions->{$subdir})));
                }
              }
            }
          }
        }
      }
    }
  } 
} else {
  print $query->start_html;
  print "Need 1 number as an argument!!!", "\n";
}
print $query->end_html;
