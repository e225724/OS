#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>
#include <time.h>
#include <pwd.h>

void listFile(const char *path) {
    DIR *dir;
    struct dirent *entry;
    struct stat fileStat;

    dir = opendir(path);
    if (dir == NULL) {
        perror("ディレクトリを開く際にエラーが発生");
        exit(EXIT_FAILURE);
    }

    // ディレクトリの情報を取得
    if (stat(path, &fileStat) < 0) {
        perror("ディレクトリの情報の取得中にエラーが発生しました");
        exit(EXIT_FAILURE);
    }

    // totalの表示
    printf("total %lld\n", (long long)fileStat.st_blocks);

    while ((entry = readdir(dir)) != NULL) {
        char entryPath[1024];
        snprintf(entryPath, sizeof(entryPath), "%s/%s", path, entry->d_name);

        if (stat(entryPath, &fileStat) < 0) {
            perror("ファイル情報の取得中にエラーが発生しました");
            exit(EXIT_FAILURE);
        }

        struct passwd *pw = getpwuid(fileStat.st_uid);
        if (pw == NULL) {
            perror("ユーザ情報の取得中にエラーが発生しました");
            exit(EXIT_FAILURE);
        }

        char timeStr[20];
        strftime(timeStr, sizeof(timeStr), "%Y-%m-%d %H:%M:%S", localtime(&(fileStat.st_mtime)));

        char perms[11];
        snprintf(perms, sizeof(perms), "%c%c%c%c%c%c%c%c%c%c",
                (S_ISDIR(fileStat.st_mode)) ? 'd' : '-',
                (fileStat.st_mode & S_IRUSR) ? 'r' : '-',
                (fileStat.st_mode & S_IWUSR) ? 'w' : '-',
                (fileStat.st_mode & S_IXUSR) ? 'x' : '-',
                (fileStat.st_mode & S_IRGRP) ? 'r' : '-',
                (fileStat.st_mode & S_IWGRP) ? 'w' : '-',
                (fileStat.st_mode & S_IXGRP) ? 'x' : '-',
                (fileStat.st_mode & S_IROTH) ? 'r' : '-',
                (fileStat.st_mode & S_IWOTH) ? 'w' : '-',
                (fileStat.st_mode & S_IXOTH) ? 'x' : '-');

        printf("%s %ld %s %s %s %s\n", perms, (long)fileStat.st_nlink, pw->pw_name, pw->pw_name, timeStr, entry->d_name);
    }

    closedir(dir);
}

int main() {
    listFile("..");
    printf("\n");
    return 0;
}
