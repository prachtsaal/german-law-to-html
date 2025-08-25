# german-law-to-html

XSLT stylesheets for converting German legal documents from XML to HTML or Markdown format, optimized for machine translation.

## Purpose

[Prachtsaal](https://prachtsaal.org) is a non-profit art cooperative from Berlin. Since most of our international members speak English rather than German, we need to translate relevant German laws and documents—particularly the [Cooperative Societies Act (GenG)](https://www.gesetze-im-internet.de/geng/).

While the official website provides legal texts in multiple formats, none are well-suited for machine translation while preserving document structure and formatting.

## What This Does

These XSLT stylesheets transform German law XML files (following the [gesetze-im-internet.de schema](https://www.gesetze-im-internet.de/)) into clean, translation-ready formats:

- **[german-law-to-html.xslt](german-law-to-html.xslt)** → Clean HTML with semantic structure and minimal CSS
- **[german-law-to-markdown.xslt](german-law-to-markdown.xslt)** → Plain text Markdown with proper heading hierarchy

**Choose HTML when:** You need styled output for web display or rich text processing  
**Choose Markdown when:** You need plain text for translation tools or documentation systems

## Prerequisites

Install `xsltproc` (part of libxslt):

```bash
# macOS
brew install libxslt

# Ubuntu/Debian
sudo apt-get install xsltproc

# RHEL/CentOS/Fedora
sudo yum install libxslt
```

## Quick Start

1. **Get a German law XML file** (see [Complete Example](#complete-example) below)
2. **Convert to your preferred format:**

```bash
# HTML conversion
xsltproc german-law-to-html.xslt your-law.xml > output.html

# Markdown conversion  
xsltproc german-law-to-markdown.xslt your-law.xml > output.md
```

## Complete Example

Download and convert the German Cooperative Law:

```bash
cd example
./download-geng.sh
```

The script will output something like:
```
Done! XML file extracted as BJNR000550889.xml

To convert to HTML:
  xsltproc ../german-law-to-html.xslt BJNR000550889.xml > geng.html

To convert to Markdown:
  xsltproc ../german-law-to-markdown.xslt BJNR000550889.xml > geng.md
```

Just copy and run the suggested commands:

```bash
# Generate both formats
xsltproc ../german-law-to-html.xslt BJNR000550889.xml > geng.html
xsltproc ../german-law-to-markdown.xslt BJNR000550889.xml > geng.md
```

## What You Get

**HTML Output:**
- Semantic HTML5 structure with `<section>`, `<header>`, etc.
- Proper heading hierarchy (h1, h2, h3)
- Ordered lists with appropriate CSS classes
- Minimal inline CSS for list styling

**Markdown Output:**
- Standard Markdown syntax
- Proper heading hierarchy (#, ##, ###)
- Numbered lists for legal provisions
- Code blocks for preformatted content

## Troubleshooting

**"failed to load external entity" warnings:** These DTD warnings are harmless—the conversion will still work correctly.

**Empty output files:** Check that your XML file is valid and follows the gesetze-im-internet.de schema.

**"xsltproc: command not found":** Install libxslt (see [Prerequisites](#prerequisites)).

## License

GPL v3 - See [LICENSE](LICENSE) for details.
