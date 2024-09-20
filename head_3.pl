#!/usr/bin/perl
use strict;
use warnings;

print "Введите список:\n";
my @array=<STDIN>;
print reverse @array;

my @names=qw(fred betty barney dino wilma pebbles bamm-bamm);
print "Введите числа:\n";
my @counts=<STDIN>;
foreach my $id (@counts) {
  if($id==1){
    print $names[0]."\n";
  } 
  if($id==2){
    print $names[1]."\n";
  } 
  if($id==3){
    print $names[2]."\n";
  } 
  if($id==4){
    print $names[3]."\n";
  }
  if($id==5){
    print $names[4]."\n";
  } 
  if($id==6){
    print $names[5]."\n";
  } 
  if($id==7){
    print $names[6]."\n";
  } 
}

@names = qw(fred betty barney dino wilma pebbles bamm-bamm);

print "Введите числа:\n";
@counts = <STDIN>;

foreach my $id (@counts) {
    chomp($id);  # Убираем символ новой строки
    if ($id >= 1 && $id <= @names) {  # Проверяем, что число находится в допустимом диапазоне
        print $names[$id - 1] . "\n";  # Используем число как индекс для массива
    } else {
        print "Некорректный ввод: $id\n";  # Обработка некорректного ввода
    }
}

print "Введите строки:\n";
my @str = <STDIN>;
print sort @str;