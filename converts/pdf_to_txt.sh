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

# pdf_to_png.shを呼び出してPDFをPNGに変換
./pdf_to_png.sh "$DIR"

# png_to_txt.shを呼び出してPNGをテキストに変換
./png_to_txt.sh "$DIR"
