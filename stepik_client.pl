#!/usr/bin/perl
use strict;
use warnings;
use IO::Socket;

# my $socket = IO::Socket::INET->new(

#                 PeerAddr => 'search.cpan.org',

#                 PeerPort => 80,

#                 Proto => "tcp",

#                 Type => SOCK_STREAM)

#             or die "Can`t connect to search.cpan.org $/";

# print $socket "GET / HTTP/1.0\r\nHost: search.cpan.org\r\n";

# my @answer = <$socket>;

# print(join($/, @answer));



my $server = IO::Socket::INET->new(

                LocalPort => 8081,

                Type => SOCK_STREAM,

                ReuseAddr => 1,

                Listen => 10)

            or die "Can't create server on port 8081 : $@ $/";

while(my $client = $server->accept()){

    $client->autoflush(1);

    my $message = <$client>;

    chomp( $message );

    print $client "Lox Echo: ".$message;

    close( $client );

    last if $message eq 'END';

}

close( $server )