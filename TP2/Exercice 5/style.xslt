<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:variable name="diametre_moyen" select="sum(systeme_solaire/planete[nom != 'Terre']/diametre) div count(systeme_solaire/planete[nom != 'Terre']/diametre)"/>
    <xsl:template match="/">
        <html lang="fr">
            <head>
                <title>Les planètes</title>
            </head>
            <body>
                <!-- USING APPLY TEMPLATES = rendu_Q1_V1.html -->
                <!-- Le apply templates et l'implémentation la plus appropriée car elle permet une meilleure modularité,
                     une meilleure lisibilité et également une meilleure ré-utilisabilité qu'une boucle foreach -->
                <xsl:apply-templates select="systeme_solaire/planete[nom != 'Terre']">
                    <xsl:sort select="diametre" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="planete">
        <p>
            <b>
                <xsl:value-of select="nom"/> :
            </b>
        </p>
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
                <xsl:choose>
<!--                    &lt;	< (inférieur à)-->
<!--                    &gt;	> (supérieur à)-->
<!--                    &amp;	& (et commercial)-->
<!--                    &quot;	" (guillemets)-->
<!--                    &apos;	' (apostrophe)-->
                    <xsl:when test="diametre &lt; $diametre_moyen">
                        <xsl:text> SMALL</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> BIG</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </li>
            <xsl:if test="satellite">
                <li>Nombre de satellites:
                    <xsl:value-of select="satellite"/>
                </li>
            </xsl:if>
        </ul>
    </xsl:template>
</xsl:stylesheet>
