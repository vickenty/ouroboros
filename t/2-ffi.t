use strict;
use warnings;

use Config;
use Test::More;

# Don't do this at home.
sub athx {
    if ($Config{usemultiplicity}) {
        my $size = $Config{ptrsize};
        die "unsupported pointer size" unless $size == 4 || $size == 8;

        my $proc = DynaLoader::dl_load_file("");
        my $self_ptr = DynaLoader::dl_find_symbol($proc, "PL_curinterp");
        my $self = unpack $size == 4 ? "L" : "Q", pack "P$size", $self_ptr;

        return ($self);
    } else {
        return ();
    }
}

sub pthx {
    return $Config{usemultiplicity} ? (FFI::Raw::ptr()) : ();
}

if (!eval { require FFI::Raw }) {
    plan skip_all => "FFI::Raw not available";
}
elsif ($Config{nvsize} != 8) {
    plan skip_all => "unsupported NV size: $Config{nvsize}";
}
else {
    require_ok("Ouroboros");

    my $svnv = FFI::Raw->new_from_ptr(Ouroboros::ouroboros_sv_nv_ptr(), FFI::Raw::double(), pthx(), FFI::Raw::ptr());
    my $val = 42 ** 0.5;
    my $arg = $val;
    my $got = $svnv->call(athx(), int \$arg);

    is($got, $val, "SvNV wrapper works");
}

done_testing;
