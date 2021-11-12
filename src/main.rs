use std::collections::HashMap;
use std::process::Command;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    println!("Creating required directories!");
    
    let target_dir: &String= &args[1];
    println!("Target directory for creating packages: {}", target_dir);
    setup_dirs(target_dir);
    
}

fn setup_dirs(target_dir: &String) {
    let mut package_dirs: HashMap<String, Vec<&str>> = HashMap::new();
    package_dirs.insert("api".to_string(), Vec::from(["controller", "dto"]));
    package_dirs.insert("business".to_string(), Vec::from(["mapper", "service", "service/impl"]));
    package_dirs.insert("config".to_string(), Vec::from(["global"]));
    package_dirs.insert("data".to_string(), Vec::from(["entity", "repository"]));
    package_dirs.insert("exception".to_string(), Vec::from(["advice"]));

    let mut mkdir = Command::new("mkdir").arg(target_dir).output().expect("failed to execute process");
    
    for (parent, children) in package_dirs.iter() {
        println!("Creating directory: {}", parent);

        let dir: String = target_dir.to_owned() + "/" + parent;
        
        mkdir = Command::new("mkdir")
            .arg(dir.clone())
            .output()
            .expect("failed to execute process");
        
        for child in children {
            let child_dir = dir.to_owned() + "/" + child; 
            mkdir = Command::new("mkdir")
            .arg(child_dir)
            .output()
            .expect("failed to execute process");
        
        }
    }

    println!("{:?}", mkdir.stdout);

}
