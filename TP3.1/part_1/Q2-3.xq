xquery version "1.0";

<xml>
{
    let $categories := data(distinct-values(//BOOKS/ITEM/@CAT))
    return
        for $c in $categories
        let $books := //BOOKS/ITEM[@CAT=$c]
        return
        <category>
            <name>{$c}</name>
            <stock>{sum($books/QUANTITY)}</stock>
        </category>
    }
</xml>
