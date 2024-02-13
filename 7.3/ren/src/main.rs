#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self -> {

    })
}

fn main() {
    let rect1 = Rectangle { width: 33, height: 50 };
    let rect2 = Rectangle { width: 10, height: 33 };
    let rect3 = Rectangle { width: 29, height: 91 };

    println!(
        "The area {} square pizels",
        rect1.area()
    )
}