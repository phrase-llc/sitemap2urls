# sitemap2urls

https://phrase-llc.github.io/sitemap2urls/

WordPressの `sitemap.xml` から、すべてのURLを再帰的に取得するツールです。

WordPressでは、最初の`sitemap.xml`に個別のサイトマップ（例：`post-sitemap.xml`、`page-sitemap.xml`）へのリンクが含まれていることが多く、このツールはそれらを辿って最終的なURLリストをすべて出力します。

---

## Docker を使った実行方法（推奨）

### 1. このリポジトリをクローン

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
```

### 2. Docker イメージをビルド

```bash
docker build -t sitemap2urls .
```

### 3. スクリプトを実行

`https://example.com/sitemap.xml` の部分を実際のURLに置き換えて実行してください。

```bash
docker run --rm sitemap2urls https://example.com/sitemap.xml
```

出力をファイルに保存したい場合：

```bash
docker run --rm sitemap2urls https://example.com/sitemap.xml > urls.txt
```

ログを表示したい場合：

```bash
docker run --rm sitemap2urls --verbose https://example.com/sitemap.xml
```

タイムアウト設定を変更したい場合：

```bash
docker run --rm sitemap2urls --open-timeout 5 --read-timeout 10 https://example.com/sitemap.xml
```

> ※ 使用可能なオプションについては、後述の「共通オプション一覧」を参照してください。

---

## Ruby での実行方法（ローカルに環境がある場合）

Ruby 環境がある場合は、通常の方法でスクリプトを実行できます。

### 必要環境

- Ruby 3.x 以降
- Bundler（`gem install bundler`）

### 依存ライブラリのインストール

```bash
bundle install
```

### スクリプトの実行

`https://example.com/sitemap.xml` の部分を実際のURLに置き換えて実行してください。

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml
```

標準出力をファイルに保存する場合：

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml > urls.txt
```

#### よく使う実行例

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml
ruby sitemap2urls.rb --open-timeout 3 --read-timeout 5 https://example.com/sitemap.xml
ruby sitemap2urls.rb --verbose --open-timeout 5 https://example.com/sitemap.xml > urls.txt
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml > urls.txt 2> errors.log
```

> ※ 使用可能なオプションについては、後述の「共通オプション一覧」を参照してください。

---

## 共通オプション一覧

以下のオプションは、Docker Compose でもローカルの Ruby 実行でも共通で使用できます。

| オプション               | 説明                     |
|:--------------------|:-----------------------|
| `--verbose`         | 処理中のURLを表示するログを出力      |
| `--open-timeout 秒数` | 接続タイムアウトを秒数で指定（例：5）    |
| `--read-timeout 秒数` | 読み取りタイムアウトを秒数で指定（例：10） |

---

## ライセンス

このプロジェクトは [MIT License](https://github.com/phrase-llc/sitemap2urls/blob/main/LICENSE) のもとで公開されています。  
[株式会社フレイズ](https://www.phrase-inc.com)
