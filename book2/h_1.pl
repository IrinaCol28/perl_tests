#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

# print map { "$_\n" } grep { -s ($_) < 1000 } @ARGV;
# print map { "$_\n" } grep { -s ($_) > 1000 } @ARGV;
# print map { "$_\n" } grep { -s ($_) > 68608 } @ARGV;
# print map { "$_\n" } grep { -s ($_) < 68608 } @ARGV;


while(1){
  chomp(my $regex=<STDIN>);
  last unless ( defined $regex && length $regex );
  print map {"  $_\n" } grep { eval {/$regex/} } glob ( ".* *" );
}
  

