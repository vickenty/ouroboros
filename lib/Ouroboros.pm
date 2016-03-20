package Ouroboros;

use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
    ouroboros_stack_init_ptr
    ouroboros_stack_items_ptr
    ouroboros_stack_prepush_ptr
    ouroboros_stack_putback_ptr
    ouroboros_stack_fetch_ptr
    ouroboros_stack_store_ptr
    ouroboros_stack_extend_ptr
    ouroboros_stack_pushmark_ptr
    ouroboros_stack_spagain_ptr
    ouroboros_stack_xpush_sv_ptr
    ouroboros_stack_xpush_sv_mortal_ptr
    ouroboros_stack_xpush_iv_ptr
    ouroboros_stack_xpush_uv_ptr
    ouroboros_stack_xpush_nv_ptr
    ouroboros_stack_xpush_pv_ptr
    ouroboros_stack_push_sv_ptr
    ouroboros_stack_push_sv_mortal_ptr
    ouroboros_stack_push_iv_ptr
    ouroboros_stack_push_uv_ptr
    ouroboros_stack_push_nv_ptr
    ouroboros_stack_push_pv_ptr
    ouroboros_sv_iv_ptr
    ouroboros_sv_uv_ptr
    ouroboros_sv_nv_ptr
    ouroboros_sv_pv_ptr
    ouroboros_sv_pv_nolen_ptr
    ouroboros_sv_rok_ptr
    ouroboros_sv_rv_ptr
    ouroboros_sv_type_ptr
    ouroboros_gv_sv_ptr
    ouroboros_gv_av_ptr
    ouroboros_gv_hv_ptr
    ouroboros_gv_cv_ptr
    ouroboros_sv_refcnt_ptr
    ouroboros_sv_refcnt_inc_ptr
    ouroboros_sv_refcnt_inc_nn_ptr
    ouroboros_sv_refcnt_inc_void_ptr
    ouroboros_sv_refcnt_inc_void_nn_ptr
    ouroboros_sv_refcnt_dec_ptr
    ouroboros_sv_refcnt_dec_nn_ptr
    ouroboros_enter_ptr
    ouroboros_leave_ptr
    ouroboros_savetmps_ptr
    ouroboros_freetmps_ptr
    ouroboros_sys_init3_ptr
    ouroboros_sys_term_ptr
);

our @CONSTS;

our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
    const => \@CONSTS,
);

our @EXPORT = qw();

our $VERSION = '0.01';

our %Size;

require XSLoader;
XSLoader::load('Ouroboros', $VERSION);

# XS bootstrap pushes to @CONSTS, this must come after XSLoader::load().  While
# ExtUtils::Constant generates code to check if constant exists or not at
# compile time, it still pushes them into the array for some reason.
# Here, we only need constants that are actually available.
@CONSTS = grep defined eval "$_", @CONSTS;

push @EXPORT_OK, @CONSTS;

1;
__END__

=head1 NAME

Ouroboros - Perl XS macros re-exported as C functions

=head1 DESCRIPTION

libouroboros is a library of C functions wrapping XS macros. This package
provides pointers to these functions, so Perl programs can have access to
internal Perl methods (e.g. SvIV) at run-time. In combination with a JIT-
compiler it allows Perl programs to build XS-like subroutines completely at
run-time, without the need for a C compiler or a build environment.

=head2 Thread context

All wrappers accept thread context as a first argument, as defined by pTHX XS
macro, even if pTHX is not part of the wrapped macro definition.

Two exceptions to this are C<ouroboros_sys_init3> and C<ouroboros_sys_term>,
since they are called in embedded Perl scenario at times when Perl interpreter
object does not exist.

=head2 The stack

C<libouroboros> encapsulates local stack state kept by XS inside the stack
object: C<ouroboros_stack_t> type and a number of method functions. Storage
can be allocated on caller's stack or in heap, and should be initialized first
by calling C<ouroboros_stack_init()>.

Minimum storage size for C<ouroboros_stack_t> is available as
C<Ouroboros::Size{struct ouroboros_stack}>. Exact layout is intentionally
unspecified, user program should treat this type as an opaque object and only
use provided methods to manipulate it.

=head2 Type sizes

Sizes for most primitive data types used by Perl are available via L<Config>
and supplemented by C<%Ouroboros::Size> hash.

=head1 METHODS

Every sub listed here returns a pointer to a C function with a signature as
provided.

=over

=item ouroboros_stack_init_ptr

    void ouroboros_stack_init(pTHX_ ouroboros_stack_t*);


=item ouroboros_stack_items_ptr

    int ouroboros_stack_items(pTHX_ ouroboros_stack_t*);


=item ouroboros_stack_prepush_ptr

    void ouroboros_stack_prepush(pTHX_ ouroboros_stack_t*);


Perl macro: C<XSprePUSH>

=item ouroboros_stack_putback_ptr

    void ouroboros_stack_putback(pTHX_ ouroboros_stack_t*);


Perl macro: C<PUTBACK>

=item ouroboros_stack_fetch_ptr

    SV* ouroboros_stack_fetch(pTHX_ ouroboros_stack_t*, SSize_t);


