<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/date-time.xsl"/>

<xsl:template name="title-text">/home/adrian</xsl:template>

<xsl:template match="data">
	<div class="archiv left articlelist archivlist">   
		Alle mit &#187;<xsl:value-of select="params/tag-name"/>&#171; ausgezeichneten Artikel:
		<ol>
			<xsl:apply-templates select="articles-tag/entry"/>
		</ol>
	</div>
</xsl:template>

<xsl:template match="articles-tag/entry">

<li>
	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="date"/>
		<xsl:with-param name="format" select="'x. M Y'"/>
	</xsl:call-template> » <a href="{$root}/artikel/{title/@handle}"><xsl:value-of select="title"/></a>   </li>

</xsl:template>

</xsl:stylesheet>
