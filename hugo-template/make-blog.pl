#!/usr/bin/perl
#
# fix config.toml and .gitlab-yml

my $USER = $ENV{"USER"};

# print 'Enter blog url(such as ~e235715 or ~e235715/blog ):';
# my $blogurl = <>; chop $blogurl;
# print 'Enter blog title(such as Tnals blog):';
# my $blogtitle = <>; chop $blogtitle;
# print 'Enter user account(such as e185742):';
# my $author = <>; chop $author;
# print 'Enter twitter account or empty(such as @ieryukyu):';
# my $twitter = <>; chop $twitter;

my $blogurl = "~$USER/hugo";
my $blogtitle = "home";
my $author = "$USER";

if (! -f "config.toml") {
    open FD,"<config.toml.orig";
    open OUT,">config.toml";
    while(<FD>) {
    s!baseurl = "https://ie.u-ryukyu.ac.jp/hugo-template/"  # Include trailing slash!baseurl = "https://ie.u-ryukyu.ac.jp/${blogurl}/"  # Include trailing slash!;
    s!title = "Hugo-Template"!title = "${author}"!;
    s!author = "syskan"!author = "${author}"!;
    # s!twitter = "\@ieryukyu"!twitter = "${twitter}"!;
    print OUT;
    }
}

if ( ! -d "themes/ananke") {
   system("git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke");
}

print <<"EOFEOF";
write as content/2022/09/21/1.md
   then execute
perl publish.pl | sh -v

your url should be https://ie.u-ryukyu.ac.jp/$blogurl

modify config.toml as you like.
EOFEOF

if (0) {
open FD,"<.gitlab-ci.yml.orig";
open OUT,">.gitlab-ci.yml";
while(<FD>) {
s!hugo-template!${blogurl}!;
print OUT;
}
# if ( ! -d  "themes/hugo-clarity") { 
#  system("git submodule add https://github.com/chipzoller/hugo-clarity.git themes/hugo-clarity");
# }
# git remote remove origin
print "Please add gitlab repository ${blogurl}\n"; 
print "git add .\n";
print "git commit -m 'commit from script'\n";
print "git remote add origin YOUR_REPOSITORY_CLONE_URL\n";
print "git push -u origin master"
}
