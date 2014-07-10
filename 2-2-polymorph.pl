#!/usr/bin/env perl

package Animal;

use Moose::Role;

requires 'diet';
requires 'blood';
requires 'vocalization';

has date_of_birth => ( is => 'ro', isa => 'Str' );
has name          => ( is => 'ro', isa => 'Str' );

sub speak {
  my $self = shift;
  print $self->vocalization, "\n";
}


package Dog;

use Moose;

has 'blood' => ( is => 'ro', isa => 'Str', default => 'warm' );
has 'diet'  => ( is => 'ro', isa => 'Str', default => 'omnivorous' );
has 'vocalization' => ( is => 'ro', isa => 'Str', default => "Woof Woof!" );

sub wag_tail {
  my $self = shift;
  print "Wag Wag!\n";
}

sub bark {
  my $self = shift;
  $self->speak;
}

with 'Animal';

package Cat;
use Moose;
has blood => ( is => 'ro', isa => 'Str', default => 'warm' );
has diet => ( is => 'ro', isa => 'Str', default => 'carnivorous' );
has vocalization => ( is => 'ro', isa => 'Str', default => 'Meow Meow!' );

sub purr {
  my $self = shift;
  print "Purrrrrrrrrrrr....\n";
}

with 'Animal';

package main;

use strict;
use warnings;

my $dog = Dog->new( name => 'Sandy', date_of_birth => '02/2003' );
my $neighbor_cat = Cat->new( name => 'Mojo', date_of_birth => 'unknown' );

my @neighborhood_pets = ( $dog, $neighbor_cat );

foreach my $pet ( @neighborhood_pets ) {
  print $pet->name, " is a ", ref $pet, ".\n";
  $pet->speak;
}
