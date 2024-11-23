xquery version "1.0";
<xml>
{
for $film in //FILM[GENRE = "Horreur"]
return <film>{data($film/@titre)}</film>
}
</xml>