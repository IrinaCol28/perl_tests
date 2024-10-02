#!/usr/bin/perl

# package MyFirstPackage;

# use strict;
# use warnings;


# sub new {
#    my($class, %args)=@_;

#    my $self= \%args;

#    bless $self, $class;
#    return $self;
# }


# package MyFirstPackage{ sub new{ return bless {@_[1..$#_]}, $_[0]; } } 1;


# package MyFirstPackage;

# sub new
# {
#     my $class = shift;
    
#     bless +{@_}, $class;
# }


# package MyFirstPackage;

# sub new {
#     my ($class_name, %hash) = @_;
#     return bless \%hash, $class_name;
# }

# package MyFirstPackage;

# sub new {
#         my @args = @_;
#         my $name = shift @args;
#         my %hash = @args;
#         my $obj = bless \%hash, "Class::$name";
#         return $obj;
# };

# package MyPackage;

# sub new {
#     my ($class, %p) = @_;
#     return bless \%p, $class;
# }

# sub print_first_arg {
#     print "$_[0] \n";
# }

# 1;



# MyPackage::print_first_arg(10);#10

# MyPackage->print_first_arg(10);#MyPackage

# my $obj = MyPackage->new(a => 10);
# $obj->print_first_arg; #MyPackage=HASH(0x1b323f1a370)

#!/usr/bin/perl

# package Local::Product;

# use strict;
# use warnings;

# # Курс доллара к рублю
# my $USD_TO_RUR = 70;

# # Конструктор new
# sub new {
#     my ($class, %args) = @_;

#     # Проверка наличия обязательного параметра name
#     return undef unless exists $args{name};

#     return undef if exists $args{price_rur} && exists $args{price_usd};

#     # Проверка, что передано хотя бы одно из свойств price_rur или price_usd
#     return undef unless exists $args{price_rur} || exists $args{price_usd};

#     # Если передана цена в долларах, но не в рублях, конвертируем в рубли
#     if (exists $args{price_usd}) {
#         $args{price_rur} = $args{price_usd} * $USD_TO_RUR;
#     }
#     # Если передана цена в рублях, но не в долларах, конвертируем в доллары
#     elsif (exists $args{price_rur}) {
#         $args{price_usd} = $args{price_rur} / $USD_TO_RUR;
#     }

#     # Значение count по умолчанию = 1, если не передано
#     $args{count} = 1 unless exists $args{count};

#     # Создаем объект как хеш и благословляем его в класс
#     my $self = bless {
#         name      => $args{name},
#         count     => $args{count},
#         price_rur => $args{price_rur},
#         price_usd => $args{price_usd},
#     }, $class;

#     return $self;
# }

# # Аксессоры для name
# sub name {
#     my ($self, $value) = @_;
#     $self->{name} = $value if defined $value;
#     return $self->{name};
# }

# # Аксессоры для count
# sub count {
#     my ($self, $value) = @_;
#     if (defined $value) {
#         $self->{count} = $value;
#     }
#     return $self->{count};
# }

# # Аксессоры для price_rur
# sub price_rur {
#     my ($self, $value) = @_;
#     if (defined $value) {
#         $self->{price_rur} = $value;
#         $self->{price_usd} = $value / $USD_TO_RUR;
#     }
#     return $self->{price_rur};
# }

# # Аксессоры для price_usd
# sub price_usd {
#     my ($self, $value) = @_;
#     if (defined $value) {
#         $self->{price_usd} = $value;
#         $self->{price_rur} = $value * $USD_TO_RUR;
#     }
#     return $self->{price_usd};
# }

# # Метод для получения суммы в рублях (sum_rur)
# sub sum_rur {
#     my $self = shift;
#     return $self->{price_rur} * $self->{count};
# }

# # Метод для получения суммы в долларах (sum_usd)
# sub sum_usd {
#     my $self = shift;
#     return $self->{price_usd} * $self->{count};
# }

# 1;


package Person;

use Moose; #does use strict; use warnings; for you

has firstname => ( is => 'rw', isa => 'Str', required => 1 );
has lastname  => ( is => 'rw', isa => 'Str', required => 1 );

sub name {
    my $self = shift;
    return $self->firstname . " " . $self->lastname;
}

#and here is some code that uses it
package main;

my $person = Person->new(firstname => "Chas.", lastname => "Owens");
print $person->name, "\n";