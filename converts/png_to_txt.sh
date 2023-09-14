#!/bin/bash

# コマンドライン引数からディレクトリパスを取得
DIR="$1"

# 引数が指定されていない、または無効な場合はエラーメッセージを表示
if [ -z "$DIR" ]; then
  echo "Error: No directory specified."
  exit 1
fi

if [ ! -d "$DIR" ]; then
  echo "Error: Invalid directory specified."
  exit 1
fi

# 指定されたディレクトリに移動
cd "$DIR"

# PNGファイルの数をカウント
total_files=$(ls *.png 2> /dev/null | wc -l)
current_file=0

if [ $total_files -eq 0 ]; then
  echo "No PNG files found in the specified directory."
  exit 0
fi

# PNGファイルを一つずつ処理
for png in *.png; do
  # ファイル名から拡張子を除去
  filename=$(basename -- "$png")
  filename_noext="${filename%.*}"

  # OCRでテキストに変換
  tesseract "$png" "${filename_noext}.txt"

  if [ $? -eq 0 ]; then
    let current_file++
    echo "Converted $png to ${filename_noext}.txt ($current_file/$total_files)"
  else
    echo "Error converting $png"
  fi
done

echo "Conversion completed."
