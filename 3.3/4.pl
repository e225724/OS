#!/usr/bin/perl
use strict;
use warnings;
$|=0;
if (fork) {
    # parent
    print "Parent $$\n";
    # 子供が終わるのを待つ
    wait;
    print "Child end\n";
} else {
    # child
    print "Child $$\n";
    #my @command = split;
    #exec @command;      
    exec("/bin/ls");
    #print "Child end\n";
}

if (my $pid = fork) {    # $pid の宣言を if 文に追加しました
    # parent
    print "Parent $$\n";
    # 子供が終わるのを待つ
    wait;
    print "Child end\n";
} else {
    # child
    print "Child $$\n";
    # lsを実行し結果を取得
    open(my $ls_pipe, "-|", "ls") or die "パイプを開けません: $!";
    # 標準出力にリダイレクト
    open(STDIN, "<&", $ls_pipe) or die "標準入力をリダイレクトできません: $!";
    # exec @command
    exec("/usr/bin/wc") or die "wcの実行に失敗しました: $!";
    print("Child end 123\n");
}
