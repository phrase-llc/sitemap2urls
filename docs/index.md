---
title: sitemap2urls
layout: default
---

## クイックスタート（Dockerのみで実行可能）

このツールは、WordPress の sitemap.xml から全てのURLを再帰的に取得します。  
Docker さえあれば、ローカル環境に Ruby をインストールする必要はありません。

### 使い方

`https://example.com/sitemap.xml` の部分を実際のURLに置き換えて実行してください。

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
docker build -t sitemap2urls .
docker run --rm sitemap2urls https://example.com/sitemap.xml > urls.txt
```

その他、使えるオプションや Ruby での実行方法については  
[GitHub の README（日本語）](https://github.com/phrase-llc/sitemap2urls/blob/main/README.ja.md) をご覧ください。

---

## Quick Start (Docker-only)

This tool recursively extracts all URLs from a WordPress `sitemap.xml`.  
No Ruby installation is required — Docker is enough.

### Usage Example

Replace `https://example.com/sitemap.xml` with the actual URL you want to fetch.

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
docker build -t sitemap2urls .
docker run --rm sitemap2urls https://example.com/sitemap.xml > urls.txt
```

For advanced options and local Ruby usage,  
please refer to the [README on GitHub](https://github.com/phrase-llc/sitemap2urls/blob/main/README.md).

---

## Credits
<a href="https://www.phrase-inc.com" target="_blank">
  <img src="logo-c.svg" alt="Phrase Inc." style="max-width: 480px;" />
</a>

Maintained by [Phrase Inc.](https://www.phrase-inc.com)  
Vectors and icons by <a href="https://www.svgrepo.com" target="_blank">SVG Repo</a>
