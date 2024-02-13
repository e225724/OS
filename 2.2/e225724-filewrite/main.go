package main

import (
	"bufio"
	"fmt"
	"os"
	"time"
)

func main() {
	// 書き込むファイルサイズとbufferedサイズのリスト
	var fileSizes []int
	for i := 0; i <= 9000; i += 16 {
		fileSizes = append(fileSizes, i)
	}
	bufferSizes := []int{2, 4, 8, 64, 512, 4096, 32768}

	// bufferedなしのファイル毎の処理
	for _, fileSize := range fileSizes {
		// ファイルパスの作成
		filePathWrite := fmt.Sprintf("./output/output_file_no_%d.txt", fileSize)
		filePathTime := fmt.Sprintf("./data/no_time.log")

		// ファイルを開く
		file, err := os.Create(filePathWrite)
		if err != nil {
			fmt.Printf("Error creating file %s: %v\n", filePathWrite, err)
			return
		}
		defer file.Close()

		// 時間の測定開始
		startTime := time.Now()

		// 指定されたファイルサイズに達するまでデータ書き込み
		for writtenSize := 0; writtenSize < fileSize; writtenSize += 1 {
			_, err := file.WriteString(generateRandomString(1))
			if err != nil {
				fmt.Printf("Error writing to file %s: %v\n", filePathWrite, err)
				return
			}
		}

		// 時間の測定を終了
		elapsedTime := time.Since(startTime)

		// 経過時間をファイルに書き込む
		timeFile, err := os.OpenFile(filePathTime, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
		if err != nil {
			fmt.Printf("Error opening time file %s: %v\n", filePathTime, err)
			return
		}
		defer timeFile.Close()

		_, err = timeFile.WriteString(fmt.Sprintf("%d %d\n", elapsedTime.Nanoseconds(), fileSize))
		if err != nil {
			fmt.Printf("Error writing to time file %s: %v\n", filePathTime, err)
			return
		}
	}

	// bufferedありのファイル毎の処理
	for _, fileSize := range fileSizes {
		for _, bufferSize := range bufferSizes {
			// ファイルのパスを生成
			filePathWrite := fmt.Sprintf("./output/output_file_%d_%d.txt", bufferSize, fileSize)
			filePathTime := fmt.Sprintf("./data/%d_time.log", bufferSize)

			// ファイルを開く
			file, err := os.Create(filePathWrite)
			if err != nil {
				fmt.Printf("Error creating file %s: %v\n", filePathWrite, err)
				return
			}
			defer file.Close()

			// Buffered Writerを作成
			osWriter := bufio.NewWriterSize(file, bufferSize)
			defer osWriter.Flush()

			// 時間の測定を開始
			startTime := time.Now()

			// 指定されたファイルサイズに達するまでデータを書き込み
			for writtenSize := 0; writtenSize < fileSize; writtenSize += 1 {
				_, err := osWriter.WriteString(generateRandomString(1))
				if err != nil {
					fmt.Printf("Error writing to file %s: %v\n", filePathWrite, err)
					return
				}
			}

			// 時間の測定を終了
			elapsedTime := time.Since(startTime)

			// 経過時間をファイルに書き込む
			timeFile, err := os.OpenFile(filePathTime, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
			if err != nil {
				fmt.Printf("Error opening time file %s: %v\n", filePathTime, err)
				return
			}
			defer timeFile.Close()

			_, err = timeFile.WriteString(fmt.Sprintf("%d %d\n", elapsedTime.Nanoseconds(), fileSize))
			if err != nil {
				fmt.Printf("Error writing to time file %s: %v\n", filePathTime, err)
				return
			}
		}
	}
}

// 指定されたサイズのランダムな文字列を生成
func generateRandomString(size int) string {
	charset := "abcdefghijklmnopqrstuvwxyz"
	result := make([]byte, size)
	for i := range result {
		result[i] = charset[i%len(charset)]
	}
	return string(result)
}