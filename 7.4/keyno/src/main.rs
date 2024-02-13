use std::fs::File;
use std::io::{self, Write};
use std::time::SystemTime;

fn main() {
    let mut file = File::create("keyrecord.txt")?;
    let start_time = Systemtime::now();

    loop {
        
    }
}       
