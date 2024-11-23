xquery version "1.0";
<xml>
    {
    let $films := doc("TP3.1/films.xml")
    let $artistes := doc("TP3.1/artistes.xml")
    return for $acteur in distinct-values($films//ROLE/@acteur)
    return <ACTEUR>
        <NOM>
            {
                let $artiste := $artistes//ARTISTE[@ID = $acteur]
                return concat($artiste/PRENOM, " ", $artiste/NOM)
            }
        </NOM>
        <FILMS>
            {
                for $film in $films//FILM[ROLES/ROLE/@acteur = $acteur]
                return <FILM titre="{$film/@titre}"/>
            }
        </FILMS>
    </ACTEUR>
    }
</xml>
