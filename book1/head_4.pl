#!/usr/bin/perl
use strict;
use warnings;
use 5.010;

sub total{
   my $sum;
  foreach(@_){
    $sum+=$_;
  }
  return $sum;
}


sub above_average{
   my $average=&total(@_)/@_;
   my @array;
  foreach my $count (@_){
    if($count>$average){
      push @array, $count;
    }
  }
  @array;
}

print &above_average(1..10);;


print "Введите числа:\n";
chomp(my @counts=<STDIN>);
print &total(@counts);

print &total(1..1000);

&greet('Fred');
&greet('Bar');

sub greet{
  state $last;
  my $name=shift;
  print "Hello, $name.";
  if(defined $last){
    print "$last is here\n";
  } else {
    print "You first.";
  }
  $last=$name;
}


sub greet_all{
  state @lasts;
  my $name=shift;
  print "Hello, $name.";
  if(@lasts){
    print "He lasts\n";
  } else {
    print "You first.";
  }
  push @lasts, $name;
}

&greet_all('Fred');
&greet_all('Bar');
&greet_all('Wil');
&greet_all('Betty');
