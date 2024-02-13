#!/bin/bash

# 出力ファイル
output_file="lsof_output_amane.txt"

# ssh名
ssh="amane"

# リモートマシン上でlsofを実行し、結果をファイルに追記
ssh "$ssh" lsof >> "$output_file"

# ファイルに書き込まれた行数（つまり、開かれているファイルの数）を表示
file_count=$(wc -l < "$output_file")
echo "open file number: $file_count"
echo "open file number: $file_count" >> "$output_file"