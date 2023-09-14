# Tools

##  PDF to PNG Conversion Script

このスクリプトは、指定されたディレクトリ内のすべてのPDFファイルをPNGファイルに変換します。

### 依存関係

- ImageMagick: `convert` コマンドが必要です。

### インストール

#### ImageMagickのインストール

##### macOS

```
brew install imagemagick
```

##### Ubuntu

```
sudo apt-get install imagemagick
```

### 使い方

1. ターミナルを開きます。
2. スクリプトが保存されているディレクトリに移動します。
3. 次のコマンドを実行します。

```
bash your_script_name.sh /path/to/directory
```

ここで、`your_script_name.sh`はスクリプトの名前、`/path/to/directory`はPDFファイルが保存されているディレクトリのパスです。

#### オプション

- `/path/to/directory`: PDFファイルが保存されているディレクトリのパス。この引数は必須です。

#### 出力

- スクリプトは、各PDFファイルがPNGに変換された際に進捗を表示します。
- 変換が完了したら、元のPDFファイルは削除されます。
