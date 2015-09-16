# NAME

Ouroboros - expose bits of Perl API as pointers to functions

# LIBOUROBOROS

Perl XS API makes heavy use of C preprocessor to generate code, which makes it
very hard to build XS modules in anything but C language. libouroboros wraps
Perl XS macros in regular functions with some minor magic tricks - enabling
non-C languages to use XS API directly.

# THIS PACKAGE

This package provides pointers to functions in libouroboros, so these can be
called from run-time generated machine code.

# SEE MORE

[LibJIT](https://metacpan.org/pod/LibJIT)

# AUTHOR

Vickenty Fesunov, &lt;cpan-ouroboros@setattr.net>

# COPYRIGHT AND LICENSE

Copyright (C) 2015 by Vickenty Fesunov.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1\. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2\. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

3\. Neither the name of the University nor the names of its contributors may be
used to endorse or promote products derived from this software without specific
prior written permission.

THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS \`\`AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
