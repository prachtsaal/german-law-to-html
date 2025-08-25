#!/bin/bash

# Download German Cooperative Law (GenG - Genossenschaftsgesetz)
# from gesetze-im-internet.de

set -e

echo "Downloading German Cooperative Law (GenG) XML..."

# Download the ZIP file containing the XML
curl -o geng.zip "https://www.gesetze-im-internet.de/geng/xml.zip"

echo "Extracting XML file..."

# Extract the XML file
unzip -o geng.zip

# Find the XML file (it has a different name than expected)
XML_FILE=$(find . -name "*.xml" -maxdepth 1 | head -1)

if [ -z "$XML_FILE" ]; then
    echo "Error: No XML file found after extraction!"
    exit 1
fi

XML_BASENAME=$(basename "$XML_FILE")

# Remove the ZIP file
rm geng.zip

echo "Done! XML file extracted as $XML_BASENAME"
echo ""
echo "To convert to HTML:"
echo "  xsltproc ../german-law-to-html.xslt $XML_BASENAME > geng.html"
echo ""
echo "To convert to Markdown:"
echo "  xsltproc ../german-law-to-markdown.xslt $XML_BASENAME > geng.md"