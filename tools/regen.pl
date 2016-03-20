#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use File::Slurp;

use lib "lib";
use Ouroboros::Spec;

sub pthx {
    my $fn = shift;
    if ($fn->{tags}{context}) {
        @{$_->{params}} ? "pTHX_ ": "pTHX"
    } else {
        ""
    }
}

open my $spec_fh, "<", "libouroboros.txt";
my $spec = Ouroboros::Spec::parse_fh($spec_fh);

my @names;
{
    open my $xs, ">", "fn-pointer-xs.inc";

    foreach my $shim (map $_->{name}, @{$spec->{fn}}) {
        push @names, my $name = $shim . "_ptr";
        $xs->print("void*\n$name()\n");
        $xs->print("CODE:\n\tRETVAL = $shim;\nOUTPUT:\n\tRETVAL\n\n");
    }
}

{
    my $package = "lib/Ouroboros.pm";
    my $pm = read_file($package);
    my $shims = join "", map "    $_\n", @names;
    $pm =~ s/(our\s+\@EXPORT_OK\s*=\s*qw\()[^\)]*(\);)/$1\n$shims$2/m or die;
    write_file($package, $pm);
}

{
    my $source = "Ouroboros.xs";
    my $xs = read_file($source);
    my $sizes = join "", map "\t\tSS($_->{type});\n", @{$spec->{sizeof}};
    $xs =~ s!(/\*\s*sizeof\s*{\s*\*/)[^}]*(/\*\s*}\s*\*/)!$1\n$sizes$2!m or die;
    write_file($source, $xs);
}

{
    my $decls = do {
        local $" = ", ";
        join "", map sprintf("%s %s(%s%s);\n", $_->{type}, $_->{name}, pthx($_), "@{$_->{params}}"), @{$spec->{fn}}
    };

    my $header = "libouroboros.h";
    my $ch = read_file($header);
    $ch =~ s!(/\*\s*functions\s*{\s*\*/)[^}]*(/\*\s*}\s*\*/)!$1\n$decls$2!m or die;
    write_file($header, $ch);
}

sub mk_impl {
    my $fn = shift;

    my $pname = "a";
    my $svn = "";

    my ($macro_name, @hints) = @{$fn->{tags}{autoimpl}};

    my (@decl, @impl);
    foreach my $ptype (@{$fn->{params}}) {
        my $hint = shift @hints // "";
        my $is_stack = $ptype eq "ouroboros_stack_t*";
        my $name =
            $is_stack
            ? "stack"
            : $ptype eq "SV*"
            ? "sv" . $svn++
            : $pname++;
        push @decl, "$ptype $name";
        push @impl, "$hint$name" unless $is_stack;
    }

    return sprintf("%s %s(%s%s)\n{\n        %s%s%s;\n}\n",
        $fn->{type}, $fn->{name}, pthx($fn),
        join(", ", @decl),
        $fn->{type} eq "void" ? "" : "return ",
        $macro_name,
        @impl ? map("($_)", join ", ", @impl) : $fn->{tags}{parens} ? "()" : ""
    );
}

{
    my $impls = join "\n", map mk_impl($_), grep $_->{tags}{autoimpl}, @{$spec->{fn}};
    my $source = "libouroboros.c";
    my $cc = read_file($source);
    $cc =~ s!(/\*\s*functions\s*{\s*\*/).*?(/\*\s*}\s*\*/)!$1\n$impls$2!s or die;
    write_file($source, $cc);
}

{
    my $enums = join "", map "    $_->{name}\n", @{$spec->{enum}};
    my $consts = join "", map "    $_->{name}\n", @{$spec->{const}};

    my $makefile = "Makefile.PL";
    my $mf = read_file($makefile);
    $mf =~ s/(my\s+\@enums\s*=\s*qw\()[^\)]*(\);)/$1\n$enums$2/m or die;
    $mf =~ s/(my\s+\@consts\s*=\s*qw\()[^\)]*(\);)/$1\n$consts$2/m or die;
    write_file($makefile, $mf);
}
