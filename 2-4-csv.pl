#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use Text::CSV;


my $csv = Text::CSV->new( { binary => 1, eol => $/ } )
  or die "Cannot use CSV: " . Text::CSV->error_diag;

while( my $row = $csv->getline(\*DATA) ) {
  say "Fields: ", map { "($_)" } @$row;
}
$csv->eof or die $csv->error_diag;


__DATA__
now is,"the",time ,"for
all","good, men",to come.
