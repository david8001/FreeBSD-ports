--- xsl/lists.mod.xsl.orig	2004-01-31 11:53:50.000000000 +0000
+++ xsl/lists.mod.xsl	2012-11-13 21:15:16.000000000 +0000
@@ -269,10 +269,8 @@
 		</doc:notes>
 	</doc:template>
 	<xsl:template match="varlistentry">
-		<xsl:param name="next.is.list">
-			<xsl:param name="object" select="listitem/*[1]"/>
-			<xsl:value-of select="count($object[self::itemizedlist or self::orderedlist or self::variablelist])"/>
-		</xsl:param>
+		<xsl:param name="object" select="listitem/*[1]"/>
+		<xsl:param name="next.is.list" select="count($object[self::itemizedlist or self::orderedlist or self::variablelist])"/>
 		<xsl:variable name="id">
 			<xsl:call-template name="label.id"/>
 		</xsl:variable>

