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
    ouroboros_stack_prepush_ptr
    ouroboros_stack_putback_ptr
    ouroboros_stack_fetch_ptr
    ouroboros_stack_store_ptr
    ouroboros_stack_xpush_sv_ptr
    ouroboros_stack_xpush_sv_mortal_ptr
    ouroboros_stack_xpush_iv_ptr
    ouroboros_stack_xpush_uv_ptr
    ouroboros_stack_xpush_nv_ptr
    ouroboros_stack_xpush_pv_ptr
    ouroboros_sv_iv_ptr
    ouroboros_sv_uv_ptr
    ouroboros_sv_nv_ptr
    ouroboros_sv_av_ptr
    ouroboros_sv_hv_ptr
    ouroboros_sv_rok_ptr
    ouroboros_sv_rv_ptr
    ouroboros_sv_type_ptr
    ouroboros_sv_refcnt_ptr
    ouroboros_sv_refcnt_inc_ptr
    ouroboros_sv_refcnt_inc_nn_ptr
    ouroboros_sv_refcnt_inc_void_ptr
    ouroboros_sv_refcnt_inc_void_nn_ptr
    ouroboros_sv_refcnt_dec_ptr
    ouroboros_sv_refcnt_dec_nn_ptr
);

our @SV_TYPES;

our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
    svt => \@SV_TYPES,
);

our @EXPORT = qw();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Ouroboros', $VERSION);

# XS bootstrap pushes to @SV_TYPES, this must come after XSLoader::load().
push @EXPORT_OK, @SV_TYPES;

1;
__END__

=head1 NAME

Ouroboros - expose bits of Perl API as pointers to functions

=head1 LIBOUROBOROS

Perl XS API makes heavy use of C preprocessor to generate code, which makes it
hard to write XS modules in anything but C. libouroboros wraps Perl XS macros
in regular functions with some minor magic tricks - enabling non-C languages to
use XS API directly.

=head1 THIS PACKAGE

This package provides pointers to functions in libouroboros, so these can be
called from run-time generated machine code.

=head1 SEE MORE

L<LibJIT>

=head1 AUTHOR

Vickenty Fesunov, E<lt>cpan-ouroboros@setattr.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Vickenty Fesunov.

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
