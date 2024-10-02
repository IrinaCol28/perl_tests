#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig ':pi';

my %hash=(
  "fred"=>"flin",
  "bred"=>"blin",
  "dred"=>"dlin",
);

print "Введите имя:";
chomp(my $name=<STDIN>);
if(exists $hash{$name}){
  print $hash{$name};
}

open(FILE, "<", "fred.txt") or die "Не удалось открыть файл: $!";

chomp (my @lines = <FILE>);
my %name_counts;

foreach my $line (@lines) {
    $name_counts{$line}++;
}
foreach my $key(sort keys %name_counts){
print "$key=>$name_counts{$key}\n";
}

close(FILE);
