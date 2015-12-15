package main

import "unsafe"

// #cgo CFLAGS: -I/usr/lib/x86_64-linux-gnu/perl/5.20/CORE -I../.. -fPIC
// #cgo LDFLAGS: -Wl,--unresolved-symbols=ignore-all -L. -louroboros
// #include "libouroboros.h"
// #include "stdlib.h"
// void gone_hello(PerlInterpreter* perl, CV* cv);
import "C"

var file []byte = []byte{0}

//export gone_hello
func gone_hello(perl *C.PerlInterpreter, cv *C.CV) {
	var stack C.struct_ouroboros_stack
	C.ouroboros_stack_init(perl, &stack)

	var hello = "Hello from Go"
	var hello_c = C.CString(hello)
	C.ouroboros_stack_prepush(perl, &stack)
	C.ouroboros_stack_xpush_pv(perl, &stack, hello_c, C.size_t(len(hello)))
	C.ouroboros_stack_putback(perl, &stack)

	C.free(unsafe.Pointer(hello_c))
}

//export boot_Gone
func boot_Gone(perl *C.PerlInterpreter, cv *C.CV) {
	var stack C.struct_ouroboros_stack
	C.ouroboros_stack_init(perl, &stack)

	var hello = C.CString("Gone::hello")
	C.Perl_newXS(perl, hello,
		(*[0]byte)(unsafe.Pointer(C.gone_hello)),
		(*C.char)(unsafe.Pointer(&file[0])))
	C.free(unsafe.Pointer(hello))

	C.ouroboros_stack_prepush(perl, &stack)
	C.ouroboros_stack_xpush_iv(perl, &stack, C.IV(1))
	C.ouroboros_stack_putback(perl, &stack)
}

func main() {}
