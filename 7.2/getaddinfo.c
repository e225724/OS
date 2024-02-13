#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <arpa/inet.h>


int main() {
    const char *hostname = "tokuyamanoMacBook-Air.local";
    struct addrinfo hints, *result, *p;
    int status;

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_INET6; // IPv6
    hints.ai_socktype = SOCK_STREAM; // TCP

    if ((status = getaddrinfo(hostname, NULL, &hints, &result)) != 0) {
        fprintf(stderr, "getaddrifo error: %s\n", gai_strerror(status));
        return 1;
    }

    printf("Addresses obtained using getaddrinfo:\n");

    for (p = result; p!= NULL; p = p->ai_next) {
        char addrstr[INET6_ADDRSTRLEN];
        void *addr;
        if (p->ai_family == AF_INET6) {
        struct sockaddr_in6 * ipv6 = (struct sockaddr_in6 *) p->ai_addr;
        addr = &(ipv6->sin6_addr);
        } else {
            continue;
        }

        inet_ntop(p->ai_family, addr, addrstr, sizeof addrstr);
        printf("%s\n", addrstr);
    }

    freeaddrinfo(result);

    return 0;
}