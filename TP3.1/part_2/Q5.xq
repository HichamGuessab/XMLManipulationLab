xquery version "1.0";
<xml>
    {
    for $film in //FILM[ROLES/ROLE[@acteur = 11]]
    return $film
    }
</xml>