<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="widget.xslt" />
	<xsl:import href="imagelist.xslt" />
	<xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="html" />
	<xsl:template match="/">
		<html>
			<head>
				<title />
				<link rel="stylesheet" type="text/css" href="pst/css/common.css" />
				<link rel="stylesheet" type="text/css" href="pst/css/widget.css" />
				<link rel="stylesheet" type="text/css" href="pst/css/imagelist.css" />
			</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
