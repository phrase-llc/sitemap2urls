---
title: sitemap2urls
layout: default
---

## クイックスタート

WordPress の `sitemap.xml` からすべてのURLを再帰的に取得するツールです。  
ローカルに Ruby をインストールせずに、Docker Compose ですぐに使えます。

### 1. リポジトリをクローン

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
```

### 2. 依存ライブラリのインストール（初回のみ）

```bash
docker compose run --rm cli bundle install
```

### 3. スクリプトを実行

`https://example.com/sitemap.xml` の部分を実際のサイトの URL に置き換えて実行してください：

```bash
docker compose run --rm cli https://example.com/sitemap.xml > urls.txt
```

## 詳細はこちら

使えるオプションや Ruby での実行方法については  
[GitHub の README（日本語）](https://github.com/phrase-llc/sitemap2urls/blob/main/README.ja.md) をご覧ください。

---

## Quick Start (Docker Compose Recommended)

sitemap2urls is a CLI tool to recursively fetch all URLs from a WordPress `sitemap.xml`.  
You can run it instantly using Docker Compose — no need to install Ruby locally.

### 1. Clone the repository

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
```

### 2. Install dependencies (first time only)

```bash
docker compose run --rm cli bundle install
```

### 3. Run the script

Replace `https://example.com/sitemap.xml` with the actual URL of your sitemap:

```bash
docker compose run --rm cli https://example.com/sitemap.xml > urls.txt
```

## Learn More

For advanced options and local Ruby usage,  
please refer to the [README on GitHub](https://github.com/phrase-llc/sitemap2urls/blob/main/README.md).
