use tokio::sync::mpsc;

async fn select(sleep_a: u64, sleep_b: u64) -> usize {
    let (tx1, mut rx1) = mpsc::channel::<usize>(10);
    let (tx2, mut rx2) = mpsc::channel::<usize>(10);

    tokio::spawn(async move {
        tokio::time::sleep(tokio::time::Duration::from_millis(sleep_a)).await;
        tx1.send(1).await.unwrap();
    });

    tokio::spawn(async move {
        tokio::time::sleep(tokio::time::Duration::from_millis(sleep_b)).await;
        tx2.send(2).await.unwrap();
    });

    let val = tokio::select! {
        val = rx1.recv() => {
            val
        },
        val = rx2.recv() => {
            val
        }
    };

    val.unwrap_or_default()
}

#[tokio::main]
async fn main() {
    // selectでsleepする時間を決める。
    let result = select(1, 2).await;
    println!("Final result: {:?}", result);
}