=item ouroboros_stack_store_ptr

    void ouroboros_stack_store(pTHX_ ouroboros_stack_t*, SSize_t, SV*);


=item ouroboros_stack_extend_ptr

    void ouroboros_stack_extend(pTHX_ ouroboros_stack_t*, SSize_t);


=item ouroboros_stack_pushmark_ptr

    void ouroboros_stack_pushmark(pTHX_ ouroboros_stack_t*);


=item ouroboros_stack_spagain_ptr

    void ouroboros_stack_spagain(pTHX_ ouroboros_stack_t*);


Perl macro: C<SPAGAIN>

=item ouroboros_stack_xpush_sv_ptr

    void ouroboros_stack_xpush_sv(pTHX_ ouroboros_stack_t*, SV*);


Perl macro: C<XPUSHs>

=item ouroboros_stack_xpush_sv_mortal_ptr

    void ouroboros_stack_xpush_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);


Perl macro: C<mXPUSHs>

=item ouroboros_stack_xpush_iv_ptr

    void ouroboros_stack_xpush_iv(pTHX_ ouroboros_stack_t*, IV);


Perl macro: C<mXPUSHi>

=item ouroboros_stack_xpush_uv_ptr

    void ouroboros_stack_xpush_uv(pTHX_ ouroboros_stack_t*, UV);


Perl macro: C<mXPUSHu>

=item ouroboros_stack_xpush_nv_ptr

    void ouroboros_stack_xpush_nv(pTHX_ ouroboros_stack_t*, NV);


Perl macro: C<mXPUSHn>

=item ouroboros_stack_xpush_pv_ptr

    void ouroboros_stack_xpush_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);


Perl macro: C<mXPUSHp>

=item ouroboros_stack_push_sv_ptr

    void ouroboros_stack_push_sv(pTHX_ ouroboros_stack_t*, SV*);


Perl macro: C<PUSHs>

=item ouroboros_stack_push_sv_mortal_ptr

    void ouroboros_stack_push_sv_mortal(pTHX_ ouroboros_stack_t*, SV*);


Perl macro: C<mPUSHs>

=item ouroboros_stack_push_iv_ptr

    void ouroboros_stack_push_iv(pTHX_ ouroboros_stack_t*, IV);


Perl macro: C<mPUSHi>

=item ouroboros_stack_push_uv_ptr

    void ouroboros_stack_push_uv(pTHX_ ouroboros_stack_t*, UV);


Perl macro: C<mPUSHu>

=item ouroboros_stack_push_nv_ptr

    void ouroboros_stack_push_nv(pTHX_ ouroboros_stack_t*, NV);


Perl macro: C<mPUSHn>

=item ouroboros_stack_push_pv_ptr

    void ouroboros_stack_push_pv(pTHX_ ouroboros_stack_t*, const char*, STRLEN);


Perl macro: C<mPUSHp>

=item ouroboros_sv_iv_ptr

    IV ouroboros_sv_iv(pTHX_ SV*);


Perl macro: C<SvIV>

=item ouroboros_sv_uv_ptr

    UV ouroboros_sv_uv(pTHX_ SV*);


Perl macro: C<SvUV>

=item ouroboros_sv_nv_ptr

    NV ouroboros_sv_nv(pTHX_ SV*);


Perl macro: C<SvNV>

=item ouroboros_sv_pv_ptr

    const char* ouroboros_sv_pv(pTHX_ SV*, STRLEN*);


Perl macro: C<SvPV>

=item ouroboros_sv_pv_nolen_ptr

    const char* ouroboros_sv_pv_nolen(pTHX_ SV*);


Perl macro: C<SvPV_nolen>

=item ouroboros_sv_rok_ptr

    U32 ouroboros_sv_rok(pTHX_ SV*);


Perl macro: C<SvROK>

=item ouroboros_sv_rv_ptr

    SV* ouroboros_sv_rv(pTHX_ SV*);


Perl macro: C<SvRV>

=item ouroboros_sv_type_ptr

    IV ouroboros_sv_type(pTHX_ SV*);


Perl macro: C<SvTYPE>

=item ouroboros_gv_sv_ptr

    SV* ouroboros_gv_sv(pTHX_ GV*);


Perl macro: C<GvSV>

=item ouroboros_gv_av_ptr

    AV* ouroboros_gv_av(pTHX_ GV*);


Perl macro: C<GvAV>

=item ouroboros_gv_hv_ptr

    HV* ouroboros_gv_hv(pTHX_ GV*);


Perl macro: C<GvHV>

=item ouroboros_gv_cv_ptr

    CV* ouroboros_gv_cv(pTHX_ CV*);


Perl macro: C<GvCV>

=item ouroboros_sv_refcnt_ptr

    U32 ouroboros_sv_refcnt(pTHX_ SV*);


Perl macro: C<SvREFCNT>

=item ouroboros_sv_refcnt_inc_ptr

    SV* ouroboros_sv_refcnt_inc(pTHX_ SV*);


Perl macro: C<SvREFCNT_inc_simple>

