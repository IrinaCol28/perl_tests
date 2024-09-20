#!/usr/bin/perl
use strict;
use warnings;
use POSIX ":sys_wait_h";


# Во входной поток STDIN подаются строки символов; 
# некоторые из них повторяются более одного раза. 
# Необходимо написать программу для определения количества повторов для каждой уникальной строки, 
# длины этой строки и вывода этих данных в файл /tmp/uniq.txt 
# (в формате "<кол-во повторов><пробел><длина строки><пробел><строка>\n"). Файл удалять не надо.

# Пример:

# Входные данные:

# string1
# string22
# string333
# string1
# string1
# string333

# Содержимое файла:

# 3 7 string1
# 1 8 string22
# 2 9 string333

# open(FILE, "<", "stepik.txt") or die "Не удалось открыть файл: $!";


# chomp (my @lines = <FILE>);
# my %name_counts;
# my $length_line;

# for my $line (@lines) {
#     $name_counts{$line}++;
# }

# open(my $fh, '>', 'uniq.txt');
# for my $key(sort keys %name_counts){
#     $length_line=length($key);
#     print $fh "$name_counts{$key} $length_line $key\n";
# }

# close $fh;
# print "готово\n";
# close(FILE);

# chomp (my @lines = <STDIN>);
# my %name_counts;
# my $length_line;

# for my $line (@lines) {
#     $name_counts{$line}++;
# }

# open(my $fh, '>', '/tmp/uniq.txt') or die "Не удалось открыть файл: $!";
# for my $key(sort keys %name_counts){
#     $length_line=length($key);
#     print $fh "$name_counts{$key} $length_line $key\n";
# }
# close $fh;

# my ($x, $y) = (4, 5);
# if (my $pid = fork()) {
#     $x += 4;
#     waitpid($pid, 0);
#     $y++;
# }
# elsif (defined $pid) {
#     $x = -2;
#     $y = 1;
#     exit();
# }
# else {
#     die $!;
# }
# print "x = $x; y = $y";



# # Пример функции hard_work, которая преобразует числа по правилам задачи
# sub hard_work {
#     my ($value) = @_;
#     # Выполняем конкатенацию строк и цифр по правилам задачи (вместо квадратов)
#     return join("", reverse split //, $value);
# }

# sub worker_process {
#     my ($value, $write_pipe) = @_;
#     my $result = hard_work($value);  # Вызываем hard_work
#     print $write_pipe "$result\n";  # Пишем результат в pipe
#     close $write_pipe;  # Закрываем pipe после записи
#     exit(0);  # Завершаем процесс
# }

# # Основная программа
# sub main {
#     my @inputs = <STDIN>;  # Чтение всех входных данных


#     my @processes;
#     my @pipes;

#     foreach my $value (@inputs) {
#         my ($read_pipe, $write_pipe);
#         pipe($read_pipe, $write_pipe) or die "Не удалось создать pipe: $!";

#         my $pid = fork();  # Создаём новый процесс
#         if (!defined $pid) {
#             die "Не удалось выполнить fork: $!";
#         }

#         if ($pid == 0) {
#             # Это дочерний процесс
#             close $read_pipe;  # Закрываем конец для чтения
#             worker_process($value, $write_pipe);  # Выполняем работу и пишем результат
#         } else {
#             # Это родительский процесс
#             close $write_pipe;  # Закрываем конец для записи
#             push @processes, $pid;
#             push @pipes, $read_pipe;  # Сохраняем pipe для чтения результата
#         }
#     }

#     my @results;
#     foreach my $pipe (@pipes) {
#         my $result = <$pipe>;  # Читаем результат из pipe
#         chomp $result;  # Убираем символ новой строки
#         push @results, $result;
#         close $pipe;  # Закрываем pipe после чтения
#     }

#     # Ждём завершения всех дочерних процессов
#     foreach my $pid (@processes) {
#         waitpid($pid, 0);
#     }

#     @results = sort @results;  # Сортируем как строки (лексикографически)

#     # Выводим отсортированные результаты
#     foreach my $result (@results) {
#         print "$result\n";  # Печатаем каждый результат на новой строке
#     }
# }

# main();



# Заглушка функции is_number для проверки числовых значений.
# В реальной задаче она уже реализована.
sub is_number {
    my ($sv) = @_;
    return ($sv =~ /^-?\d+(\.\d+)?$/);  # Пример простой проверки чисел
}

# Функция для сериализации в JSON-формат
sub serialize {
    my ($ref) = @_;
    
    # Если это хеш (ассоциативный массив)
    if (ref($ref) eq 'HASH') {
        my @pairs;
        foreach my $key (sort keys %{$ref}) {  # Сортируем ключи для предсказуемого порядка
            my $serialized_key = serialize($key);  # Ключи всегда строки
            my $serialized_value = serialize($ref->{$key});
            push @pairs, "$serialized_key:$serialized_value";
        }
        return "{" . join(",", @pairs) . "}";
    }
    
    # Если это массив
    elsif (ref($ref) eq 'ARRAY') {
        my @elements = map { serialize($_) } @{$ref};  # Сериализуем каждый элемент массива
        return "[" . join(",", @elements) . "]";
    }
    
    # Если это скалярное значение
    else {
        if (is_number($ref)) {
            return $ref;  # Если это число, возвращаем его без кавычек
        } else {
            $ref =~ s/"/\\"/g;  # Экранируем двойные кавычки внутри строки
            return "\"$ref\"";  # Если это строка, оборачиваем в кавычки
        }
    }
}

# Пример использования
my $VAR1 = {
    'b' => [1, '2', 3],
    'a' => 1,
    'c' => {
        'b' => 2,
        'a' => 1
    }
};

# Сериализация данных
my $json_string = serialize($VAR1);
print "$json_string\n";

# Ожидаемый вывод:
# {"a":1,"b":[1,"2",3],"c":{"a":1,"b":2}}


