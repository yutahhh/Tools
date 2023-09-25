Google Cloud Speech-to-Text APIを使用して、リアルタイムで音声をテキストに変換します

---

# Google Speech-to-Text Transcriber

マイクからの音声入力をリアルタイムでテキストに変換し、結果をファイルに保存するPythonスクリプトです。Google Cloud Speech-to-Text APIを使用しています。

## 前提条件

- Pythonがインストールされていること
- Google Cloud Speech-to-Text APIのアクセス許可と認証情報が設定されていること
- 必要なライブラリがインストールされていること。以下のコマンドでインストールできます。

```sh
pip install google-cloud-speech pyaudio six
```

## 使用方法

1. Google Cloudのプロジェクトをセットアップし、Speech-to-Text APIを有効にします。
2. サービスアカウントキーを生成し、`service-account.json`としてgoogle-speechディレクトリに保存します。

```sh
python transcribe.py
```

3. プログラムが実行されている間に話し始めます。
4. `recs/output.txt`ファイルを開いて、変換されたテキストを確認します。

※ Ctrl+Dで終了

## 注意事項

- このコードは、1チャンネル（モノラル）オーディオのみをサポートしています。
- 音声データは、`RATE`と`CHUNK`のパラメータに基づいてストリーム化されます。これらの値を変更することで、音声データの取得頻度を調整できます。