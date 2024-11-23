xquery version "1.0";

let $book1 := //BOOKS/ITEM[TITLE = "Learn Java Now"]
let $book2 := //BOOKS/ITEM[TITLE = "Design Patterns"]
let $total := $book1/PRICE + $book2/PRICE
return
<html>
  <body>
    <h2>Facture</h2>
    <p>Livre 1 : { $book1/TITLE } = { $book1/PRICE } $</p>
    <p>Livre 2 : { $book2/TITLE } = { $book2/PRICE } $</p>
    <p><b>Total : </b> { $total } $</p>
  </body>
</html>
