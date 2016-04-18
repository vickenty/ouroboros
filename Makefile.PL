use ExtUtils::MakeMaker;
use ExtUtils::Constant "WriteConstants";

WriteMakefile(
    NAME              => 'Ouroboros',
    VERSION_FROM      => 'lib/Ouroboros.pm',
    ABSTRACT_FROM     => 'lib/Ouroboros.pm',
    AUTHOR            => 'Vickenty Fesunov <cpan-ouroboros@setattr.net>',
    LICENSE           => 'bsd',
    MIN_PERL_VERSION  => "5.18.0", # SvREFCNT_dec_NN
    PREREQ_PM         => {
        "File::ShareDir" => 0,
    },
    TEST_REQUIRES     => {
        "FFI::Raw" => 0,
        "FFI::Platypus" => 0,
    },
    OBJECT            => "Ouroboros.o libouroboros.o",
    LIBS              => [],
    DEFINE            => '',
    INC               => '-I.',
    depend            => { "Ouroboros.xs" => "const-c.inc const-xs.inc" },
    realclean         => { FILES => "const-c.inc const-xs.inc" },
    META_MERGE        => {
        "meta-spec" => { version => 2 },
        resources => {
            repository => {
                type => "git",
                url => "https://github.com/vickenty/ouroboros",
                web => "https://github.com/vickenty/ouroboros",
            },
            bugtracker => {
                web => "https://github.com/vickenty/ouroboros/issues",
            },
        },
    },
);

my @enums = qw(
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

my @consts = qw(
    SV_IMMEDIATE_UNREF
    SV_GMAGIC
    SV_COW_DROP_PV
    SV_UTF8_NO_ENCODING
    SV_NOSTEAL
    SV_CONST_RETURN
    SV_MUTABLE_RETURN
    SV_SMAGIC
    SV_HAS_TRAILING_NUL
    SV_COW_SHARED_HASH_KEYS
    SV_COW_OTHER_PVS
    SV_UNDEF_RETURNS_NULL
    SV_FORCE_UTF8_UPGRADE
    SV_SKIP_OVERLOAD
    SV_CATBYTES
    SV_CATUTF8
    SV_CONST_TIESCALAR
    SV_CONST_TIEARRAY
    SV_CONST_TIEHASH
    SV_CONST_TIEHANDLE
    SV_CONST_FETCH
    SV_CONST_FETCHSIZE
    SV_CONST_STORE
    SV_CONST_STORESIZE
    SV_CONST_EXISTS
    SV_CONST_PUSH
    SV_CONST_POP
    SV_CONST_SHIFT
    SV_CONST_UNSHIFT
    SV_CONST_SPLICE
    SV_CONST_EXTEND
    SV_CONST_FIRSTKEY
    SV_CONST_NEXTKEY
    SV_CONST_SCALAR
    SV_CONST_OPEN
    SV_CONST_WRITE
    SV_CONST_PRINT
    SV_CONST_PRINTF
    SV_CONST_READ
    SV_CONST_READLINE
    SV_CONST_GETC
    SV_CONST_SEEK
    SV_CONST_TELL
    SV_CONST_EOF
    SV_CONST_BINMODE
    SV_CONST_FILENO
    SV_CONST_CLOSE
    SV_CONST_DELETE
    SV_CONST_CLEAR
    SV_CONST_UNTIE
    SV_CONST_DESTROY
);

WriteConstants(
    NAME => "Ouroboros",
    NAMES => [
        map({ name => $_, macro => 1, type => "IV" }, @enums),
        map({ name => $_, type => "IV" }, @consts),
    ],
    PROXYSUBS => { push => "CONSTS" },
);

package MY;
use File::Spec::Functions qw/catfile/;

sub MY::postamble {
    my $self = shift;
    my $dest = catfile(qw#$(INST_LIB) auto share dist $(DISTNAME)#);
    my $make = "config::\n";
    my @files = qw/libouroboros.h libouroboros.c/;

    join "", map "$_\n",
        "config::",
        "\t\$(NOECHO) \$(MKPATH) '$dest'\n",
        map "\t\$(NOECHO) \$(CP) '$_->[0]' '$_->[1]'",
        map [ $_, catfile($dest, $_) ],
        @files;
}
