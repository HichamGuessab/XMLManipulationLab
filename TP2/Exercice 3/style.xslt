<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/annuaire">
        <html lang="fr">
            <head>
                <title>Annuaire</title>
            </head>
            <body>
                <h1>Annuaire</h1>
                <h2>Table des matières</h2>
                <ul>
                    <xsl:apply-templates select="personne" mode="table-matiere"/>
                    <xsl:apply-templates select="societe" mode="table-matiere"/>
                </ul>
                <h2>Contacts</h2>
                <xsl:apply-templates select="personne"/>
                <xsl:apply-templates select="societe"/>
            </body>
        </html>
    </xsl:template>

    <!-- Opération sur valeurs, pour table des matières -->
    <xsl:template match="personne" mode="table-matiere">
        <li>
            <a href="#{normalize-space(concat('personne-', nom))}">
                <xsl:value-of select="concat(prenom, ' ', nom)"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="societe" mode="table-matiere">
        <li>
            <a href="#{normalize-space(concat('societe-', nom_societe))}">
                <xsl:value-of select="nom_societe"/>
            </a>
        </li>
    </xsl:template>


    <!-- Affichage personne et societe -->
    <xsl:template match="personne">
        <div id="{normalize-space(concat('personne-', nom))}">
            <h2><xsl:value-of select="concat(prenom, ' ', nom)"/></h2>
            <p>Email : <xsl:value-of select="email"/></p>
            <p>Téléphone : <xsl:value-of select="telephone_personnel"/></p>
            <p>Activité : <xsl:value-of select="activite"/></p>
        </div>
    </xsl:template>

    <xsl:template match="societe">
        <div id="{normalize-space(concat('societe-', nom_societe))}">
            <h2><xsl:value-of select="nom_societe"/></h2>
            <p>Adresse : <xsl:value-of select="branche/adresse"/></p>
            <p>Téléphone : <xsl:value-of select="branche/telephone_branche"/></p>
            <p>Jours de fermeture : <xsl:value-of select="branche/@jours_fermeture"/></p>
            <p>Année d'ouverture : <xsl:value-of select="branche/@annee_d_ouverture"/></p>
            <p>Directeur : <xsl:value-of select="info_directeur/@nom"/></p>
            <p>Email du directeur : <xsl:value-of select="info_directeur/@email"/></p>
            <p>Avis : <xsl:value-of select="avis"/></p>
        </div>
    </xsl:template>
</xsl:stylesheet>
