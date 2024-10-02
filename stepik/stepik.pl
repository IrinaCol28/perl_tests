#!/usr/bin/perl
use strict;
use warnings;
use JSON::XS;

# print JSON::XS::encode_json({var1 => 1, var2 => 2});

# my $var = "one";
# print 'без интерполяции: $var',    "\n";     # без интерполяции: $var
# print "с интерполяцией: $var",     "\n";     # с интерполяцией: one

# my @array = (3, "four", 5);
# print 'без интерполяции @array',   "\n";     # без интерполяции @array
# print "с интерполяцией @array",    "\n";     # с интерполяцией 3 four 5
# print "с интерполяцией $array[1]", "\n";     # с интерполяцией four
# print "срез массива @array[1,2]",  "\n";     # срез массива four 5

# my %hash = (k => "v", x => "y", z => "a");
# print 'без интерполяции %hash',    "\n";     # без интерполяции %hash
# print "с интерполяцией %hash",     "\n";     # с интерполяцией %hash
# print "с интерполяцией $hash{k}",  "\n";     # с интерполяцией v


# # Определяем функцию min_and_max
# sub min_and_max {
#     my ($x, $y, $z) = @_;

#     # Находим минимальное и максимальное значения
#     my $min = ($x < $y) ? (($x < $z) ? $x : $z) : (($y < $z) ? $y : $z);
#     my $max = ($x > $y) ? (($x > $z) ? $x : $z) : (($y > $z) ? $y : $z);

#     # Выводим результат
#     print "$min, $max\n";
# }

# # Чтение входных данных (ожидаем одну строку ввода)
# my $input = <STDIN>;

# # Проверка, что данные были введены
# if (defined $input) {
#     chomp($input);  # Убираем лишние символы новой строки

#     # Разбиваем строку на числа
#     my @numbers = split ' ', $input;

#     # Проверяем, что введено ровно три числа
#     if (@numbers == 3) {
#         my ($x, $y, $z) = @numbers;
#         min_and_max($x, $y, $z);
#     } else {
#         print "Введите ровно три числа, разделенные пробелами.\n";
#     }
# } 


# sub solve_equation {
#     my ($a_value, $b_value, $c_value) = @_;

#     # Если a == 0, уравнение не является квадратным
#     if ($a_value == 0) {
#         print "No solution!\n";
#         return;
#     }

#     # Вычисляем дискриминант
#     my $discriminant = $b_value**2 - 4 * $a_value * $c_value;

#     # Если дискриминант отрицательный, то нет действительных решений
#     if ($discriminant < 0) {
#         print "No solution!\n";
#     }
#     # Если дискриминант равен нулю, то одно решение
#     elsif ($discriminant == 0) {
#         my $x = -$b_value / (2 * $a_value);
#         print "$x\n";
#     }
#     # Если дискриминант положительный, то два решения
#     else {
#         my $x1 = (-$b_value - sqrt($discriminant)) / (2 * $a_value);
#         my $x2 = (-$b_value + sqrt($discriminant)) / (2 * $a_value);
#         # Печатаем решения в порядке возрастания
#         if ($x1 < $x2) {
#             print "$x1, $x2\n";
#         } else {
#             print "$x2, $x1\n";
#         }
#     }
# }
# solve_equation(0, 1, 2);  # No solution!
# solve_equation(-2, 0, 128);  # -8, 8
# solve_equation(1, 0, 0);  # 0

# sub fac {
#     my ($n) = @_;
#       # Начальное значение факториала
#     my $factorial = 1;

#     # Вычисляем факториал через цикл
#     for (my $i = 1; $i <= $n; $i++) {
#         $factorial *= $i;
#     }

#     # Выводим результат
#     print "$factorial\n";
# }


# # Функция для нахождения и печати простых чисел в диапазоне [$x, $y]
# sub primes_from_interval {
#     my ($x, $y) = @_;

#     # Убедиться, что x <= y
#     ($x, $y) = ($y, $x) if $x > $y;

#     for (my $n = $x; $n <= $y; $n++) {
#         # Пропустить числа меньше или равные 1
#         next if $n <= 1;

#         # Проверка, является ли число простым
#         my $is_prime = 1;
#         for (my $i = 2; $i * $i <= $n; $i++) {
#             if ($n % $i == 0) {
#                 $is_prime = 0;
#                 last;
#             }
#         }

#         # Печать числа, если оно простое
#         print "$n\n" if $is_prime;
#     }
# }


# # Вызов функции для нахождения простых чисел
# primes_from_interval(-1, 1);
# primes_from_interval(1, 4);

# sub intersection {
#     my ($set1, $set2) = @_;

#     # Создаем новый хэш для хранения результата
#     my %result;

#     # Перебираем ключи первого множества
#     foreach my $key (keys %$set1) {
#         # Проверяем, присутствует ли ключ во втором множестве
#         if (exists $set2->{$key}) {
#             # Если да, добавляем его в результат
#             $result{$key} = 1;
#         }
#     }

#     # Возвращаем ссылку на результирующий хэш
#     return \%result;
# }

