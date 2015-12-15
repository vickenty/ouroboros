.PHONY: all lib clean

PERL?=perl
export PERL

ARCHLIBEXP=$(shell $(PERL) -MConfig -E 'say $$Config{archlibexp}')
CFLAGS=-I$(ARCHLIBEXP)/CORE -I../.. -fPIC

all: lib
	cargo build
	mkdir -p blib/arch/auto/Rusty blib/lib
	cp target/debug/librusty.so blib/arch/auto/Rusty/Rusty.so
	cp lib/Rusty.pm blib/lib/Rusty.pm
	$(PERL) -Iblib/arch -Iblib/lib -MRusty -E 'say Rusty::hello'

lib: libouroboros.a

libouroboros.a: libouroboros.o
	$(AR) r $@ $^

libouroboros.o: ../../libouroboros.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	cargo clean
	rm -rf libouroboros.o libouroboros.a blib
