#[cfg(perl_multiplicity)]
macro_rules! xs_proc {
	($name:ident, $xs:ident, $body:block) => {
		#[allow(dead_code)]
		#[allow(non_snake_case)]
		#[no_mangle]
		pub extern "C" fn $name(perl: &mut $crate::xs::Interp, cv: &$crate::xs::CV) {
			let mut $xs = $crate::xs::XS::init(perl, cv);
			$body
		}
	}
}

#[cfg(not(perl_multiplicity))]
macro_rules! xs_proc {
	($name:ident, $xs:ident, $body:block) => {
		#[allow(dead_code)]
		#[allow(non_snake_case)]
		#[no_mangle]
		pub extern "C" fn $name(cv: &$crate::xs::CV) {
			let mut $xs = $crate::xs::XS::init(cv);
			$body
		}
	}
}

macro_rules! XS {
	(package $pkg:ident ($boot:ident) { $( sub $name:ident($xs:ident) $body:block)* }) => {
		$(xs_proc!($name, $xs, $body);)*

		xs_proc!(
			$boot, xs, {
			$({
				let name = [ stringify!($pkg), stringify!($name) ].join("::");
				xs.new_xs(&name, $name, b"Rust code\0");
			})*

			xs.prepush();
			xs.push_long(1);
			xs.putback();
		});
	}
}
