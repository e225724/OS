use strict;
use warnings;
use Socket6; # This module provides the getaddrinfo function

my $host = `tokuyamamorimasa.local`; # Get the hostname of the machine

my $hints = {
    socktype => SOCK_STREAM,
    family   => AF_UNSPEC,
};

my @addrinfo = getaddrinfo($host, undef, $hints);

foreach my $info (@addrinfo) {
    my ($family, $addr) = ($info->{family}, $info->{addr});

    if ($family == AF_INET || $family == AF_INET6) {
        my $ip = inet_ntop($family, $addr);
        print "$ip\n";
    }
}
