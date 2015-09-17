Rusty Perl
===

Quick and dirty demo of writing Perl XS modules in Rust instead of XS or C.

Requirements
---

* Perl 5.20 or later.
* Rust 1.2 or later.
* C compiler.
* GNU Make.

Running
---

Run `make` to build everything. Then:

    $ perl -Iblib/arch -Iblib/lib -MRusty -E 'say Rusty::hello'
    Hello from Rust!

Files here
---

Several files are of special interest in this repository:

* `src/lib.rs` - the main package.
* `src/xs.rs` - provides safe Rust interface to libouroboros.
* `lib/Rusty.pm` - supporting file to bootstrap the package. Nothing Rust specific here, most if not all XS packages have one like this.
* `build.rs` - build script for Cargo. It calls `make lib` to build the libouroboros and instructs Cargo to link the final binary with it.

