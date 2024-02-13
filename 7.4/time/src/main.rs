use chrono::{DateTime, Local, TimeZone};

fn main() {
    // 現地のローカル時間を取得
    let local_time: DateTime<Local> = Local::now();
    println!("現地時間: {}", local_time);


    let japan_time: DateTime<chrono::FixedOffset> = Local::now().with_timezone(&chrono::FixedOffset::east(9 * 3600));
    println!("日本時間: {}", japan_time);
}