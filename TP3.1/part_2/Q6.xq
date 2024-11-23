xquery version "1.0";
<xml>
    {
    for $film at $pos in //FILM
    where $film/@titre = "Léon"
    return //FILM[position() = $pos - 1]
    }
</xml>