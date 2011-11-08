<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="author" content="Adrian Kummerländer" />
	<meta name="description" content="Seite von Adrian Kummerländer über Linux, Open Source und anderes"/> 
	<meta name="robots" content="all"/>
	
	<title>adriank.redirectme.net</title>
	<link rel="stylesheet" type="text/css" href="{$workspace}/main.css" />
	<xsl:comment><![CDATA[[if lte IE 8]><link rel="stylesheet" type="text/css" href="]]><xsl:value-of select="$workspace"/><![CDATA[/dirty.css" /><![endif]]]></xsl:comment>
	
	<script type="text/javascript" src="{$workspace}/js/google-code-prettify/prettify.js"></script>
	<!--<link href="{$workspace}/js/google-code-prettify/obsidian.css" type="text/css" rel="stylesheet" />-->
	<link rel="shortcut icon" type="image/x-icon" href="{$root}/favicon.ico" /> 
	<meta name="google-site-verification" content="H-CBt2da-t_5xp0y1pA9l-IrRZymCFwizuyYKj3ufeA" />
</head>
<body onload="prettyPrint()">
	<div id="wrapper">
		<div id="content">
			<div id="nav_wrap">
				<h1>/home/adrian</h1>
				<ul>
					<li><a href="{$root}">Start</a></li>
					<li><a href="{$root}/archiv">Archiv</a></li>
					<li><a href="{$root}/seiten/projekte">Projekte</a></li>
					<li><a href="{$root}/seiten/kontakt">Kontakt</a></li>
					<li class="last_item"><a href="{$root}/rss">RSS</a></li>
				</ul>
			</div>

			<div id="main">
				<xsl:apply-templates />
			</div>

			<div id="footer_wrap">
				<div class="left articlelist">
					Verschiedene Artikel:
					<ol>
						<xsl:for-each select="data/articles-showcase/entry">
							<li><a href="{$root}/artikel/{title/@handle}"><xsl:value-of select="title"/></a></li>
						</xsl:for-each>
					</ol>
				</div>
				
				<div class="right taglist">
					Schlagwörter:
					<xsl:call-template name="tag-cloud">
						<xsl:with-param name="tags" select="data/section-schema[@handle='articles']/*[name()='tags']//option"/>
					</xsl:call-template>
				</div>
			</div>
			
			<div id="last_line">
				<a href="http://symphony-cms.com/">Gemacht mit Symphony</a>
				<ul>
					<li><a href="{$root}/seiten/kontakt">Kontakt</a></li>
					<li class="last_item"><a href="{$root}/rss">RSS</a></li>
				</ul>	
			</div>
		</div>
	</div>
</body>
</html>

</xsl:template>

<xsl:template name="tag-cloud">
	<xsl:param name="tags"/>
	<ul>
		<xsl:for-each select="$tags">
			<li>
				<a href="{$root}/tag/{@handle}">
					<xsl:value-of select="." />
				</a>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

</xsl:stylesheet>
