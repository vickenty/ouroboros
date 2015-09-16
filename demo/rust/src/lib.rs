extern crate libc;
use libc::{ c_void, c_int, c_long };
use std::ffi::{ CString };

#[repr(C)]
struct Stack {
	sp: *mut c_void,
	mark: *mut c_void,
	ax: c_int,
	items: c_int,
}

impl Stack {
	pub fn new() -> Stack {
		Stack {
			sp: 0 as *mut c_void,
			mark: 0 as *mut c_void,
			ax: 0,
			items: 0,
		}
	}
}

extern {
	fn ouroboros_stack_init(perl: *mut c_void, stack: *mut Stack);
	fn ouroboros_stack_prepush(perl: *mut c_void, stack: *mut Stack);
	fn ouroboros_stack_putback(perl: *mut c_void, stack: *mut Stack);
	fn ouroboros_stack_xpush_iv(perl: *mut c_void, stack: *mut Stack, iv: c_long);
	fn ouroboros_stack_xpush_pv(perl: *mut c_void, stack: *mut Stack, str: *const u8, len: c_long);
	fn ouroboros_newxs(perl: *mut c_void, name: *const i8, xs: extern fn(*mut c_void, *mut c_void), file: *const i8);
}

#[allow(dead_code)]
#[no_mangle]
pub extern fn rusty_hello(perl: *mut c_void, _cv: *mut c_void) {
	unsafe {
		let mut stack = Stack::new();
		let stackp = &mut stack as *mut Stack;
		ouroboros_stack_init(perl, stackp);
		ouroboros_stack_prepush(perl, stackp);
		
		let hello = "Hello from Rust code".to_string().into_bytes();
		ouroboros_stack_xpush_pv(perl, stackp, hello.as_ptr(), hello.len() as c_long);
		ouroboros_stack_putback(perl, stackp);
	}
}

#[allow(dead_code)]
#[allow(non_snake_case)]
#[no_mangle]
pub extern fn boot_Rusty(perl: *mut c_void, _cv: *mut c_void) {
	unsafe {
		let mut stack = Stack::new();
		let stackp = &mut stack as *mut Stack;
		ouroboros_stack_init(perl, stackp);
		ouroboros_newxs(perl, CString::new("Rusty::hello").unwrap().as_ptr(), rusty_hello, CString::new(file!()).unwrap().as_ptr());
		ouroboros_stack_prepush(perl, stackp);
		ouroboros_stack_xpush_iv(perl, stackp, 1);
		ouroboros_stack_putback(perl, stackp);
	}
}
