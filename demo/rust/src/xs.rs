#![allow(dead_code)]

use libc::{ c_void, c_char, c_int, c_long };
use std::ptr;
use std::ffi::{ CString };

pub enum Interp {}

pub enum CV {}

#[repr(C)]
pub struct Stack {
	sp: *mut c_void,
	mark: *mut c_void,
	ax: c_int,
	items: c_int,
}

impl Stack {
	pub fn new() -> Stack {
		Stack {
			sp: ptr::null_mut(),
			mark: ptr::null_mut(),
			ax: 0,
			items: 0,
		}
	}
}

// Should be generated with a macro, but it is not allowed (rust-lang/rust#5668)
#[cfg(perl_multiplicity)]
extern {
	fn ouroboros_stack_init(perl: *mut Interp, stack: *mut Stack);
	fn ouroboros_stack_prepush(perl: *mut Interp, stack: &mut Stack);
	fn ouroboros_stack_putback(perl: *mut Interp, stack: *mut Stack);
	fn ouroboros_stack_xpush_iv(perl: *mut Interp, stack: *mut Stack, iv: c_long);
	fn ouroboros_stack_xpush_pv(perl: *mut Interp, stack: *mut Stack, str: *const c_char, len: c_long);
	fn Perl_newXS(perl: *mut Interp, name: *const i8, xs: FunXS, file: *const c_char);
}

#[cfg(not(perl_multiplicity))]
extern {
	fn ouroboros_stack_init(stack: *mut Stack);
	fn ouroboros_stack_prepush(stack: &mut Stack);
	fn ouroboros_stack_putback(stack: *mut Stack);
	fn ouroboros_stack_xpush_iv(stack: *mut Stack, iv: c_long);
	fn ouroboros_stack_xpush_pv(stack: *mut Stack, str: *const c_char, len: c_long);
	fn Perl_newXS(name: *const i8, xs: FunXS, file: *const c_char);
}

#[cfg(perl_multiplicity)]
pub type FunXS = extern "C" fn(&mut Interp, &CV);
#[cfg(perl_multiplicity)]
macro_rules! call { ($name:ident, $xs:expr, $( $args:expr ),*) => { $name($xs.perl, $( $args ),*) } }

#[cfg(not(perl_multiplicity))]
pub type FunXS = extern "C" fn(&CV);
#[cfg(not(perl_multiplicity))]
macro_rules! call { ($name:ident, $xs:expr, $( $args:expr ),*) => { $name($( $args ),*) } }

pub struct XS<'a> {
	#[cfg(perl_multiplicity)]
	perl: *mut Interp,
	cv: *const CV,
	stack: Stack,
	marker: ::std::marker::PhantomData<&'a Interp>,
}

impl<'a> XS<'a> {
	#[cfg(perl_multiplicity)]
	fn create(perl: *mut Interp, cv: *const CV) -> XS<'a> {
		XS {
			perl: perl,
			cv: cv,
			stack: Stack::new(),
			marker: ::std::marker::PhantomData,
		}
	}

	#[cfg(not(perl_multiplicity))]
	fn create(cv: *const CV) -> XS<'a> {
		XS {
			cv: cv,
			stack: Stack::new(),
			marker: ::std::marker::PhantomData,
		}
	}

	#[cfg(perl_multiplicity)]
	pub fn init(perl: *mut Interp, cv: *const CV) -> XS<'a> {
		let mut xs = XS::create(perl, cv);
		unsafe {
			call!(ouroboros_stack_init, xs, &mut xs.stack);
		}
		return xs;
	}

	#[cfg(not(perl_multiplicity))]
	pub fn init(cv: *const CV) -> XS<'a> {
		let mut xs = XS::create(cv);
		unsafe {
			call!(ouroboros_stack_init, xs, &mut xs.stack);
		}
		return xs;
	}

	pub fn prepush(&mut self) {
		unsafe {
			call!(ouroboros_stack_prepush, self, &mut self.stack);
		}
	}

	pub fn push_long(&mut self, val: c_long) {
		unsafe {
			call!(ouroboros_stack_xpush_iv, self, &mut self.stack, val);
		}
	}

	pub fn push_string(&mut self, string: &str) {
		let cstr = CString::new(string).unwrap();
		unsafe {
			call!(ouroboros_stack_xpush_pv, self, &mut self.stack, cstr.as_ptr(), string.len() as c_long);
		}
	}

	pub fn putback(&mut self) {
		unsafe {
			call!(ouroboros_stack_putback, self, &mut self.stack);
		}
	}

	pub fn new_xs(&mut self, name: &str, xs: FunXS, file: &'static [u8]) {
		let cname = CString::new(name).unwrap();
		unsafe {
			call!(Perl_newXS, self, cname.as_ptr(), xs, file.as_ptr() as *const c_char);
		}
	}
}
