# TP2 XSLT et XPath

## Exercice 1. XSL et Recette

Nous allons appliquer une mise en forme de base au fichier XML suivant :

```xml
<?xml version="1.0" encoding="ISO-8859-1" ?>
<recette>
  <entete>
    <auteur>Casimir</auteur>
    <titre>Recette du Gloubi-Boulga</titre>
    <remarque>Pour une personne</remarque>
  </entete>
  <procedure>
    Remplir un saladier avec de la confiture de fraises, du chocolat râpé, des bananes écrasées, de la moutarde, des saucisses de Toulouse écrasées tièdes mais crues.
    Mélanger vigoureusement jusqu'à obtenir une bouillie marron-clair. Il est normal qu'il y ait des grumeaux. Les proportions sont environ égales pour tous les ingrédients,
    mais il est possible de varier selon les goûts de chacun.
  </procedure>
</recette>
```

1. Créer une feuille de style XSL permettant à partir de cette fiche recette de produire une page HTML qui :
   - a pour titre le contenu de la balise `titre` ;
   - commence par un titre `<h1>` ayant comme contenu le contenu de la balise `titre` ;
   - donne ensuite le nom de l'auteur de la recette ;
   - affiche ensuite "Remarque :" puis le contenu de la balise `remarque` ;
   - affiche "Procédure à suivre :" en niveau `<h2>` ;
   - puis dans un paragraphe, présente la procédure à suivre (contenu de `procedure`).


2. Évaluer la feuille de style à l'aide des commandes "Transform" de Exchanger XML, puis directement dans un navigateur web classique (Firefox ou IE).

---

## Exercice 2. XSL et Recette avec Ingrédients

Le fichier précédent est augmenté de la liste des ingrédients :

```xml
<?xml version="1.0" encoding="ISO-8859-1" ?>
<recette>
  <entete>
    <auteur>Casimir</auteur>
    <titre>Recette du Gloubi-Boulga</titre>
    <remarque>Pour une personne</remarque>
  </entete>
  <procedure>
    <texte>Remplir un saladier avec de la confiture de fraises, du chocolat râpé, des bananes écrasées, de la moutarde, des saucisses de Toulouse écrasées tièdes mais crues.</texte>
    <liste>
      <item>confiture de fraises</item>
      <item>chocolat râpé</item>
      <item>bananes écrasées</item>
      <item>moutarde forte</item>
      <item>saucisses de Toulouse écrasées tièdes mais crues</item>
    </liste>
    <texte>Mélanger vigoureusement jusqu'à obtenir une bouillie marron-clair. Il est normal qu'il y ait des grumeaux.</texte>
    <texte>Les proportions sont environ égales pour tous les ingrédients, mais il est possible de varier selon les goûts de chacun.</texte>
  </procedure>
</recette>
```

Reprendre l'exercice précédent, mais cette fois-ci en affichant dans la description une liste des ingrédients, puis les opérations à pratiquer.
Cette description devra être réalisée uniquement en utilisant des règles et sans recours à une boucle explicite (i.e. pas de `foreach`, `while`...).

Les listes (ingrédients et opérations) devront être numérotées par XSL, c'est-à-dire sans recours à la balise HTML `<ol>`.

**Aide :** XPath possède une fonction permettant de retourner le numéro du nœud courant dans la séquence des nœuds contextes. Elle peut donc être utilisée par XSLT dans un `value-of` par exemple.

---

## Exercice 3. XSL et Règles avec Modes

Pour pouvoir appliquer sur les mêmes nœuds des règles différentes en fonction de la situation, une solution consiste à utiliser des règles nommées qui sont ensuite appelées avec `<call-template>`.
Il est aussi possible d'associer un mode à une règle avec l'attribut `mode` :

```xml
<xsl:template match="TITRE" mode="TdM">
```
appelée avec :
```xml
<xsl:apply-templates mode="TdM">
``````
   

L'objectif de l'exercice est d'utiliser cette fonction pour générer au début du document résultat une table des matières constituée de liens vers les différentes parties du document.

1. Créer une feuille de style XSL permettant à partir du document XML de l'exercice DTD Annuaire du TP1 de produire une page HTML qui affiche correctement l'ensemble des informations sur les contacts ;
2. Compléter la feuille de style de manière à créer des ancres nommées au niveau des titres des contacts ;
3. Finalement, modifier la feuille de style afin d'insérer en début de document une liste de liens pointant sur les contacts.
4. Vérifier le résultat en produisant le fichier HTML final.

---

## Exercice 4. XPath et Les Films

L'objectif est d'interroger le document `films.xml` avec XPath. Le traitement à l'aide d'un fichier XSL permet d'accéder à certains nœuds de l'arbre XML en spécifiant leur chemin ("path"). Le document contient les descriptions XML de films. Extrait :

```xml
<?xml version="1.0" encoding="iso-8859-1"?> 
<films>
  <film titre='Alien'>
    <annee>1979</annee>
    <genre>Science-fiction</genre>
    <pays>USA</pays>
    <mes>Scott</mes>
    <roles>
      <role acteur='5'>Ripley</role>
    </roles>
  </film>
  <film titre='Titanic'>
    <annee>1997</annee>
    <genre>Drame</genre>
    <pays>USA</pays>
    <mes>Cameron</mes>
    <roles>
      <role acteur='109'>Rose DeWitt Bukater</role>
      <role acteur='110'>Jack Dawson</role>
    </roles>
  </film>
