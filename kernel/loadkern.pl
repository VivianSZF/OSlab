#!/usr/bin/perl

open(SIG, $ARGV[0]) || die "open $ARGV[0]: $!";

$n = sysread(SIG, $buf, 200*1024);

if($n > 200 * 1024){
  print STDERR "ERROR:Kernel binary file too large:\
	  $n bytes (max 204800)\n";
  exit 1;
}

print STDERR "Kernel binary file is $n bytes (max 204800)\n";

$m = $n % (512);
$s = 512 - $m;
$p = 204800 - $n;

print STDERR "Kernel binary file size n = $n\n";
print STDERR "Kernel binary file sectors num m = $m\n";
print STDERR "Kernel binary file added $p bytes s = $s\n";

$buf .= "\0" x $p;


open(SIG, ">$ARGV[0]") || die "open >$ARGV[0]: $!";
print SIG $buf;
close SIG;


open(SIG, $ARGV[0]) || die "open $ARGV[0]: $!";

$n = sysread(SIG, $buf, 200*1024);

if($n > 200 * 1024){
  print STDERR "ERROR:Kernel binary file large: $n bytes (max 204800)\n";
  exit 1;
}

print STDERR "Kernel binary file is $n bytes (max 204800)\n";
print STDERR "*********************************************\n";
print STDERR "*********************************************\n";
print STDERR "*********************************************\n";
close SIG;
