<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>

<xsl:template name="title-text">/home/adrian</xsl:template>

<xsl:template match="data">

	<xsl:apply-templates select="projects-all/entry"/>

	<div class="last article project"> 
		...alle Quellen und ein paar andere Sachen befinden sich auf <a href="https://github.com/KnairdA/">Github</a> und <a href="http://code.kummerlaender.eu">cgit</a>
	</div>

</xsl:template>

<xsl:template match="projects-all/entry">
	<div class="article project"> 
		<p class="lpos"><img src="{$workspace}{./image/@path}/{./image/filename}" alt=""/></p>
		<h2><xsl:text disable-output-escaping="yes"><![CDATA[&raquo;&nbsp;]]></xsl:text> <a href="{./link}"><xsl:value-of select="./name"/></a></h2>
		<xsl:copy-of select="content/node()"/>
	</div>
</xsl:template>

</xsl:stylesheet>
