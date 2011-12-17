<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time-en.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">

<rss version="2.0">
	<channel>
		<title>/home/adrian</title>
		<link><xsl:value-of select="$root"/></link>
		<description>Artikel von AdrianK.redirectme.net</description>
		<generator>Symphony CMS</generator>

		<xsl:for-each select="data/articles-planet-feed/entry">
			<item>
				<title><xsl:value-of select="title"/></title>
				<link><xsl:value-of select="$root"/>/artikel/<xsl:value-of select="title/@handle"/></link>
				<description>
					<xsl:text disable-output-escaping="yes"><![CDATA[<]]></xsl:text><xsl:text disable-output-escaping="yes">![CDATA[</xsl:text>
						<xsl:copy-of select="content/node()"/>
					<xsl:text>]]</xsl:text><xsl:text disable-output-escaping="yes"><![CDATA[>]]></xsl:text>
				</description>
				<pubDate>
                                        <xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'w, d m Y T'"/>
					</xsl:call-template>
					<xsl:text>:00 </xsl:text>
					<xsl:value-of select="translate($timezone,':','')"/>
				</pubDate>
				<author>Adrian Kummerländer</author>
				<guid><xsl:value-of select="$root"/>/artikel/<xsl:value-of select="title/@handle"/></guid>
			</item>
		</xsl:for-each>        
	</channel>
</rss>

</xsl:template>

</xsl:stylesheet>
