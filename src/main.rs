use std::collections::HashMap;
use std::process::Command;

fn main() {
    println!("Hello, world!");

    setup_dirs();
    
}

fn setup_dirs() {
    let mut package_dirs: HashMap<String, Vec<&str>> = HashMap::new();
    package_dirs.insert("api".to_string(), Vec::from(["controller", "dto"]));
    package_dirs.insert("business".to_string(), Vec::from(["mapper", "service"]));
    package_dirs.insert("config".to_string(), Vec::from(["global"]));
    package_dirs.insert("data".to_string(), Vec::from(["entity", "repository"]));
    package_dirs.insert("exception".to_string(), Vec::from(["advice", "dto"]));

    for (parent, children) in package_dirs.iter() {
        println!("Currently working with: {}", parent);

        let output = Command::new("mkdir")
            .arg()

        for el in children {
            println!("{}", el);
        }
    }


}
