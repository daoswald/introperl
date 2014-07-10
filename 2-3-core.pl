#!/usr/bin/env perl

use strict;
use warnings;
no warnings 'once';

use Getopt::Long;
use List::Util qw( shuffle sum reduce );

my ( $min, $max, $shuffle, $reverse ) = ( 0, 10, 0, 0 );

GetOptions(
  'min=i'   => \$min,
  'max=i'   => \$max,
  'shuffle' => \$shuffle,
  'reverse' => \$reverse
);

( $max, $min ) = ( $min, $max ) if ( $min > $max );

my @list = ( $min .. $max );
print "Original list: @list\n";

@list = reverse @list if $reverse;
@list = shuffle @list if $shuffle;

print "Modified list: @list\n";


print "The sum of elements in the range of [$min..$max] is: ",
      sum(@list), "\n";
      
print "The product of elements in the range of [$min..$max] is: ",
      product(@list), "\n";


sub product {
  my @list = @_;
  return reduce { $a * $b } 1, @list;
}
