use crossterm::event::{read, KeyCode, KeyEvent};

fn main() {
    loop {
        if let Ok(event) = read() {
            match event {
                crossterm::event::Event::Key(key_event) => {
                    if let KeyCode::Char(c) = key_event.code {
                        println!("{} key pressed", c);
                    }
                }
                _ => (),
            }
        }
    }
}
