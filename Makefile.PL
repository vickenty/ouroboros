use 5.020002;
use ExtUtils::MakeMaker;
use ExtUtils::Constant "WriteConstants";

WriteMakefile(
    NAME              => 'Ouroboros',
    VERSION_FROM      => 'lib/Ouroboros.pm',
    ABSTRACT_FROM     => 'lib/Ouroboros.pm',
    AUTHOR            => 'Vickenty Fesunov <cpan-ouroboros@setattr.net>',
    LICENSE           => 'bsd',
    PREREQ_PM         => {},
    OBJECT            => [ qw/Ouroboros.o libouroboros.o/ ],
    LIBS              => [],
    DEFINE            => '',
    INC               => '-I.',
    depend            => { "Ouroboros.xs" => "const-c.inc const-xs.inc" },
    realclean         => { FILES => "const-c.inc const-xs.inc" },
);

my @constants = qw(
    SVt_NULL
    SVt_IV
    SVt_NV
    SVt_PV
    SVt_PVIV
    SVt_PVNV
    SVt_PVMG
    SVt_REGEXP
    SVt_PVGV
    SVt_PVLV
    SVt_PVAV
    SVt_PVHV
    SVt_PVCV
    SVt_PVFM
    SVt_PVIO
    SVt_LAST
);

WriteConstants(
    NAME => "Ouroboros",
    NAMES => [ map +{ name => $_, macro => 1, type => "IV" }, @constants ],
    PROXYSUBS => { push => "SV_TYPES" },
);
