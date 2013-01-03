#!/usr/bin/perl -w
use strict;
use DataHash qw(dump_column_to_files);

my $output_dir = "./output";
dump_column_to_files($output_dir, "output", "result");
