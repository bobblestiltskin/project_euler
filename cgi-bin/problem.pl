#!/usr/bin/perl -w

# to display solutions for any problem in all written languages
use strict;
use CGI;
use DirHandle;

my $extensions = {
  asm    => 's',
  c      => 'c',
  'c++'  => 'cpp',
  forth  => 'fth',
  perl   => 'pl',
  python => 'py',
};

my $dir = '../project_euler/';
my $query = CGI->new;

print $query->header;
#print $query->start_html;
#print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";

my $number = $query->param('number');
#print "<p>DIR is $dir</p>\n";
if ((defined $number) and ($number =~ /^\d+$/)) {
  print $query->start_html(-title => 'Project Euler Problem ' . $number);
#              -link => 'rel="stylesheet" href="/new.css" type="text/css"');
  print '<link rel="stylesheet" href="/new.css" type="text/css">' . "\n";
  my $dirh = DirHandle->new($dir);
  print '<a href="http://projecteuler.net/problem=', $number, '">Description of problem</a>',"\n";
  if (defined $dirh) {
    while (defined (my $subdir = $dirh->read)) {
      next if (($subdir eq '.') or ($subdir eq '..'));
      next unless (grep {/^$subdir$/} keys %$extensions);
#print "<p> GOOD SUBDIR is $subdir</p>\n";
      my $subdirh = DirHandle->new($dir . $subdir);
      if (defined $subdirh) {
#print "<p>NUMBER is $number</p>\n";
        while (defined (my $file = $subdirh->read)) {
#print "<p>FILE is $file</p>\n";
          if ($file eq join(".", $number, $extensions->{$subdir})) {
            print $query->h3($subdir);
#            print $query->start_pre(-class => "example");
            $file = join('/', $dir, $subdir, $file);
            display_file($file);
            last;
          }
        }
        $subdirh->rewind;
        while (defined (my $file = $subdirh->read)) {
          if ($file eq "Makefile") {
            $file = join('/', $dir, $subdir, $file);
#print "<p>FILE is $file</p>\n";
            open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
            while (<$fh>) {
#print "<p>NUMBER is $number</p>\n";
              if (s/^$number: //) {
#print "<p>NUMBER is $number</p>\n";
                my @dependencies = split(/ /);
                foreach my $file (@dependencies) {
#print "<p>DEPENDENCY is $file</p>\n";
                  display_file(join('/', $dir, $subdir, $file));
                }
              }
            }
          }
#          last;
        }
      }
    }
  } 
} else {
  print $query->start_html;
  print "Need 1 number as an argument!!!", "\n";
}
print $query->end_html;

sub display_file {
  my $file = shift;

  chomp($file);
  print '<pre class="example">' . "\n";
  open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
  while (<$fh>) {
    s/\&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    print;
  }
  close $fh;
  print $query->end_pre;
}
