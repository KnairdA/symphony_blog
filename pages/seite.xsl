<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/date-time.xsl"/>
<xsl:include href="../utilities/pagination.xsl"/>

<xsl:template match="data">

	<xsl:apply-templates select="articles-page/entry"/>

	<div id="pagination">
		<xsl:call-template name="pagination">
			<xsl:with-param name="pagination" select="articles-page/pagination" />
			<xsl:with-param name="display-number" select="'2'" />
			<xsl:with-param name="pagination-url" select="'/seite/$'" />
			<xsl:with-param name="label-previous" select="'&#171; neuere'" />
			<xsl:with-param name="label-next" select="'ältere &#187;'" />
		</xsl:call-template>
	</div>
</xsl:template>

<xsl:template match="articles-page/entry">
	<xsl:choose>
		<xsl:when test="position()!= last()">
			<div class="article">
				<xsl:call-template name="article_tmpl"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="last article">
				<xsl:call-template name="article_tmpl"/>
			</div>
		</xsl:otherwise>  
	</xsl:choose>     
</xsl:template>

<xsl:template name="article_tmpl">
	<h2>» <a href="{$root}/artikel/{title/@handle}"><xsl:value-of select="title"/></a></h2>
	<p class="info">
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" select="date"/>
			<xsl:with-param name="format" select="'x. M Y'"/>
		</xsl:call-template> | <xsl:for-each select="tags/item"><a href="{$root}/tag/{@handle}"><xsl:value-of select="." /></a>&#160; </xsl:for-each> | <xsl:value-of select="author"/>
		<!--<xsl:choose><xsl:when test="@comments &gt; 0">| Kommentare: <xsl:value-of select="@comments"/></xsl:when></xsl:choose>-->
	</p>
	<xsl:copy-of select="content/node()"/>
</xsl:template>

</xsl:stylesheet>
