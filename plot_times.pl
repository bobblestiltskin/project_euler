#!/usr/bin/perl -w
use strict;
use Chart::Gnuplot;

# Data
my @x = (1 .. 25);

# Create chart object and specify the properties of the chart
my $chart = Chart::Gnuplot->new(
  output => "project_euler.png",
  title  => "Project Euler timings",
  xlabel => "Problem Number",
  ylabel => "Time in seconds",
  bg     => "white",
);

# Create dataset object and specify the properties of the dataset
my $dataSet_c = Chart::Gnuplot::DataSet->new(
  xdata => \@x,
  datafile => "output/c.times",
  title => "C times ",
  style => "linespoints",
);

my $dataSet_cpp = Chart::Gnuplot::DataSet->new(
  xdata => \@x,
  datafile => "output/c++.times",
  title => "C times ",
  style => "linespoints",
);

my $dataSet_perl = Chart::Gnuplot::DataSet->new(
  xdata => \@x,
  datafile => "output/perl.times",
  title => "Perl times ",
  style => "linespoints",
);

my $dataSet_python = Chart::Gnuplot::DataSet->new(
  xdata => \@x,
  datafile => "output/python.times",
  title => "Python times ",
  style => "linespoints",
);

my $dataSet_java = Chart::Gnuplot::DataSet->new(
  xdata => \@x,
  datafile => "output/java.times",
  title => "Java times ",
  style => "linespoints",
);

# Plot many data sets on a single chart
$chart->plot2d($dataSet_c, $dataSet_cpp, $dataSet_perl, $dataSet_python, $dataSet_java);
