#!/usr/bin/perl
use strict;
use warnings;

use 5.010;

print "hi NAME\n";
print "hi Ирина\n";
say "Кабум\n";

my @lines=`perldoc -u -f atan2`;
foreach(@lines) {
    s/\w<([^>]+)>/\U$1/g;
    print;
}