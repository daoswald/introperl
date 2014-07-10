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


package main;

use strict;
use warnings;

my $pet = Dog->new( name => 'Sandy', date_of_birth => '02/2003' );

print $pet->name, ", wag your tail:\n\t";
$pet->wag_tail;

print $pet->name, ", speak:\n\t";
$pet->speak;

print $pet->name, ", please quiet down.\n\t"; 
$pet->bark;       # Same as speak.

print $pet->name, " was born ", $pet->date_of_birth, "\n";
print $pet->name, " is ", $pet->diet, "\n";
print $pet->name, " likes to say ", $pet->vocalization, "\n";
print $pet->name, " is a ", ref $pet, "\n";
print "A ", ref $pet, " is a type of ", $pet->meta->superclasses, "\n";
