#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use File::Slurp;

my @shims;
foreach my $line (read_file("libouroboros.txt", chomp => 1)) {
    next if !$line || $line =~ /^#/;
    my ($kind, undef, $name) = split /\t/, $line;
    push @shims, $name if $kind eq "fn";
}

open my $xs, ">", "autogenerated.inc";

my @names;
foreach my $shim (@shims) {
    push @names, my $name = $shim . "_ptr";
    $xs->print("void*\n$name()\n");
    $xs->print("CODE:\n\tRETVAL = $shim;\nOUTPUT:\n\tRETVAL\n\n");
}

my $package = "lib/Ouroboros.pm";
my $pm = read_file($package);
my $shims = join "", map "    $_\n", @names;
$pm =~ s/(our\s+\@EXPORT_OK\s*=\s*qw\()[^\)]*(\);)/$1\n$shims$2/m;
write_file($package, $pm);