=item ouroboros_sv_refcnt_inc_nn_ptr

    SV* ouroboros_sv_refcnt_inc_nn(pTHX_ SV*);


Perl macro: C<SvREFCNT_inc_simple_NN>

=item ouroboros_sv_refcnt_inc_void_ptr

    void ouroboros_sv_refcnt_inc_void(pTHX_ SV*);


Perl macro: C<SvREFCNT_inc_simple_void>

=item ouroboros_sv_refcnt_inc_void_nn_ptr

    void ouroboros_sv_refcnt_inc_void_nn(pTHX_ SV*);


Perl macro: C<SvREFCNT_inc_simple_void_NN>

=item ouroboros_sv_refcnt_dec_ptr

    void ouroboros_sv_refcnt_dec(pTHX_ SV*);


Perl macro: C<SvREFCNT_dec>

=item ouroboros_sv_refcnt_dec_nn_ptr

    void ouroboros_sv_refcnt_dec_nn(pTHX_ SV*);


Perl macro: C<SvREFCNT_dec_NN>

=item ouroboros_enter_ptr

    void ouroboros_enter(pTHX);


Perl macro: C<ENTER>

=item ouroboros_leave_ptr

    void ouroboros_leave(pTHX);


Perl macro: C<LEAVE>

=item ouroboros_savetmps_ptr

    void ouroboros_savetmps(pTHX);


Perl macro: C<SAVETMPS>

=item ouroboros_freetmps_ptr

    void ouroboros_freetmps(pTHX);


Perl macro: C<FREETMPS>

=item ouroboros_sys_init3_ptr

    void ouroboros_sys_init3(int*, char***, char***);


Perl macro: C<PERL_SYS_INIT3>

=item ouroboros_sys_term_ptr

    void ouroboros_sys_term();


Perl macro: C<PERL_SYS_TERM>



=back

=head1 CONSTANTS

This package also provides a number of consants from XS API. Some constants may
not be available, depending on the Perl version used.

C<@Ouroboros::CONSTS> contains names of all constants provided by this package.

=over

=item SVt_NULL

=item SVt_IV

=item SVt_NV

=item SVt_PV

=item SVt_PVIV

=item SVt_PVNV

=item SVt_PVMG

=item SVt_REGEXP

=item SVt_PVGV

=item SVt_PVLV

=item SVt_PVAV

=item SVt_PVHV

=item SVt_PVCV

=item SVt_PVFM

=item SVt_PVIO

=item SVt_LAST

=item SV_IMMEDIATE_UNREF

=item SV_GMAGIC

=item SV_COW_DROP_PV

=item SV_UTF8_NO_ENCODING

=item SV_NOSTEAL

=item SV_CONST_RETURN

=item SV_MUTABLE_RETURN

=item SV_SMAGIC

=item SV_HAS_TRAILING_NUL

=item SV_COW_SHARED_HASH_KEYS

=item SV_COW_OTHER_PVS

=item SV_UNDEF_RETURNS_NULL

=item SV_FORCE_UTF8_UPGRADE

=item SV_SKIP_OVERLOAD

=item SV_CATBYTES

=item SV_CATUTF8

=item SV_CONST_TIESCALAR

=item SV_CONST_TIEARRAY

=item SV_CONST_TIEHASH

=item SV_CONST_TIEHANDLE

=item SV_CONST_FETCH

=item SV_CONST_FETCHSIZE

=item SV_CONST_STORE

=item SV_CONST_STORESIZE

=item SV_CONST_EXISTS

=item SV_CONST_PUSH

=item SV_CONST_POP

=item SV_CONST_SHIFT

=item SV_CONST_UNSHIFT

=item SV_CONST_SPLICE

=item SV_CONST_EXTEND

=item SV_CONST_FIRSTKEY

=item SV_CONST_NEXTKEY

=item SV_CONST_SCALAR

=item SV_CONST_OPEN

=item SV_CONST_WRITE

=item SV_CONST_PRINT

=item SV_CONST_PRINTF

=item SV_CONST_READ

=item SV_CONST_READLINE

=item SV_CONST_GETC

=item SV_CONST_SEEK

=item SV_CONST_TELL

=item SV_CONST_EOF

=item SV_CONST_BINMODE

=item SV_CONST_FILENO

=item SV_CONST_CLOSE

=item SV_CONST_DELETE

=item SV_CONST_CLEAR

=item SV_CONST_UNTIE

=item SV_CONST_DESTROY



=back

=head1 THE REST

Most of the XS API consists of normal functions and their addresses can be
discovered via L<DynaLoader> at run-time with little effort. See
L<perlguts/"Internal functions"> for more information.

=head1 SEE MORE

Perl extensive XS documentation: L<perlxs>, L<perlapi>, L<perlguts>.

JIT-compiler libraries for Perl: L<LibJIT>, L<GCCJIT>.

=head1 AUTHOR

Vickenty Fesunov, E<lt>cpan-ouroboros@setattr.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Vickenty Fesunov.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3. Neither the name of the University nor the names of its contributors may be
used to endorse or promote products derived from this software without specific
prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=cut
