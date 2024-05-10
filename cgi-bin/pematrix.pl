#!/usr/bin/perl

use strict;
use warnings;
use Carp;

use Template;
use CGI qw(:all);  

my $languages = [
  {
    language_name => 'ada',
    display => 'Ada',
    extension => 'adb'
  },
  {
    language_name => 'asm32',
    display => 'ARM 32-bit asm',
    extension => 's'
  },
  {
    language_name => 'c',
    display => 'C',
    extension => 'c'
  },
  {
    language_name => 'c%2b%2b',
    display => 'C++',
    extension => 'cpp'
  },
  {
    language_name => 'elixir',
    display => 'Elixir',
    extension => 'exs'
  },
  {
    language_name => 'erlang',
    display => 'Erlang',
    extension => 'erl'
  },
  {
    language_name => 'forth',
    display => 'Forth',
    extension => 'fs'
  },
  {
    language_name => 'go',
    display => 'Go',
    extension => 'go'
  },
  {
    language_name => 'haskell',
    display => 'Haskell',
    extension => 'hs'
  },
  {
    language_name => 'java',
    display => 'Java',
    extension => 'java'
  },
  {
    language_name => 'javascript',
    display => 'Javascript',
    extension => 'js'
  },
  {
    language_name => 'lua',
    display => 'Lua',
    extension => 'lua'
  },
  {
    language_name => 'ocaml',
    display => 'Ocaml',
    extension => 'ml'
  },
  {
    language_name => 'perl',
    display => 'Perl',
    extension => 'pl'
  },
  {
    language_name => 'perl6',
    display => 'Perl 6',
    extension => 'pl'
  },
  {
    language_name => 'python',
    display => 'Python',
    extension => 'py'
  },
  {
    language_name => 'racket',
    display => 'Racket',
    extension => 'rkt'
  },
  {
    language_name => 'ruby',
    display => 'Ruby',
    extension => 'rb'
  },
  {
    language_name => 'rust',
    display => 'Rust',
    extension => 'rs'
  },
  {
    language_name => 'tcl',
    display => 'TCL',
    extension => 'tcl'
  },
  {
    language_name => 'typescript',
    display => 'Typescript',
    extension => 'ts'
  },
];  

my $problems = [];
for (my $i=1; $i <= 25; $i++) {
	my $ns = sprintf("%03d", $i);
	push @$problems, {number => "$ns"};
}

my $data = {
  "problems" => $problems,
  "languages" => $languages,
};

print header;  

my $tt = Template->new;
$tt->process('templates/pematrix.tt', $data) or croak $tt->error;
