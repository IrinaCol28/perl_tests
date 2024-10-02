#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;

use Data::Dumper;
use File::Spec;
use Business::ISBN;

# Прочитайте список файлов в текущем каталоге и преобразуйте полученные имена 
# в их спецификации, содержащие полные пути к файлам. 
# При этом нельзя обращаться к возможностям командной оболочки или каких-либо внешних программ. 
# Допускается использовать модули File::Spec и Cwd, входящие в состав Perl.
# При выводе списка спецификаций перед каждой из них должны выводиться четыре пробела,
# а после каждой из них – символ перевода строки 

my $dir = 'C:\perl_tests\book1';
my @files;

opendir(DIR, $dir) or die "can't opendir $dir: $!";

while (defined(my $file = readdir(DIR))) {
	next if $file =~ /^\.\.?$/;
  # для конкатенации одного или нескольких имён каталогов и имени файла 
  # для формирования полного пути, заканчивающегося именем файла, можно использовать функцию catfile
  my $cpath = File::Spec->catfile( $dir, $file );
	push @files, $cpath;
}
print Dumper(\@files);

closedir(DIR);

# Попробуйте выполнить интерпретацию ISBN этой книги,
# который вы найдете на последней странице обложки (0596102062). 978-0-59-610206-7
# Установите модуль Business::ISBN из CPAN и воспользуйтесь 
# им для извлечения кода страны и кода издателя из указанного числа.

my $isbn = Business::ISBN->new('978-0-59-610206-7');

print Dumper($isbn);

#код издателя
print Dumper($isbn->publisher_code);

#код страны
print Dumper($isbn->group_code);
