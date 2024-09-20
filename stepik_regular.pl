#!/usr/bin/perl
use strict;
use warnings;
use JSON::XS;


# sub anagram {
#     my $arrayref = shift;
    
#     # Хэш для хранения групп анаграмм
#     my %anagrams;

#     # Хэш для отслеживания уже добавленных слов (избежать повторений)
#     my %seen;

#     # Пройти по каждому слову в массиве
#     foreach my $word (@$arrayref) {
#         # Привести слово к нижнему регистру и удалить пробелы
#         my $clean_word = lc($word);
        
#         # Создать ключ для анаграммы (упорядоченные буквы)
#         my $key = join '', sort split //, $clean_word;
        
#         # Добавить слово в хэш анаграмм, если оно еще не добавлено
#         if (not exists $seen{$clean_word}) {
#             push @{$anagrams{$key}}, $clean_word;
#             $seen{$clean_word} = 1;
#         }
#     }

#     # Создать результатирующий хэш для конечного вывода
#     my %result;

#     foreach my $key (keys %anagrams) {
#         # Игнорировать группы с одним элементом
#         next if @{$anagrams{$key}} < 2;
        
#         # Использовать первое слово в группе как ключ для результата
#         my $first_word = $anagrams{$key}[0];
#         $result{$first_word} = [@{$anagrams{$key}}];
#     }

#     return \%result;
# }

# my $result = anagram(\@list);
# say "$_: @{$result->{$_}}" for sort keys %$result;

# # Считываем строку из STDIN
# my $input = <STDIN>;
# chomp $input;  # Удаляем символ новой строки в конце строки

# # Регулярное выражение для проверки формата
# if ($input =~ /^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$/) {
#     print "OK\n";
# } else {
#     print "Not OK\n";
# }

# $_ = "foo bar baz";

# m/^(\w+)\s+(\w+)\s+(\w+)$/;
# print "$1\n";
# print "$2\n";
# print "$3\n";
# # $1 = 'foo';
# # $2 = 'bar';
# # $3 = 'baz';

# "abc" =~ /^(?<first>.)(?<second>.)/;
# print "first: $+{first}; second: $+{second}"; # first: a; second: b

# sub parse_url {
#     my ($url) = @_;

#     # Регулярное выражение для парсинга URL
#     my $regex = qr{
#         ^                              # Начало строки
#         (?<schema>https?|ftp):\/\/      # Схема (http, https, ftp)
#         (?<domain>[^\/:\?#]+)           # Домен 
#         (?::(?<port>\d+))?              # порт 
#         (\/(?<path>[^\?#]*))?           # путь 
#         (?:\?(?<query_string>[^#]+))?   # строка запроса
#         (?:\#(?<anchor>.*))?            # Опциональный фрагмент (#text)?
#         $                              # Конец строки
#     }x;

#     # Хеш для хранения элементов URL
#     my %url_parts;

#     # Если URL соответствует регулярному выражению, сохранить совпавшие части в хеш
#     if ($url =~ $regex) {
#         $url_parts{schema}       = $+{schema}       if defined $+{schema};
#         $url_parts{domain}       = $+{domain}       if defined $+{domain};
#         $url_parts{port}         = $+{port}         if defined $+{port};
#         $url_parts{path}         = '/' . $+{path}   if defined $+{path};  # Добавляем /, если путь присутствует
#         $url_parts{query_string} = $+{query_string} if defined $+{query_string};
#         $url_parts{anchor}       = $+{anchor}       if defined $+{anchor};
#     }

#     return %url_parts;
# }

# # Пример использования функции
# my %hash1 = parse_url("http://mail.ru:8080/r/p?s=10&z=11#text");
# my %hash2 = parse_url("http://mail.ru/r/p?s=10");

# # Вывод результатов
# use Data::Dumper;
# print Dumper(\%hash1);
# print Dumper(\%hash2);


# # %hash = (
# #     schema         => 'http',
# #     domain         => 'mail.ru',
# #     port           => '8080',
# #     path           => '/r/p',
# #     query_string   => 's=10&z=11',
# #     anchor         => 'text',
# # );


#Модификатор /g (global) в match в списковом контексте модификатор приводит к тому, что возвращается не первое попадание, а все.
 

# my $s = "aaaa";
# @a = $s =~ /(.)/;  # ('a')
# @a = $s =~ /(.)/g; # ('a','a','a','a')

# my $string = '~!@#$%^&*()';
# $string =~ s{(.)}{\\$1}g; # \~\!\@\#\$\%\^\&\*\(\)

# # Модификатор /m (multiline) меняет поведение крышечки и доллара.
# # Теперь:
# # ^ — начало каждой строки,
# # $ — конец каждой строки (до \n).

# my $s = "sample\nstring";

# $s =~ /^(.+)$/;   # no match
# $s =~ /^(.+)$/m;  # "sample"
# $s =~ /^(.+)$/ms; # "sample\nstring"
# $s =~ /^string/;  # no match
# $s =~ /^string/m; # matches "string"


# sub parse_query_string {
#     my ($query_string) = @_;
#     my %hash;
#     my @pairs=split(/&/,$query_string); #разделить на пары ключ=значение
#     for my $pair(@pairs){
#         my ($key,$value)=split(/=/, $pair, 2); #разделить ключ и значение
#         next unless defined $key and length $key; #пропустить пустые ключи
#         #декодирование символов
#         $key=~s/%([0-9-Fa-f]{2})/chr(hex($1))/eg;
#         $value=~s/%([0-9-Fa-f]{2})/chr(hex($1))/eg if defined $value;
#         $hash{$key}=$value;
#     }
#     return \%hash;
# }

# # Пример использования функции
# my $hash1 = parse_query_string("key1=value1&key2=value2");
# my $hash2 = parse_query_string("page?name=ferret&color=purple");

# # Вывод результатов
# use Data::Dumper;
# print Dumper($hash1);
# print Dumper($hash2);

# { } [ ] ( ) ^ $ . | * + ? \


# Sample Input:

# [log](cat)+*

# Sample Output:

# \[log\]\(cat\)\+\*



# my $string = "[log](cat)+*";
# my $str = quotemeta($string);

# $string=~s/([{}[\]()^\$.|*+?\\])/\\$1/g;
# print $string, "\n";
# print $str, "\n";

# # Напишите короткую программу: с 
# # c помощью require подключите модуль Magick.pm Затем вызовите функцию MagickNumber 
# # (без параметров) и выведите возвращенное ей значение.


package Local::Package;
use Exporter 'import';
our @EXPORT=qw(functionA);
our @EXPORT_OK=qw(functionB);
sub functionA {
    return $_[0] + $_[1];
}
sub functionB {
    return $_[0] * $_[1];
}

1;