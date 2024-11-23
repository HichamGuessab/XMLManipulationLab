xquery version "1.0";
<xml>
{
    for $genre in distinct-values(//FILM/GENRE)
    let $count := count(//FILM[GENRE = $genre])
    return <genre name="{data($genre)}" count="{$count}"/>
}
</xml>