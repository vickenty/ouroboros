extern crate libc;

mod xs;
use xs::*;

#[allow(dead_code)]
#[no_mangle]
pub extern fn rusty_hello(perl: &mut Interp, cv: &CV) {
	let mut xs = XS::init(perl, cv);
	xs.prepush();
	xs.push_string("Hello from Rust!");
	xs.putback();
}

/* Until there is a better way to convert file!() to a static CString() */
const FILE: &'static [libc::c_char] = &[ 0 ];

#[allow(dead_code)]
#[allow(non_snake_case)]
#[no_mangle]
pub extern fn boot_Rusty(perl: &mut Interp, cv: &CV) {
	let mut xs = XS::init(perl, cv);
	xs.new_xs("Rusty::hello", rusty_hello, FILE);
	xs.prepush();
	xs.push_long(1);
	xs.putback();
}
