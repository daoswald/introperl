#!/usr/bin/env perl

use strict;
use warnings;

use JSON;
use File::Slurp;
use Data::Dumper;

my $json = read_file \*DATA;
print "Retrieved string:\n", map { "\t$_\n" } split /\n/, $json;

my $data = decode_json $json;
print "\nDecoded as: ", Dumper $data;

my $json_encoded = encode_json($data);
print "Encoded back to JSON string:\n$json_encoded\n";

__DATA__
{"employees":[
    {"firstName":"John", "lastName":"Doe"}, 
    {"firstName":"Anna", "lastName":"Smith"},
    {"firstName":"Peter", "lastName":"Jones"}
]}
