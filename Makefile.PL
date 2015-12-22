use 5.020002;
use ExtUtils::MakeMaker;

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
);
