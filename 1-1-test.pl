#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::Output;

stdout_is {
  
  print "Hello world!"

} "Hello world!", "Hello world output.";

done_testing();
