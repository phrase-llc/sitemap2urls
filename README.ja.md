# sitemap2urls

https://github.com/phrase-llc/sitemap2urls

WordPressの `sitemap.xml` から、すべてのURLを再帰的に取得するツールです。

WordPressでは、最初の`sitemap.xml`に個別のサイトマップ（例：`post-sitemap.xml`、`page-sitemap.xml`）へのリンクが含まれていることが多く、このツールはそれらを辿って最終的なURLリストをすべて出力します。

---

## 使い方

```bash
ruby sitemap2urls.rb [オプション] https://example.com/sitemap.xml
```

### オプション

| オプション | 説明 |
|:---|:---|
| `--verbose` | 「Fetching: URL」ログを表示する |
| `--open-timeout 秒数` | 接続タイムアウトを設定する（デフォルト5秒） |
| `--read-timeout 秒数` | 読み取りタイムアウトを設定する（デフォルト10秒） |

### 使用例

基本的な使い方（URLのみを出力）:

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml
```

ログも表示する場合:

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml
```

URLをファイルに保存する場合:

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml > urls.txt
```

標準出力と標準エラー出力を分離する場合:

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml > urls.txt 2> errors.log
```

---

## ライセンス

このプロジェクトは [MIT License](LICENSE) の下でライセンスされています。

---
