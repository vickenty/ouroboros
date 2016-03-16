package Ouroboros;

use 5.020002;
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

=over

=back

=head1 CONSTANTS

Some constants are already available from L<B>, the rest can be found here.

=over

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
