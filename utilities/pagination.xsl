<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="pagination">
	<xsl:param name="pagination" />
	<xsl:param name="pagination-url" />
	<xsl:param name="label-next" select="'&#187;'" />
	<xsl:param name="label-previous" select="'&#171;'" />
	<xsl:param name="class-next" select="'pagination-next'" />
	<xsl:param name="class-previous" select="'pagination-previous'" />
	<xsl:param name="class-disabled" select="'disabled'" />

	<!-- Only show pagination if there are more than one page -->
	<xsl:if test="$pagination/@total-pages &gt; 1">
		
		<!-- Current page -->
		<xsl:variable name="page-current">
			<xsl:choose>
				<xsl:when test="$pagination/@current-page = ''">1</xsl:when>
				<xsl:otherwise><xsl:value-of select="$pagination/@current-page" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
		<!-- Previous page -->
		<xsl:variable name="page-previous">
			<xsl:choose>
				<xsl:when test="$page-current = 1"><xsl:value-of select="$pagination/@total-pages" /></xsl:when>
				<xsl:otherwise><xsl:value-of select="$page-current - 1" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!-- Next page -->
		<xsl:variable name="page-next">
			<xsl:choose>
				<xsl:when test="$page-current = $pagination/@total-pages">1</xsl:when>
				<xsl:otherwise><xsl:value-of select="$page-current + 1" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<!-- Pagination -->
		
			<!-- Previous link -->
			<span>
					<xsl:if test="$page-next = 2">
						<xsl:attribute name="class">
							<xsl:value-of select="$class-disabled" />
						</xsl:attribute>
					</xsl:if>
					<a class="{$class-previous}">
						<xsl:if test="$page-next != 2">
							<xsl:attribute name="href">
								<xsl:call-template name="pagination-url-replace">
									<xsl:with-param name="string" select="$pagination-url" />
									<xsl:with-param name="search" select="'$'" />
									<xsl:with-param name="replace" select="string($page-previous)" />
								</xsl:call-template>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$label-previous" />
					</a>
			</span>
			<!-- Next link -->	
			<span>
					<xsl:if test="$page-next = 1">
						<xsl:attribute name="class">
							<xsl:value-of select="$class-disabled" />
						</xsl:attribute>
					</xsl:if>
					<a class="{$class-next}">
						<xsl:if test="$page-next != 1">
							<xsl:attribute name="href">
								<xsl:call-template name="pagination-url-replace">
									<xsl:with-param name="string" select="$pagination-url" />
									<xsl:with-param name="search" select="'$'" />
									<xsl:with-param name="replace" select="string($page-next)" />
								</xsl:call-template>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$label-next" />
					</a>
			</span>
	</xsl:if>
	
</xsl:template>

<!--
	PAGINATION URL
	Replace wildcard by page number
--> 
<xsl:template name="pagination-url-replace">
	<xsl:param name="string" />
	<xsl:param name="search" />
	<xsl:param name="replace" />

	<xsl:value-of select="concat(substring-before($string, $search), $replace, substring-after($string, $search))" />	
</xsl:template>


</xsl:stylesheet>