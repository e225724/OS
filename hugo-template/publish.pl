#!/usr/bin/perl
#

# hugo or exec singularity hugo 
# rsync public to distinatiion

my $hugo =  "singularity exec /mnt/ie-virsh/singularity/hugo/hugo.sif hugo" ;
my $hugo_sing =  "/mnt/ie-virsh/singularity/hugo/hugo.sif" ;
my $HOME = $ENV{'HOME'};

if ( -f $hugo_sing ) {
} else {
    $hugo = "hugo";
}

my $dest = "$HOME/public_html";

if ( -d "$HOME/Sites" ) {
    $dest = "$HOME/Sites";
} elsif (! -d "$HOME/public_html" ) {
    die("can't found ~/public_html\n");
} 


# find base url
my $url = "blog";

open F,"<", "config.toml";
while(<F>) {
   if(m!baseurl = "https://ie.u-ryukyu.ac.jp/([^"]+)"  # Include trailing slash!) {
       $url = $1;
       $url =~ s!^\~[^/]+/!!;
   }
}

print "$hugo\n";
print "rsync -av public/* $dest/$url\n";


