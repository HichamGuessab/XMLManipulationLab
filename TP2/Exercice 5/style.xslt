<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="fr">
            <head>
                <title>Les planètes</title>
            </head>
            <body>
                <!-- USING APPLY TEMPLATES = rendu_V1.html -->
                <!-- Le apply templates et l'implémentation la plus appropriée car elle permet une meilleure modularité,
                     une meilleure lisibilité et également une meilleure ré-utilisabilité qu'une boucle foreach -->
                <xsl:apply-templates select="systeme_solaire/planete"/>

                <!-- USING FOREACH = rendu_V2.html -->
<!--                <xsl:for-each select="systeme_solaire/planete">-->
<!--                    <p>-->
<!--                        <b><xsl:value-of select="nom"/> :</b>-->
<!--                    </p>-->
<!--                    <ul>-->
<!--                        <li>Distance au soleil:-->
<!--                            <xsl:value-of select="distance"/>-->
<!--                        </li>-->
<!--                        <li>Masse:-->
<!--                            <xsl:value-of select="masse"/>-->
<!--                        </li>-->
<!--                        <li>Diamètre:-->
<!--                            <xsl:value-of select="diametre"/>-->
<!--                        </li>-->
<!--                    </ul>-->
<!--                </xsl:for-each>-->
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
                <xsl:value-of select="distance/@unit"/>
            </li>
            <li>Masse:
                <xsl:value-of select="masse"/>
                <xsl:value-of select="masse/@unit"/>
            </li>
            <li>Diamètre:
                <xsl:value-of select="diametre"/>
                <xsl:value-of select="diametre/@unit"/>
            </li>
        </ul>
    </xsl:template>
</xsl:stylesheet>
