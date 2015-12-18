# PoC build with LTO - this inlines ouroboros wrappers and makes code more like
# native XS code compiled with C compiler. Requires at least Clang 3.7 (earlier
# versions do not work).
#
# Overview: 
# - produce LLVM bitcode version of libouroboros
# - produce LLVM bitcode version of this extension, linked statically with std crate
# - compile bitcodes into an object file using LTO-capable linker (LTO doesn't
#   kick in when code is linked directly into shared library)
# - convert resulting object file into a shared library

# Perl and Clang executables to use.
PERL?=perl
CLANG?=clang-3.7

# Avoid warnings caused by mismatch between Rust and Clang default targets.
TARGET=$(shell rustc -Vv | awk -F': ' '/^host/ { print($$2) }')

###
### Build LLVM bitcode version of libouroboros.
###

# -flto causes clang to produce LTO-compatible object files, which in practice
# means file will contain LLVM bitcode.
ARCHLIBEXP=$(shell $(PERL) -MConfig -E 'say $$Config{archlibexp}')
CFLAGS=-I$(ARCHLIBEXP)/CORE -I../.. -fPIC -Wno-pointer-bool-conversion --target=$(TARGET) -flto

libouroboros.bc: ../../libouroboros.c
	$(CLANG) $(CFLAGS) -o $@ -c $<

###
### Build LLVM bitcode version of Rust XS module.
###

# Check if we building for threaded Perl.
PERL_CFG=$(shell $(PERL) -MConfig -E 'say "--cfg perl_multiplicity" x !!$$Config{usemultiplicity}')

# Find path to the std crate. This is normally done by cargo, but cargo can not
# produce linked bitcode we need.
RUST_LIBDIR=$(dir $(shell which rustc))../lib/rustlib/$(TARGET)/lib
RUST_STD=$(wildcard $(RUST_LIBDIR)/libstd-*.rlib)

# '-C lto' embeds stdlib into the bitcode file, and we don't need to link to it
# at link time (clang linker doesn't handle Rust .rlib archives well anyway).
RUSTC_OPT=-C lto -C opt-level=2 --crate-type staticlib --emit llvm-bc $(PERL_CFG)
RUSTC_LIB=--extern std=$(RUST_STD)

rusty.bc: src/lib.rs
	rustc $(RUSTC_OPT) -o $@ $< $(RUSTC_LIB)

###
### Compile bitcodes into an object file.
###

LDFLAGS=-flto -fuse-ld=gold -Wl,-r -nostdlib --target=$(TARGET)

rusty-lto.o: rusty.bc libouroboros.bc
	$(CLANG) $(LDFLAGS) -o $@ $^

###
### Convert into final shared library.
###

rusty-lto.so: rusty-lto.o
	$(CLANG) -shared -o $@ $<

###
### The rest.
###

lto: rusty-lto.so
	mkdir -p blib/arch/auto/Rusty blib/lib
	cp rusty-lto.so blib/arch/auto/Rusty/Rusty.so
	cp lib/Rusty.pm blib/lib/Rusty.pm
	$(PERL) -Iblib/arch -Iblib/lib -MRusty -E 'say Rusty::hello'

clean:
	rm -rf libouroboros.bc rusty.bc rusty-lto.o rusty-lto.so blib

.DEFAULT_GOAL:=lto
.PHONY: lto clean
