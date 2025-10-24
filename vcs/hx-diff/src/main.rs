use std::env;
use std::path::Path;

fn main() {
    let args: Vec<String> = env::args().collect();
    
    if args.len() != 3 {
        eprintln!("Usage: hx-diff-wrapper <left> <right>");
        std::process::exit(1);
    }
    
    let left = Path::new(&args[1]);
    let right = Path::new(&args[2]);
    
    // Get the common parent directory
    let parent = left.parent().expect("left has no parent");
    
    // Verify right has the same parent
    if right.parent() != Some(parent) {
        eprintln!("Error: left and right don't have the same parent directory");
        std::process::exit(1);
    }
    
    // Launch helix with the parent directory
    let status = std::process::Command::new("hx")
        .arg("--vsplit")
        .arg(parent)
        .status()
        .expect("Failed to launch hx");
    
    std::process::exit(status.code().unwrap_or(1));
}