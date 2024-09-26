#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use HTML::Entities;

my $q = CGI->new;
print $q->header(-type => 'text/xml');
my $db = "./database.txt";
open(my $fh,'<', $db) or die $!;

print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";
print "<?xml-stylesheet type=\"text/xsl\" href=\"/tool-box.xsl\"?>\n";
print "<box xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"https://www.w3schools.com/xml tool-box.xsd\">\n";

while( my $line = <$fh>)  {   
	my ($title, $date, $desc, $uri, $cat) = split /\|/, $line;
	print <<END;
	<tool>
		<title>$title</title>
		<date>$date</date>
		<uri>$uri</uri>
		<description>$desc</description>
		<category>$cat</category>
	</tool>
END
}
print '</box>';

close($fh);

1;

