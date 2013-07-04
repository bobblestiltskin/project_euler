package PEcgi;

use strict;
use Carp qw(carp croak confess);
use CGI;
use LWP::UserAgent;
use XML::LibXML;

use Exporter;
our (@ISA, @EXPORT_OK);
@ISA =qw(Exporter);
@EXPORT_OK = qw(display_file 
                get_web_page
                decode_web_page
                get_problem_as_string
                print_language_number
                $extensions
                $prefix);

our $extensions = {
  asm           => 's',
  c             => 'c',
  'c++'         => 'cpp',
  forth         => 'fs',
  haskell       => 'hs',
  java          => 'java',
  perl          => 'pl',
  python        => 'py',
};

our $prefix = {
  java => 'pe',
};

sub display_file {
  my $query = shift;
  my $dir = shift;
  my $file = shift;

  print '<pre class="example">' . "\n";
  print "<p><b>$file</b></p>\n";
  chomp($file = join('/', $dir, $file));
  open(my $fh, "<", $file) or print "Cannot open ",$file,": $!";
  while (<$fh>) {
    s/\&/&amp;/g;
    s/</&lt;/g;
    s/>/&gt;/g;
    print;
    if ($dir =~ m|/forth$|) {
      if (/^\s*include\s+(.+\.fs)\s*$/) {
        display_file($query, $dir, $1);
      }
    }
  }
  close $fh;
  print $query->end_pre;
}

sub get_web_page {
  my $url = shift;

  my $ua = LWP::UserAgent->new;
  $ua->agent('bob@fourtheye.org::problem_text_grabber');

  my $req = HTTP::Request->new('GET', $url);
  my $res = $ua->request($req);

  if ($res->is_error()) {
    carp "Error getting $url: ", $res->status_line, "\n";
    return undef;
  } else {
    $res->content;
  }
}

sub decode_web_page {
  my $html = shift;

  my $xp = XML::LibXML->load_html(string => $html);
  return ($xp->findnodes('//*[@role="problem"]'))[0];
}

sub get_problem_as_string {
  my $number = shift;

  print '<a href="http://projecteuler.net/problem=', $number, '">Description of problem</a>',"\n";

  my $wanted = decode_web_page(get_web_page("http://projecteuler.net/problem=$number"));
  my $string = $wanted->toString;
  $string =~ s/\&#13;//g;
  $string =~ s|href="|href="http://projecteuler.net/|g;
  return $string;
}

sub print_language_number {
  my $query = shift;
  my $dir = shift;
  my $subdir = shift;
  my $number = shift;

  my $subdirh = DirHandle->new($dir . $subdir);
  if (defined $subdirh) {
    while (defined (my $file = $subdirh->read)) {
      if ($file eq join('', $prefix->{$subdir}, join(".", $number, $extensions->{$subdir}))) {
        print $query->h3($subdir);
        display_file($query, join('/', $dir, $subdir), $file);
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

1;
