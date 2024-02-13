#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>

int main() {
    struct addrinfo hints, *result, *rp;
    int status;

    // ヒントの初期化
    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_family = AF_UNSPEC;    // IPv4またはIPv6
    hints.ai_socktype = SOCK_STREAM; // ソケットのタイプ (ここではストリームソケット)
    hints.ai_flags = AI_PASSIVE;    // ワイルドカードアドレスを取得

    // ホスト名とサービス名からアドレスを解決
    if ((status = getaddrinfo(NULL, NULL, &hints, &result)) != 0) {
        fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(status));
        exit(EXIT_FAILURE);
    }

    // 解決されたアドレスを表示
    for (rp = result; rp != NULL; rp = rp->ai_next) {
        char addr_str[INET6_ADDRSTRLEN];
        void *addr;

        if (rp->ai_family == AF_INET) { // IPv4アドレス
            struct sockaddr_in *ipv4 = (struct sockaddr_in *)rp->ai_addr;
            addr = &(ipv4->sin_addr);
        } else { // IPv6アドレス
            struct sockaddr_in6 *ipv6 = (struct sockaddr_in6 *)rp->ai_addr;
            addr = &(ipv6->sin6_addr);
        }

        inet_ntop(rp->ai_family, addr, addr_str, sizeof(addr_str));
        printf("Address: %s\n", addr_str);
    }

    // メモリの解放
    freeaddrinfo(result);

    return 0;
}
