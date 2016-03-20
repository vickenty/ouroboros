package Ouroboros::Spec;

use strict;
use warnings;

my %DEFAULT_TAGS = (
    context => 1,
);

my %ITEM_CTOR = (
    fn => sub {
        my ($tags, $kind, $type, $name, @params) = @_;
        return {
            type => $type,
            name => $name,
            params => \@params,
            tags => { %DEFAULT_TAGS, %$tags },
        };
    },

    sizeof => sub {
        my ($tags, $kind, $name) = @_;
        return { type => $name };
    },

    enum => sub {
        my ($tags, $kind, $name) = @_;
        return { name => $name };
    },

    const => sub {
        my ($tags, $kind, $name) = @_;
        return { name => $name };
    },
);

sub parse_fh {
    my ($fh) = @_;

    my $err;
    my $warn = sub {
        warn @_;
        $err++;
    };

    my $spec;
    my %seen_tags;

    while (my $line = <$fh>) {
        chomp $line;

        if ($line =~ /^#: (\w+)(?:\((.*)\))?/) {
            my $impl = $seen_tags{autoimpl} = [ $1 ];
            push @$impl, split /\s*,\s*/, $2 if $2;
            next;
        }
        if (my ($mode, $flag) = $line =~ /^#([+-]) (.*)/) {
            $seen_tags{$flag} = 1 if $mode eq "+";
            $seen_tags{$flag} = 0 if $mode eq "-";
            next;
        }
        if (my ($doc) = $line =~ /^#\? ?(.*)$/) {
            no warnings "uninitialized";
            $seen_tags{apidoc} .= "$doc\n";
            next;
        }

        # Consume all seen tags.
        my %tags = %seen_tags;
        %seen_tags = ();

        if (!$line || $line =~ /^#/) {
            $warn->("tags applied to a non-item") if %tags;
            next;
        }

        my ($kind, @f) = split /\t/, $line;

        if (my $ctor = $ITEM_CTOR{$kind}) {
            push @{$spec->{$kind}}, $ctor->(\%tags, $kind, @f);
        } else {
            $warn->("unknown item $kind");
        }
    }

    die "spec file contained errors" if $err;

    return $spec;
}

1;
