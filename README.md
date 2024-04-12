# german-law-to-html

A script converting German law in XML format to minimal HTML.

## Why?

Prachtsaal is a non-profit art cooperative registered in Germany. However, the majority of our international members
speaks rather English then German. For this reason we need to translate relevant German law and all the documents to
English, the law on cooperative societies in the first place:

https://www.gesetze-im-internet.de/geng/

This website provides the text of the cooperative law in multiple formats, however none of them is suitable as a
source for machine translation, while preserving the formatting.

The [german-law-to-html.xslt](german-law-to-html.xslt) comes to the rescue. It will produce the simplest possible
HTML with basic formatting out of the supplied XML file (according to the German law XML schema). 

## Usage

1. Install `xsltproc`
2. Run `xsltproc german-law-to-html.xslt law.xml >law.html`
