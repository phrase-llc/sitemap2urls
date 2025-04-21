# sitemap2urls

https://github.com/phrase-llc/sitemap2urls

Fetch all URLs from a WordPress sitemap.xml recursively.

WordPress's sitemap.xml usually contains an index of other sitemap files (e.g., `post-sitemap.xml`, `page-sitemap.xml`).  
This tool recursively follows sitemap indexes and outputs all final URLs.

---

## Usage

```bash
ruby sitemap2urls.rb [options] https://example.com/sitemap.xml
```

### Options

| Option | Description |
|:---|:---|
| `--verbose` | Show "Fetching: URL" logs |
| `--open-timeout SECONDS` | Set open timeout (default: 5 seconds) |
| `--read-timeout SECONDS` | Set read timeout (default: 10 seconds) |

### Examples

Basic usage (only output URLs):

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml
```

Verbose mode (show fetching logs):

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml
```

Save URLs to a file:

```bash
ruby sitemap2urls.rb https://example.com/sitemap.xml > urls.txt
```

Separate stdout and stderr:

```bash
ruby sitemap2urls.rb --verbose https://example.com/sitemap.xml > urls.txt 2> errors.log
```

---

## License

This project is licensed under the [MIT License](LICENSE).

---
