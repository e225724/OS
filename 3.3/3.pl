#!/usr/bin/perl
$|=0;
if (fork) {
    # parent
    print "Parent $$ \n";
    # 子供が終わるのを待つ
    wait;
    print "Child end\n"
} else {
    # child
    print "Child $$\n";
    my @command = split;
    # exec @command;
    exec "/bin/ls";
    print "Child end\n";
}

if (fork) {
    # parent
    print "Parent $$\n";
} else {
    # child
    print "Child $$\n";
    # exec @command;
    exec "/bin/ls";
}

if (fork) {
    # parent
    print "Parent $$\n";
} else {
    # child
    print "Child $$\n";
    # exec @command
    exec "/bin/ls ../..";
}

# 両方の子供が終わるのを待つ
wait;
wait;

print "Both end\n";