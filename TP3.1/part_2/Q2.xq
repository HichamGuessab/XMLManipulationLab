xquery version "1.0";
for $film in //FILM[@titre = "Le retour du Jedi"]
return <annee>{data($film/ANNEE)}</annee>