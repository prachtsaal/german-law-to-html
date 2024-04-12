<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/dokumente">
    <xsl:variable name="title" select="norm[position() = 1]/metadaten/kurzue"/>
    <xsl:variable name="subtitle" select="norm[position() = 1]/metadaten/langue"/>
    <html>
      <head>
        <meta charset="UTF-8"/>
        <title><xsl:value-of select="$title"/> - <xsl:value-of select="$subtitle"/></title>
        <style>
          ol.list-alpha {
            list-style-type: lower-alpha;
          }
          ol.list-a-alpha {
            list-style-type: lower-alpha;
          }
        </style>
      </head>
      <body>
        <header>
          <h1><xsl:value-of select="$title"/></h1>
          <h1 class="subtitle"><xsl:value-of select="$subtitle"/></h1>
          <xsl:apply-templates select="norm[position() = 1]/textdaten/fussnoten/Content"/>
        </header>
        <xsl:apply-templates select="norm[not(metadaten/enbez = 'Inhaltsübersicht') and not(position() = 1)]"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="norm[metadaten/gliederungseinheit]">
    <section class="part-header">
      <xsl:for-each select="metadaten/gliederungseinheit">
        <h2>
          <xsl:value-of select="gliederungsbez"/>
        </h2>
        <h2 class="subtitle"><xsl:value-of select="gliederungstitel"/></h2>
      </xsl:for-each>
    </section>
  </xsl:template>

  <xsl:template match="norm">
    <section class="section">
      <h3>
        <xsl:value-of select="metadaten/enbez"/><xsl:text> </xsl:text><xsl:value-of select="metadaten/titel"/>
      </h3>
      <xsl:apply-templates select="textdaten/text/Content"/>
      <xsl:if test="textdaten/fussnoten/node() or textdaten/fussnoten/@*">
        <div class="footnotes">
          <xsl:apply-templates select="textdaten/fussnoten/Content"/>
        </div>
      </xsl:if>
    </section>
  </xsl:template>

  <xsl:template match="Content">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="DL">
    <ol>
      <xsl:attribute name="class">list-<xsl:value-of select="@Type"/></xsl:attribute>
      <xsl:apply-templates/>
    </ol>
  </xsl:template>

  <xsl:template match="DT">

  </xsl:template>

  <xsl:template match="DD">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="LA">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="P">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="pre">
    <pre>
      <xsl:apply-templates/>
    </pre>
  </xsl:template>

  <xsl:template match="BR"><xsl:text>&#xa;</xsl:text></xsl:template>

</xsl:stylesheet>
