<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/master.xsl"/>
<xsl:include href="../utilities/date-time.xsl"/>
<xsl:include href="../utilities/ninja.xsl" />
<xsl:include href="../utilities/clean-comment-markup.xsl"/>

<xsl:template name="title-text"><xsl:value-of select="data/articles-single/entry/title"/> @ /home/adrian</xsl:template>

<xsl:template match="data">

<xsl:apply-templates select="articles-single/entry"/>

<div class="comments">
	<h3><a name="kommentare">Kommentare:</a></h3>
		<xsl:choose>
			<xsl:when test="comments-article/error">
				<div class="nocomments">Dieser Artikel wurde bisher kommentarlos so stehen gelassen.</div>
			</xsl:when>
			<xsl:otherwise>
				<ol><xsl:apply-templates select="comments-article/entry"/></ol>
			</xsl:otherwise>
		</xsl:choose>
	<h3><a name="kommentieren">Frage, Anmerkung oder Kritik?</a></h3>
</div>

<form id="comment_form" method="post" action="#kommentieren" enctype="multipart/form-data">
	<p>
		<label>Name: </label><input name="fields[author]" type="text" /><br/>
		<label>Webseite: </label><input name="fields[website]" type="text" /><br/>
		<xsl:value-of select="events/spamquestion/part1"/> + <xsl:value-of select="events/spamquestion/part2"/> = <input name="fields[number]" type="text"/>

		<input name="fields[article]" type="hidden" value="{articles-single/entry/title}" />
		<textarea name="fields[comment]" rows="5" cols="100"></textarea><br/>
		<span class="markupinfo">Direktes verwenden von HTML Tags im Text ist nicht erlaubt - es steht jedoch eine Teilmenge von Markdown zur Formatierung zu Verfügung.</span><br/>
		<input name="action[add-comment]" type="submit" value="Kommentieren" />
		<xsl:if test="events/add-comment/@result = 'error'">
		<br/><strong>Fehler:</strong> Bitte fülle alle Felder aus.
		</xsl:if>
		<xsl:if test="events/add-comment/@result = 'success'">
		<br/><strong>Hinweis:</strong> Vielen Dank für Deinen Kommentar, er wurde erfolgreich gespeichert. Ich werde ihn so schnell wie möglich freischalten. 
		</xsl:if>

		<input name="fields[check1]" type="hidden" value="{events/spamquestion/honey1}" />
                <input name="fields[check2]" type="hidden" value="{events/spamquestion/honey2}" />
                <input name="fields[spam]" type="hidden" value="{events/spamquestion/check}" />
	</p>
</form>

</xsl:template>

<xsl:template match="articles-single/entry">
	<div class="article">
		<xsl:call-template name="article_tmpl"/>
	</div>
</xsl:template>

<xsl:template match="comments-article/entry">
	<li>
		<span class="info">Geschrieben am <xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date"/>
						<xsl:with-param name="format" select="'x. M Y'"/>
					</xsl:call-template> von 
					<xsl:choose>
						<xsl:when test="website">
							<a href="{website}"><xsl:value-of select="author"/></a>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="author"/>
						</xsl:otherwise>
					</xsl:choose>
		</span><br/>  
		<xsl:apply-templates select="comment/* | comment/text()" mode="html"/>
	</li>
</xsl:template>

<xsl:template name="article_tmpl">
	<h2>» <a href="{$root}/artikel/{title/@handle}"><xsl:value-of select="title"/></a></h2>
		<p class="info">
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="date"/>
				<xsl:with-param name="format" select="'x. M Y'"/>
			</xsl:call-template> | <xsl:for-each select="tags/item"><a href="{$root}/tag/{.}"><xsl:value-of select="." /></a>&#160; </xsl:for-each> | <xsl:value-of select="author"/>
			<xsl:choose>
				<xsl:when test="@comments != 0">
					| <a href="#kommentare"><xsl:value-of select="@comments"/> 
					<xsl:choose><xsl:when test="@comments = 1"> Kommentar</xsl:when><xsl:otherwise> Kommentare</xsl:otherwise></xsl:choose></a>
				</xsl:when>
				<xsl:otherwise>
					| <a href="#kommentieren">Kommentieren</a>
				</xsl:otherwise>
			</xsl:choose>
		</p>
	<xsl:copy-of select="content/node()"/>
</xsl:template>

</xsl:stylesheet>
