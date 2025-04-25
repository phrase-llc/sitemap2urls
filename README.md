# sitemap2urls

https://phrase-llc.github.io/sitemap2urls/

A CLI tool to recursively fetch all URLs from a WordPress `sitemap.xml`.

WordPress often provides a sitemap index that links to other sitemaps (e.g., `post-sitemap.xml`, `page-sitemap.xml`).  
This tool recursively traverses those sitemaps and outputs all final URLs to standard output.

---

## Quick Start with Docker (Recommended)

You can run this tool using only Docker — no Ruby or Bundler installation required.

### 1. Clone this repository

```bash
git clone https://github.com/phrase-llc/sitemap2urls.git
cd sitemap2urls
```

### 2. Build the Docker image

```bash
docker build -t sitemap2urls .
```

### 3. Run the script

Replace `https://example.com/sitemap.xml` with the actual URL you want to fetch.

```bash
docker run --rm sitemap2urls https://example.com/sitemap.xml
```

To save the output to a file:

```bash
docker run --rm sitemap2urls https://example.com/sitemap.xml > urls.txt
```

To show fetching logs:

```bash
docker run --rm sitemap2urls --verbose https://example.com/sitemap.xml
```

To customize timeout settings:

```bash
docker run --rm sitemap2urls --open-timeout 5 --read-timeout 10 https://example.com/sitemap.xml
```

> See [Shared Options](#shared-options) for available command-line flags.

---

## Run with Ruby (If you have Ruby locally)

If you already have a local Ruby environment, you can run the script directly.

### Requirements

- Ruby 3.x or later
- Bundler (`gem install bundler`)

### Install dependencies

```bash
bundle install
```

### Basic usage

Replace `https://example.com/sitemap.xml` with the actual URL you want to fetch.

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml
```

To save the output to a file:

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml > urls.txt
```

### Common usage examples

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml
ruby sitemap2urls.rb --open-timeout 3 --read-timeout 5 https://example.com/sitemap.xml
ruby sitemap2urls.rb --verbose --open-timeout 5 https://example.com/sitemap.xml > urls.txt
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml > urls.txt 2> errors.log
```

> See [Shared Options](#shared-options) for available command-line flags.

---

## Shared Options

The following command-line options are available in both Docker and Ruby execution modes:

| Option                   | Description                                        |
|:-------------------------|:---------------------------------------------------|
| `--verbose`              | Print fetching logs to stderr                      |
| `--open-timeout SECONDS` | Set the connection timeout in seconds (default: 5) |
| `--read-timeout SECONDS` | Set the read timeout in seconds (default: 10)      |

---

## License

This project is licensed under the [MIT License](https://github.com/phrase-llc/sitemap2urls/blob/main/LICENSE).  
Maintained by [Phrase Inc.](https://www.phrase-inc.com)