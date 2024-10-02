#!/usr/bin/perl
use strict;
use warnings;

# open(FILE, "<", "fred.txt") or die "Не удалось открыть файл: $!";

# my @lines = <FILE>;

# foreach (@lines) {
#     if(/\b[Ff]red\b/){
#      print;
#     }
# }

# foreach (@lines) {
#     if(/\./){
#      print;
#     }
# }

# foreach (@lines) {
#     if(/[A-Z]/){
#      print;
#     }
# }

# foreach (@lines) {
#     if(/(.)\1/){
#      print;
#     }
# }

# foreach (@lines) {
#     if(/wilma/&&/fred/){
#         print;
#     }
# }
# close(FILE);

# "Hello World" =~ /World/;  # matches
# print "It matches\n" if "Hello World" =~ /World/;
# print "It doesn't match\n" if "Hello World" !~ /World/;
# my $greeting = "World";
# print "It matches\n" if "Hello World" =~ /$greeting/;

# "Hello World" =~ m!World!;   # matches, delimited by '!'
# "Hello World" =~ m{World};   # matches, note the matching '{}'
# "/usr/bin/perl" =~ m"/perl"; # matches after '/usr/bin',  '/' becomes an ordinary char

# while(<>){
#     chomp;
#     if(/match/){
#         print "Matched: |$`<$&>$`|\n"; #не тот апостроф
#         print "Matched: |$`<$&>$'|\n";
#     } else {
#         print "No match: |$_|\n";
#     }
# }

# open(FILE, "<", "fred.txt") or die "Не удалось открыть файл: $!";
# while (<FILE>) {
#     chomp;
#     if (/\b(?<word>\w*a)\b/) {  # Ищем слово, оканчивающееся на 'a'
#         # print "Matched: '$1' in |$_|\n";  
#         print "Matched: '$+{word}' in |$_|\n";  # $+{word} содержит слово, заканчивающееся на 'a'
#     } else {
#         print "No match: $_\n";
#     }
# }
# close(FILE);

