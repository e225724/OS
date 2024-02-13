#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <ifaddrs.h>

int main() {
    struct ifaddrs *ifaddr, *ifa;
    int family, s;
    char host[NI_MAXHOST];

    // ネットワークインターフェイスの情報を取得
    if (getifaddrs(&ifaddr) == -1) {
        perror("getifaddrs");
        exit(EXIT_FAILURE);
    }

    // ネットワークインターフェイスのループ
    for (ifa = ifaddr; ifa != NULL; ifa = ifa->ifa_next) {
        // ネットワークアドレスがない場合はスキップ
        if (ifa->ifa_addr == NULL) {
            continue;
        }

        // アドレスファミリーの取得
        family = ifa->ifa_addr->sa_family;

        // IPv4またはIPv6の場合の処理
        if (family == AF_INET || family == AF_INET6) {
            // ホスト名取得
            s = getnameinfo(ifa->ifa_addr,
                            (family == AF_INET) ? sizeof(struct sockaddr_in) :
                                                  sizeof(struct sockaddr_in6),
                            host, NI_MAXHOST,
                            NULL, 0, NI_NUMERICHOST);
            if (s != 0) {
                fprintf(stderr, "getnameinfo: %s\n", gai_strerror(s));
                exit(EXIT_FAILURE);
            }

            printf("%s: %s\n", ifa->ifa_name, host);
        }
    }

    // メモリの解放
    freeifaddrs(ifaddr);
    return 0;
}
