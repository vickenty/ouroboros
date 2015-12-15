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

#[allow(dead_code)]
extern {
	fn ouroboros_stack_init(perl: *mut Interp, stack: *mut Stack);
	fn ouroboros_stack_prepush(perl: &mut Interp, stack: &mut Stack);
	fn ouroboros_stack_putback(perl: *mut Interp, stack: *mut Stack);
	fn ouroboros_stack_xpush_iv(perl: *mut Interp, stack: *mut Stack, iv: c_long);
	fn ouroboros_stack_xpush_pv(perl: *mut Interp, stack: *mut Stack, str: *const c_char, len: c_long);
	fn ouroboros_newxs(perl: *mut Interp, name: *const i8, xs: extern fn(&mut Interp, &CV), file: *const c_char);
}

#[allow(dead_code)]
pub struct XS<'a> {
	perl: &'a mut Interp,
	cv: &'a CV,
	stack: Stack,
}

impl<'a> XS<'a> {
	fn create(perl: &'a mut Interp, cv: &'a CV) -> XS<'a> {
		XS {
			perl: perl,
			cv: cv,
			stack: Stack::new(),
		}
	}

	pub fn init(perl: &'a mut Interp, cv: &'a CV) -> XS<'a> {
		let mut xs = XS::create(perl, cv);
		unsafe {
			ouroboros_stack_init(xs.perl, &mut xs.stack);
		}
		return xs;
	}

	pub fn prepush(&mut self) {
		unsafe {
			ouroboros_stack_prepush(self.perl, &mut self.stack);
		}
	}

	pub fn push_long(&mut self, val: c_long) {
		unsafe {
			ouroboros_stack_xpush_iv(self.perl, &mut self.stack, val);
		}
	}

	pub fn push_string(&mut self, string: &str) {
		let cstr = CString::new(string).unwrap();
		unsafe {
			ouroboros_stack_xpush_pv(self.perl, &mut self.stack, cstr.as_ptr(), string.len() as c_long);
		}
	}

	pub fn putback(&mut self) {
		unsafe {
			ouroboros_stack_putback(self.perl, &mut self.stack);
		}
	}

	pub fn new_xs(&mut self, name: &str, xs: extern fn (&mut Interp, &CV), file: &'static [u8]) {
		let cname = CString::new(name).unwrap();
		unsafe {
			ouroboros_newxs(self.perl, cname.as_ptr(), xs, file.as_ptr() as *mut c_char);
		}
	}
}
