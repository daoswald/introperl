#!/usr/bin/env perl

use FindBin;
use lib "$FindBin::Bin/../lib";
warn "$FindBin::Bin/../lib";

use strict;
use warnings;

use Test::More;

use_ok( 'MyModule' );
can_ok( 'MyModule', 'add' );
can_ok( 'main', 'add' );

done_testing;
