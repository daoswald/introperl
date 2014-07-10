#!/usr/bin/env perl

package Pandigital;
use Moose;

has base   => ( is => 'ro', isa => 'Int', default => 10 );
has number => ( is => 'ro', isa => 'Str' );

sub is_pandigital {
  my $self = shift;
  my $base_max = $self->base - 1;
  my $restr
    = '^[' . join('', 0 .. $base_max ) . ']{' . $self->base . ",}\$";
  return if ! ( $self->number =~ m/$restr/ );
  my $number = 0 + $self->number;
  my %seen;
  @seen{ split //, $number } = ();
  return if keys %seen != $self->base;
  return 1;
}
  
package main;

use IO::Prompt::Tiny 'prompt';
while( 1 ) {
  my $input = prompt "Enter a number to test (blank to exit)", '';
  last if ! length $input;
  my $base = prompt "Enter a base", '10';
  my $p = Pandigital->new( base => $base, number => $input );
  print $p->number, " is ", ( $p->is_pandigital ) ? '' : "not ", "pandigital ";
  print "in base ", $p->base, ".\n\n";
}
