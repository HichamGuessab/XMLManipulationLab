xquery version "1.0";
<xml>
    {
    let $films := doc("TP3.1/films.xml")
    let $artistes := doc("TP3.1/artistes.xml")
    for $mes in distinct-values($films//MES)
    let $nom := $artistes//ARTISTE[NOM = $mes]/NOM
    let $prenom := $artistes//ARTISTE[NOM = $mes]/PRENOM
    return <metteur-en-scene>
        <nom>{$prenom} {$nom}</nom>
        <films>
            {
                for $film in $films//FILM[MES = $mes]
                return <film titre="{$film/@titre}"/>
            }
        </films>
    </metteur-en-scene>
    }
</xml>