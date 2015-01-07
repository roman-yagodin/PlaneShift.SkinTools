<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="html" />
	<xsl:template match="/widget_description">
		<html>
			<head>
				<title />
				<link rel="stylesheet" type="text/css" href="css/paws-default.css" />
			</head>
			<body>
				<div class="widget_description">
					<xsl:apply-templates />
				</div>
				<div class="screen screen-1024x768">1024x768</div>
				<div class="screen screen-1024x576">1024x576</div>
				<div class="screen screen-800x600">800x600</div>
				<div class="screen screen-640x480">640x480</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="widget">
		<div class="widget">
			<xsl:attribute name="name">
				<xsl:value-of select="@name" />
			</xsl:attribute>
			<xsl:attribute name="title">
				<xsl:value-of select="@name" />: <xsl:value-of select="title/@text" />
			</xsl:attribute>
			<xsl:attribute name="class">widget <xsl:if test="frame/@border='yes'">border</xsl:if></xsl:attribute>
			<xsl:attribute name="style">left:<xsl:value-of select="frame/@x" />px;top:<xsl:value-of select="frame/@y" />px;width:<xsl:value-of select="frame/@width" />px;height:<xsl:value-of select="frame/@height" />px;<xsl:if test="@visible='no' and count(ancestor::*) > 1">display:none;</xsl:if><xsl:if test="@alwaysontop='yes'">z-index:1000;</xsl:if>
			</xsl:attribute>
			<xsl:value-of select="@name" />
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<xsl:template match="widget/label">
		<span><xsl:value-of select="@text" /></span>
	</xsl:template>
	<xsl:template match="widget/text">
		<span><xsl:value-of select="@string" /></span>
	</xsl:template>
</xsl:stylesheet>
