package MyModule;

use Exporter;
our @ISA = qw( Exporter );
our @EXPORT = qw( add );
use strict;
use warnings;

sub add { return shift() + shift() }

1;
