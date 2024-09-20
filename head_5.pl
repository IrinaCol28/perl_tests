#!/usr/bin/perl
use strict;
use warnings;
use Math::Trig ':pi';


open(FILE, "<", "fred.txt") or die "Не удалось открыть файл: $!";

# Читаем все строки в массив
my @lines = <FILE>;

# Переворачиваем массив строк
@lines = reverse @lines;

# Выводим строки в обратном порядке
foreach my $line (@lines) {
    print $line;
}

close(FILE);


