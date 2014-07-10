#!/usr/bin/env perl

use strict;
use warnings;

use Mojolicious::Lite;
use Data::Dumper;
use Text::CSV;

# We'll open this as an in-memory file for Text::CSV to use.
my $csv_data = <<'HERE';
name,age,sex
Dave Oswald,46,male
Aileen Oswald,42,female
Nathaniel Oswald,5,male
Noelle Oswald,3,female
HERE

# Mojolicious GET request handler at /data.
# /data.json returns json.
# /data.txt returns text dump.
get '/data' => [format => [ qw( json txt ) ]] => sub {
  my $c = shift;

  my $data = fetch_structure($csv_data);

  if( $c->stash('format') eq 'json' ) {
    return $c->render( json => $data );
  }
  else {
    return $c->render( text => $c->dumper($data) );
  }

};

sub fetch_structure {
  my $data = shift;

  open my $infh, '<', \$data or die $!;

  my $csv = Text::CSV->new( { binary => 1, eol => $/, auto_diag => 2 } );

  my @structure;

  my $fields = $csv->getline($infh);

  while( my $row = $csv->getline($infh) ) {
    my %entry;
    @entry{@$fields} = @$row;
    push @structure, \%entry;
  }

  return { people => \@structure };
}

app->start;
