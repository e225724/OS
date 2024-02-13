package main

import (
	"log"
	"sync"
	"time"
)

const concurrency = 2 // 最大同時並列実行数

func main() {
	doTask()
}

func doTask() {
	// バッファ付きチャンネル
	semaphoreCh := make(chan struct{}, concurrency)
	// 全てのゴールーチンの実行完了を知らせる
	doneCh := make(chan struct{})
	// 処理対象
	numbers := []int{1, 2, 3, 4, 5, 6}
	// ゴルーチンを同期させ、セマフォで同時実行
	go func() {
		var wg sync.WaitGroup
		for _, num := range numbers {
			wg.Add(1)
			go func(n int) {
				defer wg.Done()
				// リソースの確保
				semaphoreCh <- struct{}{}
				defer func() {
					// リソースの解放
					<-semaphoreCh
				}()
				printNum(n)
			}(num)
		}
		// 全てのgoroutineの実行が終わるまで待つ
		wg.Wait()
		close(doneCh)
	}()

	// doneChが閉じられるまで待つ
	<-doneCh
	close(semaphoreCh)
}

func printNum(n int) {
	log.Println("exec", n)
	// 処理をわかりやすくするため
	second := 5 * time.Second
	time.Sleep(second)
	log.Printf("executed num: %d \n", n)
}
