#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket::INET;

# Автофлеш данных в STDOUT (чтобы сразу видеть вывод)
$| = 1;

# Создаём сокет сервера
my $server = IO::Socket::INET->new(
    LocalPort => 8080,        # Порт 8080
    Proto     => 'tcp',       # Протокол TCP
    Listen    => 5,           # Количество ожидающих клиентов
    Reuse     => 1            # Разрешаем повторное использование адреса
) or die "Server not create in port 8080: $!\n";

print "Server start in port 8080...\n";

while (1) {
    # Ожидаем клиента
    my $client_socket = $server->accept();

    # Читаем данные от клиента
    while (<$client_socket>) {
        chomp;  # Убираем символ новой строки
        print "Message: $_\n";  # Выводим сообщение на STDOUT

        # Проверяем, является ли сообщение "exit"
        if ($_ eq "exit") {
            print "Message 'exit'. Stop server.\n";
            close $client_socket;
            close $server;
            exit 0;
        }
    }

    # Закрываем клиентское соединение
    close $client_socket;
}