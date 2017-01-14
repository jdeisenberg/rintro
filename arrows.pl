#!/bin/perl
use strict;
use utf8;
use open qw/:std :utf8/;

my $buffer;

{
  local $/ = undef;
  open INFILE, $ARGV[0] or die("Cannot open $ARGV[0]");
  $buffer = <INFILE>;
  close INFILE;
}

$buffer =~ s!<img src="r_arrow.png"[^>]+>! \&rarr;!;
$buffer =~ s!<img src="up_arrow.png"[^>]+>!\&uarr; !;

print $buffer;

  
