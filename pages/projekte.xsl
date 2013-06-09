<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template match="data">

	<xsl:apply-templates select="projects-all/entry"/>

</xsl:template>

<xsl:template match="projects-all/entry">
	<xsl:choose>
		<xsl:when test="position()!= last()">
			<div class="article project"> 
				<p class="lpos"><img src="{$workspace}{./image/@path}/{./image/filename}" alt=""/></p>
				<h2><xsl:text disable-output-escaping="yes"><![CDATA[&raquo;&nbsp;]]></xsl:text> <a href="{./link}"><xsl:value-of select="./name"/></a></h2>
				<xsl:copy-of select="content/node()"/>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="last article project"> 
				<p class="lpos"><img src="{$workspace}{./image/@path}/{./image/filename}" alt=""/></p>
				<h2><xsl:text disable-output-escaping="yes"><![CDATA[&raquo;&nbsp;]]></xsl:text> <a href="{./link}"><xsl:value-of select="./name"/></a></h2>
				<xsl:copy-of select="content/node()"/>
			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
