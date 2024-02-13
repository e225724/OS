#!/bin/bash

desktop_path="$HOME/Desktop"

# デスクトップ内の全てのファイルに対して処理
for file in "$desktop_path"/**/*
do
    if [ -f "$file" ]; then
        file_type=$(file -b "$file")
        echo "File: $file - Type: $file_type"
    fi
done
