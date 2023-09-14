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

# PDFファイルの数をカウント
total_files=$(ls *.pdf 2> /dev/null | wc -l)
current_file=0

if [ $total_files -eq 0 ]; then
  echo "No PDF files found in the specified directory."
  exit 0
fi

# PDFファイルを一つずつ処理
for pdf in *.pdf; do
  # ファイル名から拡張子を除去
  filename=$(basename -- "$pdf")
  filename_noext="${filename%.*}"

  # PNGに変換
  convert -density 300 "$pdf" "$filename_noext.png"

  # 変換に成功したら元のPDFを削除
  if [ $? -eq 0 ]; then
    rm "$pdf"
    let current_file++
    echo "Converted $pdf to $filename_noext.png ($current_file/$total_files)"
  else
    echo "Error converting $pdf"
  fi
done

echo "Conversion completed."
