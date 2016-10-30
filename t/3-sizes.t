use strict;
use warnings;

use Test::More;
use Config;

require_ok("Ouroboros");
require_ok("Ouroboros::Spec");

foreach my $e (
    @{$Ouroboros::Spec::SPEC{enum}},
    @{$Ouroboros::Spec::SPEC{const}},
) {
    my $psize = $Config{lc $e->{perl_type} . "size"};
    my $csize = $Config{lc $e->{c_type} . "size"} // $Ouroboros::SIZE_OF{$e->{c_type}};
    ok defined $psize, "perl size known";
    ok defined $csize, "c size known";
    cmp_ok $psize, ">=", $csize, "value is not truncated";
}

done_testing;
