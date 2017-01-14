while (<>)
{
	s/([\w]+).aif/sox $1.aif $1.wav/;
	print;
}

