#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use HTML::Entities;
use Time::Piece;

sub sanitize{
	my $str = $_[0];
	$str =~ s/^\s+//; # Strip white space 
	$str =~ s/\s+$//;
	$str =~ s/;//g;
	$str =~ s/\|//g;
	$str = encode_entities($str); # Encode HTML tags
	return $str;
}

my $q = CGI->new;
my $date = localtime->strftime('%Y-%m-%d');
my $date_time = localtime->strftime();
my $db = "/srv/www/apache/suggestions/$date_time-suggestions.txt";
print $q->header();

if($q->param()){
	my $title = sanitize($q->param('title'));
	my $desc = sanitize($q->param('description'));
	my $cat = sanitize($q->param('category'));
	my $uri = sanitize($q->param('uri'));

	open(my $fh,'>>', $db) or die $!;
	print $fh "$title|$date|$desc|$uri|$cat|\n";
	close($fh);

	print <<END;
	<!DOCTYPE HTML lang="en">
	<html>
		<head>
			<title>Thank you!</title>
			<link rel="stylesheet" type="text/css" href="/style.css">
		</head>
		<body>
			<h1>Thank you for your suggestion :)</h1>
			<a href="/">Go back home.</a>
			<h2>You sent:</h2>
			<p>
				<b>Title: </b>$title</br>
				<b>Description: </b>$desc</br>
				<b>URL: </b>$uri</br>
				<b>Category: </b>$cat</br>
			</p>
		</body>
	</html>
END
} else {
	print  $q->redirect("/");
}

1;
