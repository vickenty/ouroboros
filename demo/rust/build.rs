use std::process::Command;

fn main() {
	Command::new("make").arg("lib").status().unwrap();
	println!("cargo:rustc-link-search=native=.");
	println!("cargo:rustc-link-lib=ouroboros");
}
