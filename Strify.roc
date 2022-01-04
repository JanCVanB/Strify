interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        ListListNum y -> strifyListListNum y
        ListListStr y -> strifyListListStr y
        ListNum y -> strifyListNum y
        ListStr y -> strifyListStr y
        Num y -> strifyNum y
        Str y -> strifyStr y

strifyList = \l ->
    l
        |> Str.joinWith ", "
        |> \s -> "[\(s)]"

strifyListListNum = \l ->
    l
        |> List.map strifyListNum
        |> strifyList

strifyListListStr = \l ->
    l
        |> List.map strifyListStr
        |> strifyList

strifyListNum = \l ->
    l
        |> List.map strifyNum
        |> strifyList

strifyListStr = \l ->
    l
        |> List.map strifyStr
        |> strifyList

strifyNum = \n -> Num.toStr n

strifyStr = \s -> "\"\(s)\""
