# sitemap2urls

https://phrase-llc.github.io/sitemap2urls/

A CLI tool to recursively fetch all URLs from a WordPress `sitemap.xml`.

WordPress often provides a sitemap index that links to other sitemaps (e.g., `post-sitemap.xml`, `page-sitemap.xml`).  
This tool recursively traverses those sitemaps and outputs all final URLs to standard output.

---

## Run with Docker Compose (Recommended)

You can run this tool without installing Ruby locally by using Docker Compose.

### Requirements

- [Docker](https://www.docker.com/)
- Docker Compose v2+ (`docker compose` command available)

### Install dependencies

On first run, install dependencies such as Nokogiri:

```bash
docker compose run --rm cli bundle install
```

### Basic usage

```bash
docker compose run --rm cli https://example.com/sitemap.xml
```

To save the output to a file:

```bash
docker compose run --rm cli https://example.com/sitemap.xml > urls.txt
```

### Common usage examples

#### Show fetching logs:

```bash
docker compose run --rm cli --verbose https://example.com/sitemap.xml
```

#### Customize timeouts:

```bash
docker compose run --rm cli --open-timeout 3 --read-timeout 5 https://example.com/sitemap.xml
```

#### Combine options and save to file:

```bash
docker compose run --rm cli --verbose --open-timeout 5 https://example.com/sitemap.xml > urls.txt
```

#### Separate stdout and stderr:

```bash
docker compose run --rm cli --verbose https://example.com/sitemap.xml > urls.txt 2> errors.log
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

---
