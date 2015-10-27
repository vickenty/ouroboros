Gone Perl
===

Quick and dirty demo of writing Perl XS modules in Go.

Requirements
---

* Perl 5.20 or later.
* Go 1.5 or later.
* C compiler.
* GNU Make.

Running
---

Run `make` to build everything. Then:

    $ perl -Mblib -MGone -E 'say Gone::hello'
    Hello from Rust!

You can pass path to your Go installation using GOROOT variable:

    make GOROOT=/path/to/go-1.5

Files here
---

Several files are of special interest in this repository:

* `gone.go` - main package.
* `lib/Gone.pm` - supporting file to bootstrap the package. Nothing Go specific here, most if not all XS packages have one like this.

