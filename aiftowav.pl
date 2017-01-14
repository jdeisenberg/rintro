#!/usr/bin/perl

opendir DIRFILE, ".";
@filelist = readdir DIRFILE;
closedir DIRFILE;

foreach $file (@filelist)
{
	if ($file =~ /\.htm$/)
	{
		print "Converting $file\n";
		open INFILE, $file;
		open OUTFILE, ">tempfile";
		while (<INFILE>)
		{
			s/\x0d/\n/g;
			s/\.aif/\.wav/g;
			print OUTFILE $_;
		}
		close INFILE;
		close OUTFILE;
		unlink $file;
		rename "tempfile", $file;
	}
}
