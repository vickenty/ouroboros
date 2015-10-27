.PHONY: all lib clean prep

GOROOT=/usr
ARCHLIBEXP=$(shell perl -MConfig -E 'say $$Config{archlibexp}')
CFLAGS=-I$(ARCHLIBEXP)/CORE -I../.. -fPIC
LDFLAGS=-Wl,--unresolved-symbols=ignore-all -L. -louroboros

demo: lib build
	perl -Iblib/arch -Iblib/lib -MGone -E 'say Gone::hello'

build: build.stamp

build.stamp: 
	sed -i "s!^\(// #cgo CFLAGS\).*!\1: $(CFLAGS)!" gone.go
	sed -i "s!^\(// #cgo LDFLAGS\).*!\1: $(LDFLAGS)!" gone.go
	mkdir -p blib/arch/auto/Gone blib/lib/auto/Gone
	$(GOROOT)/bin/go build -o blib/arch/auto/Gone/Gone.so -buildmode=c-shared gone.go
	cp lib/Gone.pm blib/lib/Gone.pm
	echo '1;' > blib/lib/auto/Gone/autosplit.ix
	touch build.stamp

lib: libouroboros.a

libouroboros.a: libouroboros.o
	$(AR) r $@ $^

libouroboros.o: ../../libouroboros.c
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -rf libouroboros.o libouroboros.a blib build.stamp
