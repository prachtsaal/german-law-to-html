# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a set of XSLT transformation tools specifically designed for German legal documents. The project contains stylesheets that transform XML files following the German law schema into HTML or Markdown formats suitable for translation and processing.

## Core Architecture

The project consists of two XSLT transformation stylesheets:
- `german-law-to-html.xslt` - Transforms XML to clean HTML format
- `german-law-to-markdown.xslt` - Transforms XML to Markdown text format
- Input: XML files containing German legal documents (following the gesetze-im-internet.de schema)  
- Output: Clean HTML or Markdown files with preserved structure

## Common Commands

### Transform XML to HTML
```bash
xsltproc german-law-to-html.xslt law.xml > law.html
```

### Transform XML to Markdown
```bash
xsltproc german-law-to-markdown.xslt law.xml > law.md
```

Both transformations preserve the document structure while outputting in their respective formats.

### Prerequisites
- `xsltproc` must be installed on the system

## XSLT Structure

The stylesheet handles the following XML document structure:
- `/dokumente` - Root element containing legal document metadata and content
- `norm` elements - Individual sections/articles of law
- `metadaten` - Metadata including titles, section numbers, and classification
- `textdaten` - The actual legal text content with footnotes
- `gliederungseinheit` - Structural divisions (parts, chapters)

Key transformations:
- Document metadata becomes HTML headers or Markdown headings with title and subtitle
- Legal sections become HTML sections with h3 headings or Markdown ## headings
- Structured lists (DL elements) become ordered lists (HTML) or numbered lists (Markdown)
- Footnotes are preserved in dedicated containers or sections

## Example Usage

The `example/` folder contains a practical example:
- `download-geng.sh` - Script to download German Cooperative Law (GenG) XML from gesetze-im-internet.de
- Run `./download-geng.sh` to download and extract `geng.xml`
- Then convert using the stylesheets as shown in the commands above

## Purpose

This tool is used by Prachtsaal (a German art cooperative) to convert German legal texts into a format suitable for machine translation, helping international members understand relevant German law in English.