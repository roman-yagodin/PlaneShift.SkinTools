<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="html" />
	<xsl:template match="/image_list">
		<html>
			<head>
				<title />
				<link rel="stylesheet" type="text/css" href="css/paws-imagelist.css" />
			</head>
			<body>
				<div class="image_list">
					<xsl:apply-templates />
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="image">
		<div class="image">
			<xsl:attribute name="resource">
				<xsl:value-of select="@resource" />
			</xsl:attribute>
			<div class="image_label"><xsl:value-of select="@resource" /></div>
			<div class="image_icon">
				<xsl:attribute name="style">background-image:url('<xsl:value-of select="substring(@file,17)" />');background-position:-<xsl:value-of select="texturerect/@x" />px -<xsl:value-of select="texturerect/@y" />px;width:<xsl:value-of select="texturerect/@width" />px;height:<xsl:value-of select="texturerect/@height" />px;</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="@resource" />
				</xsl:attribute>
			</div>
			<xsl:apply-templates />
		</div>
	</xsl:template>
</xsl:stylesheet>
