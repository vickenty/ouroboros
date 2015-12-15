use std::process::Command;

fn main() {
	Command::new("make").arg("lib").status().unwrap();

	let perl = std::env::var("PERL").unwrap();

	let multi_check = Command::new(perl)
		.arg("-MConfig")
		.arg("-e")
		.arg("exit ($Config::Config{usemultiplicity} ? 0 : 1)")
		.status()
		.unwrap();

	println!("cargo:rustc-link-search=native=.");
	println!("cargo:rustc-link-lib=ouroboros");

	if multi_check.success() {
		println!("cargo:rustc-cfg=perl_multiplicity");
	}
}
