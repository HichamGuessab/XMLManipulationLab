xquery version "1.0";
<xml>
    {
    let $films := doc("TP3.1/films.xml")
    let $artistes := doc("TP3.1/artistes.xml")
    for $acteur_id in distinct-values($films//ROLE/@acteur)
        let $nom := $artistes//ARTISTE[@ID = $acteur_id]/NOM
        let $prenom := $artistes//ARTISTE[@ID = $acteur_id]/PRENOM
        return <ACTEUR>
            <NOM>{$prenom} {$nom}</NOM>
            <FILMS>
                {
                    for $film in $films//FILM[ROLES/ROLE/@acteur = $acteur_id]
                    return <FILM titre="{$film/@titre}"/>
                }
            </FILMS>
        </ACTEUR>
    }
</xml>