#!/usr/bin/perl

$|=0;
while (<>) {
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
       exec @command;
       print "Child end 1234\n";
    }
    print "prompt> ";    
}
