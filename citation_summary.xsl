<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
  <head>
<title>My papers and citations</title>
 <style>
a { 
    color: blue;
}
</style>
</head>
  <body style="font-family:sans-serif;">
  <h2><xsl:value-of select="records/@retrieved"/> papers, <xsl:value-of select="records/@citations"/> citations</h2>
Sorted by total citations. Starred papers contribute to H-index
  <xsl:apply-templates/>
  </body>
</html>
</xsl:template>

<xsl:template match="records">
<xsl:for-each select="record">
<p>
  <h4>
    <xsl:number format="1. "/>
    <xsl:value-of select="title"/>
     <xsl:choose>
    <xsl:when test="position() div citations &lt;= 1">*</xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
</xsl:choose>
  </h4>
  <p><xsl:for-each select="author">
    <i><xsl:value-of select="."/></i>, 
  </xsl:for-each></p>
  <xsl:value-of select="pubdate"/> -- <a href="{link[@type='ABSTRACT']/url}"><xsl:value-of select="bibcode"/></a>
  <xsl:if test="citations>0">
    -- <a href="{link[@type='CITATIONS']/url}"><xsl:value-of select="citations"/> citations</a>
    <xsl:variable name="citeplot">
<xsl:value-of select="concat('http://adsabs.harvard.edu/cgi-bin/nph-ref_history?refs=CITATIONS&#38;bibcode=',bibcode,'&#38;start_nr=-1')"/>
    </xsl:variable>
    -- <a href="{$citeplot}">Citation history</a>
  </xsl:if>
 <xsl:variable name="readplot">
<xsl:value-of select="concat('http://adsabs.harvard.edu/cgi-bin/nph-ref_history?refs=AR&#38;bibcode=',bibcode,'&#38;start_nr=-1')"/>
    </xsl:variable>
    -- <a href="{$readplot}">Read history</a>
</p>
<hr/>
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
