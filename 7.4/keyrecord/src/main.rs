use std::fs::File;
use std::io::{self, Write};
use std::time::{SystemTime, Duration};

fn main() -> io::Result<()> {
    let mut file = File::create("keyrecord.txt")?;

    loop {
        let start_time = SystemTime::now();

        // Get keyboard input and record it
        // ...

        let end_time = SystemTime::now();
        let elapsed_time = match end_time.duration_since(start_time) {
            Ok(duration) => duration,
            Err(e) => {
                eprintln!("Error calculating elapsed time: {}", e);
                continue; // Skip the rest of the loop iteration on error
            }
        };

        // Record timing information
        if let Err(e) = writeln!(file, "{:?}", elapsed_time) {
            eprintln!("Error writing to file: {}", e);
            break; // Exit the loop on file write error
        }
    }

    Ok(())
}
