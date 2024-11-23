<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/recette">
        <html lang="fr">
            <head>
                <title>
                    <xsl:value-of select="entete/titre"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="entete/titre"/>
                </h1>
                <p>
                    <strong>Auteur : </strong>
                    <xsl:value-of select="entete/auteur"/>
                </p>
                <p>
                    <strong>Remarque : </strong>
                    <xsl:value-of select="entete/remarque"/>
                </p>
                <h2>Procédure à suivre :</h2>
                <p>
                    <xsl:value-of select="procedure"/>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>