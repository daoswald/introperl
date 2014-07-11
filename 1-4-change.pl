#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

sub make_change {
  my ( $money, $denom_ref ) = @_;
  my $orig_money = $money;
  my %bills_used;
  foreach my $denomination ( @$denom_ref ) {
    if( my $quantity = int( $money / $denomination ) ) {
      $bills_used{$denomination} = $quantity;
      $money = $money % $denomination;
    }
  }
  return( $orig_money, \%bills_used );
}

foreach my $amount ( 597, 250, 1_532_123, 42, 3 ) {
  my( $orig, $used_href ) = make_change( $amount, [ 100, 50, 20, 10, 5, 1] );
  print "Original: $orig\n";
  print Dumper $used_href;
}
