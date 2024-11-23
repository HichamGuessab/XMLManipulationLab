<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="fr">
            <head>
                <title>Les planètes</title>
            </head>
            <body>
                <xsl:apply-templates select="systeme_solaire/planete"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="planete">
        <p><b>
            <xsl:value-of select="nom"/> :
        </b></p>
        <ul>
            <li>Distance au soleil:
                <xsl:value-of select="distance"/>
            </li>
            <li>Masse:
                <xsl:value-of select="masse"/>
            </li>
            <li>Diamètre:
                <xsl:value-of select="diametre"/>
            </li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
