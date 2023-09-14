# PDFからTXTへの変換ツール

## 概要

このリポジトリは、PDFファイルをテキストファイルに変換するためのシェルスクリプトを含んでいます。変換は2つの主要なステップ、すなわちPDFをPNGに変換し、その後PNGをテキストに変換するステップで行われます。

## 前提条件

- ImageMagick（PDFからPNGへの変換用）
- Tesseract（PNGからTXTへの変換用）

これらはmacOSにHomebrewを用いて以下のようにインストールできます。

```bash
brew install imagemagick tesseract
```

## スクリプトの配置

各シェルスクリプトはルートディレクトリ（`Tools`）内の`converts/`ディレクトリにいます。

### `converts/pdf_to_png.sh`

このスクリプトは指定したディレクトリ内の全てのPDFファイルをPNGに変換します。元のPDFファイルは削除されます。

**使い方：**

```bash
./converts/pdf_to_png.sh /path/to/your/directory
```

### `converts/png_to_txt.sh`

このスクリプトは指定したディレクトリ内の全てのPNGファイルをテキストファイルに変換します。1つのPNGファイルに対して1つの`.txt`ファイルが生成されます。

**使い方：**

```bash
./converts/png_to_txt.sh /path/to/your/directory
```

### `converts/pdf_to_txt.sh`

このスクリプトは、`pdf_to_png.sh`と`png_to_txt.sh`を連続して実行し、PDFファイルをテキストファイルへ完全に変換します。

**使い方：**

```bash
./converts/pdf_to_txt.sh /path/to/your/directory
```

## 権限について

もしスクリプトが実行できない場合は、以下のコマンドで実行権限を付与してください。

```bash
chmod +x converts/pdf_to_png.sh converts/png_to_txt.sh converts/pdf_to_txt.sh
```
