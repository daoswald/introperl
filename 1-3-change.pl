#!/usr/bin/env perl

use strict;
use warnings;

my $money = 597;
my $start_money = $money;
my $bill_count = 0;
foreach my $denomination ( 100, 50, 20, 10, 5, 1 ) {
  if( my $quantity = int( $money / $denomination ) ) {
    print "$quantity ${denomination}s\n";
    $bill_count += $quantity;
    $money %= $denomination;
  }
}

print "You used $bill_count bills to produce \$$start_money in change.\n";
