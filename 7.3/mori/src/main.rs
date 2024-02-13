use tokio::sync::mpsc;
use tokio::time::Duration;

#[tokio::main]
async fn main() {
    for _ in 0..5 {
        let (tx1, mut rx1) = mpsc::channel::<usize>(10);
        let (tx2, mut rx2) = mpsc::channel::<usize>(10);

        let task1 = tokio::spawn(async move {
            tokio::time::sleep(Duration::from_secs(1)).await; // Simulating a time-consuming task
            tx1.send(1).await.unwrap();
            tokio::time::sleep(Duration::from_secs(1)).await; // Simulating more work
            tx1.send(2).await.unwrap();
        });

        let task2 = tokio::spawn(async move {
            tokio::time::sleep(Duration::from_secs(2)).await; // Simulating a different duration
            tx2.send(3).await.unwrap();
            tx2.send(4).await.unwrap();
        });

        tokio::select! {
            val = rx1.recv() => {
                println!("recv 1, {:?}", val);
            },
            val = rx2.recv() => {
                println!("recv 2, {:?}", val);
            }
        }

        tokio::try_join!(task1, task2).unwrap(); // Wait for both tasks to complete

        println!("ループ終了");
    }
}
