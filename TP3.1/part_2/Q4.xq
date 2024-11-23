xquery version "1.0";
<xml>
    {
    for $film in //FILM[GENRE = "Drame" and MES = "Hitchcock"]
    return <film titre="{data($film/@titre)}">
        <annee>{data($film/ANNEE)}</annee>
    </film>
    }
</xml>