open INFILE, "<playsnd.js";
open OUTFILE, ">xyz.txt";

while (<INFILE>)
{
	s/\x0d/\n/g;
 	print OUTFILE;
}
close INFILE;
close OUTFILE;

