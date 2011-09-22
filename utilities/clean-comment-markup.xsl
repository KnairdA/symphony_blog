<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Clean comment markup (allow only {br, p, a, strong, em, blockquote, pre/code} -->

<xsl:template match="br" mode="html">
	<br/>
</xsl:template>

<xsl:template match="p" mode="html">
	<p><xsl:apply-templates select="* | text()" mode="html"/></p>
</xsl:template>
 
<xsl:template match="blockquote" mode="html">
	<blockquote><xsl:apply-templates select="* | text()" mode="html"/></blockquote>
</xsl:template>

<xsl:template match="pre" mode="html">
	<pre class="prettyprint"><xsl:apply-templates select="code" mode="html"/></pre>
</xsl:template>

<xsl:template match="code" mode="html">
	<xsl:value-of select="text()"/>
</xsl:template>

<xsl:template match="a" mode="html">
	<a href="{@href}"><xsl:value-of select="."/></a>
</xsl:template>

<xsl:template match="strong" mode="html">
	<strong><xsl:value-of select="."/></strong>
</xsl:template>

<xsl:template match="em" mode="html">
	<em><xsl:value-of select="."/></em>
</xsl:template>

<xsl:template test="not(p) and not(a) and not(br) and not(strong) and not(em) and not(blockquote) and not(pre/code)" mode="html">
	<!-- do nothing -->
</xsl:template>

</xsl:stylesheet>
