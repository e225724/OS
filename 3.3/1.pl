#!/usr/bin/perl
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
        my @command = split;
        # exec @command;
        exec "/bin/ls";
        print "Child end\n";
}
if (fork) {
        # parent
        print "Parent $$\n";
        # 子供が終わるのを待つ
        wait;
        print "Child end\n";
} else {
        # child
        print "Child $$\n";
        my @command = split;
        # exec @command;
        exec "/bin/ls ..";
        print "Child end 1234\n";
}