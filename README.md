# Ouroboros

Perl XS API wrapped in C functions.

Perl XS API makes heavy use of C preprocessor to generate inline code, which
makes it difficult to write XS modules in anything but C. This library tries to
help.

libouroboros wraps macros provided by Perl inside plain C functions. These
functions can be used to create Perl-compatible native code in any language
that supports linking with C. (See `demo/rust` for one example).

Additionally, a Perl package is provided that exports pointers to these
functions back to Perl, to be called from dynamically assembled code.

## Requirements.

Perl 5.20 or later.
A working C compiler.

## Building

    perl Makefile.PL
    make
    make install

