xquery version "1.0";

<html>
{
  for $b in //BOOKS/ITEM
  where $b/QUANTITY > 0
  order by $b/PRICE descending
  return
  <div>
    <p style="color:yellow;"> { $b/TITLE } </p>
    <p style="color:blue;"> { $b/PRICE } </p>
  </div>
}
</html>
