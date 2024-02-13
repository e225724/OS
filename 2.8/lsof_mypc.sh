#!/bin/bash

# 出力ファイル
output_file="lsof_output.txt"

# lsofコマンドを実行し、結果を書き込む
lsof >> "$output_file"

# ファイルに書き込まれた行数を読み取る
file_count=$(wc -l < "$output_file")
echo "open file number: $file_count"
echo "open file number: $file_count" >> "$output_file"
