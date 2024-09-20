#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig ':pi';

my $radius=12.5;
my $length=$radius*2*pi;
print $length, "\n";

chomp($radius=<STDIN>);
if ($radius>0){
  $length=$radius*2*pi;
} else {
  $length=0;  
}
print $length;

print "Введите первое число:";
chomp(my $count_one=<STDIN>);
print "Введите второе число:";
chomp(my $count_two=<STDIN>);
print $count_one*$count_two;

print "Введите строку:";
my $str=<STDIN>;
print "Введите число:";
chomp(my $count=<STDIN>);
print $str x $count;