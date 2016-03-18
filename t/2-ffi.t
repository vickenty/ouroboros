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

if (eval { require FFI::Raw }) {
    require_ok("Ouroboros");

    my $svnv = FFI::Raw->new_from_ptr(Ouroboros::ouroboros_sv_nv_ptr(), FFI::Raw::double(), pthx(), FFI::Raw::ptr());
    my $i = 42 ** 0.5;
    my $j = $svnv->call(athx(), int \$i);

    is($i, $j, "SvNV wrapper works");

} else {
    plan skip_all => "FFI::Raw not available";
}

done_testing;
