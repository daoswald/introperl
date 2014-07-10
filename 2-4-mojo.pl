#!/usr/bin/env perl

use strict;
use warnings;

use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render( greeting => 'Hello world!' );
} => 'index';

app->start;

__DATA__
@@index.html.ep
<h4>The Great and Powerful Oz says...</h4>
<h3><%= $greeting %></h3>
