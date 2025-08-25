<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8" omit-xml-declaration="yes"/>

  <xsl:template match="/dokumente">
    <xsl:variable name="title" select="norm[position() = 1]/metadaten/kurzue"/>
    <xsl:variable name="subtitle" select="norm[position() = 1]/metadaten/langue"/>
    
    <xsl:text># </xsl:text>
    <xsl:value-of select="$title"/>
    <xsl:text>&#xa;&#xa;</xsl:text>
    
    <xsl:text>## </xsl:text>
    <xsl:value-of select="$subtitle"/>
    <xsl:text>&#xa;&#xa;</xsl:text>
    
    <xsl:apply-templates select="norm[position() = 1]/textdaten/fussnoten/Content"/>
    <xsl:if test="norm[position() = 1]/textdaten/fussnoten/Content">
      <xsl:text>&#xa;</xsl:text>
    </xsl:if>
    
    <xsl:apply-templates select="norm[not(metadaten/enbez = 'Inhaltsübersicht') and not(position() = 1)]"/>
  </xsl:template>

  <xsl:template match="norm[metadaten/gliederungseinheit]">
    <xsl:for-each select="metadaten/gliederungseinheit">
      <xsl:text>## </xsl:text>
      <xsl:value-of select="gliederungsbez"/>
      <xsl:text>&#xa;&#xa;</xsl:text>
      
      <xsl:text>### </xsl:text>
      <xsl:value-of select="gliederungstitel"/>
      <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="norm">
    <xsl:text>## </xsl:text>
    <xsl:value-of select="metadaten/enbez"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="metadaten/titel"/>
    <xsl:text>&#xa;&#xa;</xsl:text>
    
    <xsl:apply-templates select="textdaten/text/Content"/>
    
    <xsl:if test="textdaten/fussnoten/node() or textdaten/fussnoten/@*">
      <xsl:text>&#xa;### Footnotes&#xa;&#xa;</xsl:text>
      <xsl:apply-templates select="textdaten/fussnoten/Content"/>
    </xsl:if>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="Content">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="DL">
    <xsl:apply-templates/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="DT">
    <!-- Skip definition terms in markdown output -->
  </xsl:template>

  <xsl:template match="DD">
    <xsl:choose>
      <xsl:when test="../@Type = 'alpha' or ../@Type = 'a-alpha'">
        <xsl:text>   </xsl:text>
        <xsl:number count="DD" format="a"/>
        <xsl:text>. </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>   </xsl:text>
        <xsl:number count="DD" format="1"/>
        <xsl:text>. </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="LA">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="P">
    <xsl:apply-templates/>
    <xsl:text>&#xa;&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="pre">
    <xsl:text>```&#xa;</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>&#xa;```&#xa;&#xa;</xsl:text>
  </xsl:template>

  <xsl:template match="BR">
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>

</xsl:stylesheet>