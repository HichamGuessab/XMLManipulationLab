xquery version "1.0";
<xml>
    {
    let $films := doc("TP3.1/films.xml")
    let $artistes := doc("TP3.1/artistes.xml")
    for $acteur in distinct-values($films//ROLE/@acteur)
    let $count := count($films//ROLE[@acteur = $acteur])
    let $nom := $artistes//ARTISTE[@ID = $acteur]/NOM
    let $prenom := $artistes//ARTISTE[@ID = $acteur]/PRENOM
    where $count > 1
    return
    <acteur>
        <id>{$acteur}</id>
        <nom>{$prenom} {$nom}</nom>
        <films>{$count}</films>
    </acteur>
    }
</xml>