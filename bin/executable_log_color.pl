#!/bin/env perl

use 5.030;
use Term::ANSIColor;

$Term::ANSIColor::EACHLINE = "\n";

while(my $line = <STDIN>) {
	print colored("$line", 'black on_r100g181b055') and next if $line =~ /\bINFO\b/;
	print colored("$line", 'black on_r233g222b099') and next if $line =~ /\bWARNING\b/;
	print colored("$line", 'black on_r233g051b035') and next if $line =~ /\bERROR\b/;
	print colored("$line", 'black on_r218g132b059') and next if $line =~ /\bCRITICAL\b/;
	
	print $line;

}
