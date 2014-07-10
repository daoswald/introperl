#!/usr/bin/env perl

package Integer;
use Moose;

use strict;
use warnings;

has value => ( is => 'ro' );

no Moose;


package main;

my $i = Integer->new(value=>128);
print $i->value, "\n";
$i->value(54);