</films>
```

Pour cela, nous allons utiliser la barre XPath fournie par `Exchanger XML`, mais il est possible d'inclure un appel à Xpath dans une fonction javascript ou ailleurs.

Avec la console de visualisation (onglets "XPath results" dans la fenêtre des messages en bas), faites les recherches suivantes :

1. Affichez tous les titres de films : `//FILM/@titre`.
2. Affichez le genre du film "Seven".
3. Cherchez les titres de tous les drames.
4. Cherchez les titres de tous les films du même genre que le film "58 minutes pour vivre".
5. Trouvez les titres des films dramatiques (`GENRE='Drame'`) tournés par Hitchcock.
6. Affichez les films sans acteurs.
7. Quel est le dernier film du document ?
8. Quel est le film qui précède immédiatement le film "Vertigo" dans le document ?
9. Donnez les titres des films qui contiennent le caractère 'L' (conseil : la fonction `contains(str1, str2)` retourne `True` si `str1` contient la chaîne `str2`).
10. Trouvez les films qui n'ont que trois rôles (conseil : la fonction `count` permet d'obtenir le nombre de nœuds dans un ensemble).

**Conseil** : Le contenu de la fenêtre "XPath results" peut-être copié pour récapituler les résultats dans un fichier texte complet. Lors du "Collé" le contenu des noeuds sélectionné par l'expression XPath doivent apparaître.

---

## Exercice 5. XSL Avancé et les Planètes

Nous disposons d'un document XML décrivant les différentes planètes du système solaire :

```xml
<?xml version="1.0" encoding="ISO-8859-1" ?>
<systeme_solaire>
  <etoile>
    <nom>Soleil</nom>
    <type_spectral>G2</type_spectral>
    <age unit="milliard d'annees">5</age>
  </etoile>
  <planete type="tellurique">
    <nom>Mars</nom>
    <distance unit="UA">1.5</distance>
    <masse unit="masse terrestre">0.1</masse>
    <diametre unit="diamètre terrestre">0.5</diametre>
    <satellite>2</satellite>
  </planete>
  <planete type="gazeuse" anneau="yes">
    <nom>Saturne</nom>
    <distance unit="UA">9.6</distance>
    <masse unit="masse terrestre">95</masse>
    <diametre unit="diamètre terrestre">9.4</diametre>
    <satellite>18</satellite>
  </planete>
  <planete type="Kuiper">
    <nom>Pluton</nom>
    <distance unit="UA">39.4</distance>
    <masse unit="masse terrestre">0.002</masse>
    <diametre unit="diamètre terrestre">0.2</diametre>
    <satellite>1</satellite>
  </planete>
</systeme_solaire>
```

Pour commencer, se procurer le fichier `planetes.xml` et la `feuille de style` à compléter, puis :

1. Présenter les données sous la forme d'une liste donnant pour chaque planète son nom, sa distance par rapport au Soleil, sa masse et son diamètre, de manière à obtenir le résultat suivant. À effectuer de deux manières différentes :
   - En utilisant une règle de transformation, un template, et en l'appelant correctement dans la règle principale de la feuille de style avec `<xsl:apply-templates>`.
   - À l'aide d'une boucle `<xsl:for-each>`.
2. Ajouter à la distance, la masse et le diamètre, les unités employées (en récupérant la valeur de l'attribut `unit` pour chacun de ces éléments).
3. Effectuer pour chaque planète un test sur l'élément `satellite`. S'il existe, afficher le nombre de satellites.
4. Ne plus afficher les informations sur la Terre.
5. Classer les planètes (exceptée la Terre) par ordre décroissant de leur diamètre.
6. À l'aide de `<xsl:choose>`, faire un test sur le diamètre des planètes et afficher suivant le cas :
   - **SMALL** : si le diamètre est inférieur au diamètre moyen des planètes ;
   - **BIG** : si le diamètre est supérieur au diamètre moyen des planètes.
7. (facultatif) Afficher à présent une mention particulière pour les planètes dont la masse est supérieure à la moyenne des masses des planètes telluriques.
8. (facultatif) L'affichage des mesures des planètes (distance au soleil, masse, diamètre) doit maintenant être réalisé à l'aide d'une règle de transformation `montre_mesure` qui prend en paramètres la valeur et l'unité de la mesure.

Conseil : penser à consulter la documentation en ligne (par exemple http://www.w3.org/TR/xslt ou sa traduction en français sur yoyodesign)

---

© Sujet proposé par Fabrice Lefèvre, 2024.
