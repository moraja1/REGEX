#!/usr/bin/perl

use strict;
use warnings;

my $t = time;
my $debug = 1;

open(my $f, "<../files/results.csv") or die("no file");
my $ok = 0;
my $no = 0;
while(<$f>) {
  chomp;
  #2018-02-28,Iraq,Saudi Arabia,4,1,Friendly,Basra,Iraq,FALSE
  if(m/^\d{4}\-.*,(.*?),(.*?),(\d+),(\d+)/){
    if($4 > $3){
      print $1." ".$3."-".$4." ".$2."\n";
      $ok++;
    }
  }else{
    $no++;
  }
}
close($f);

warn sprintf("OK: %d\nNO: %d\ntime: %ds\nEND\n", $ok, $no, time - $t);
