#!/usr/bin/perl
use strict;
use Cwd;
use POSIX qw(strftime);

my $cwd = getcwd();
my $projectpath = $cwd."/tips-tutorials";
my $input;

my $datestring = strftime "%Y-%m-%d %H:%M:%S", localtime;
my $date = strftime "%Y-%m-%d", localtime;
$datestring = $datestring."+0100";

print "Folder: $projectpath \n";
print "Do you want to change the current jekeyll project folder (Y/N):\n";
$input = <STDIN>; #read stdin
chomp ($input);
if ($input eq 'Y' or $input eq 'y')
    {
        $projectpath = <STDIN>;
        chomp ($projectpath);
    }

print "Please enter the title of the new post:\n";
my $title = <STDIN>; #read stdin
chomp ($title);
my $newtitle = $title;
# replace ' ' with '-'
$newtitle=~s/ /-/g;
print "The title was pepared to:\n";
print $newtitle;
print "\n";

print "Please enter a description of the new post:\n";
my $description = <STDIN>; #read stdin
chomp ($description);

print "Please enter the tags of the new post (seperated by ,):\n";
my $tags =  <STDIN>; #read stdin
chomp ($tags);

my $imgfolder = $projectpath."/img/".$date."-".$newtitle;
my $imgfoldershort = "/img/".$date."-".$newtitle;
my $mdfile = $projectpath."/_posts/".$date."-".$newtitle.".md";

# Use the open() function to create the file.
unless(open FILE, '>'.$mdfile) {
    # Die with error message 
    # if we can't open it.
    die "\nUnable to create $mdfile\n";
}
#Use mkdir() function to create folder
unless(-e $imgfolder or mkdir $imgfolder) {
        die "Unable to create $imgfolder\n";
    }

print FILE "---\n";
print FILE "layout: post\n";
print FILE "title: $title \n";
print FILE "description: $description.\n";
print FILE "date: $datestring\n";
print FILE "date_modified: $datestring\n";
print FILE "categories: [$tags]\n";
print FILE "tags:\n";
my @values = split(',', $tags);
  foreach my $val (@values) {
    print FILE "  - $val\n";
  }
print FILE "author: wechris\n";
print FILE "image:\n";
print FILE "  path: $imgfoldershort/postpreview.jpg\n";
print FILE "  width: 629\n";
print FILE "  height: 600\n";
print FILE "---\n";

# close the file.
close FILE;
print "Successfully created the new post template:\n";
print "Image folder: ".$imgfoldershort."\n";
print "Markdown file: ".$mdfile."\n";
open(OUT,$mdfile) || errout();
while(<OUT>) { print ; }
close(OUT);