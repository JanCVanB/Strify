interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        Bool y -> strifyBool y
        ListListBool y -> strifyListListBool y
        ListListNum y -> strifyListListNum y
        ListListStr y -> strifyListListStr y
        ListBool y -> strifyListBool y
        ListNum y -> strifyListNum y
        ListStr y -> strifyListStr y
        Num y -> strifyNum y
        Str y -> strifyStr y

strifyBool = \b ->
    if b then "True" else "False"

strifyList = \l ->
    l
        |> Str.joinWith ", "
        |> \s -> "[\(s)]"

strifyListListBool = \l ->
    l
        |> List.map strifyListBool
        |> strifyList

strifyListListNum = \l ->
    l
        |> List.map strifyListNum
        |> strifyList

strifyListListStr = \l ->
    l
        |> List.map strifyListStr
        |> strifyList

strifyListBool = \l ->
    l
        |> List.map strifyBool
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
