extern crate libc;

mod xs;
#[macro_use]
mod macros;

XS! {
	package Rusty (boot_Rusty) {
		sub hello(xs) {
			xs.prepush();
			xs.push_string("Hello from Rust!");
			xs.putback();
		}
	}
}
