<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="Shift_JIS" />
	<xsl:template match="/">
		<!-- TODO: Auto-generated template -->
		<html>
		<head>
		<title>住所録一覧</title>
		</head>
		<body>
		<h1>住所録一覧</h1>
		<table border="0">
			<tr style="background:#00ccff">
				<th>No.</th>
				<th>名前</th>
				<th>性別</th>
				<th>TEL</th>
				<th>住所</th>
			</tr>
			<xsl:for-each select="addbook/member">
				<tr style="background:#ffffcc">
					<td><xsl:value-of select="@id" /></td>
					<td><xsl:value-of select="name" /></td>
					<td><xsl:value-of select="gender" /></td>
					<td><xsl:value-of select="tel" /></td>
					<td><xsl:value-of select="address"/></td>
				</tr>
			</xsl:for-each>
		</table>
		</body>
		</html>
	</xsl:template>
</xsl:stylesheet>