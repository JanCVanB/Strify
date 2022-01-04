interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        Bool y -> strifyBool y
        DictBoolBool y -> strifyDictNumNum y
        DictBoolNum y -> strifyDictNumStr y
        DictBoolStr y -> strifyDictNumStr y
        DictNumBool y -> strifyDictNumBool y
        DictNumNum y -> strifyDictNumNum y
        DictNumStr y -> strifyDictNumStr y
        DictStrBool y -> strifyDictStrBool y
        DictStrNum y -> strifyDictStrNum y
        DictStrStr y -> strifyDictStrStr y
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

strifyDict = \strifyKey, strifyValue ->
    \d =>
        d
            |> Dict.walk [] \l, k, v ->
                kStr = strifyKey k
                vStr = strifyValue v
                List.append l "\(kStr) => \(vStr)"
            |> Str.joinWith ", "
            |> \s -> if s == "" then "{::}" else "{: \(s) :}"

strifyDictBoolBool = strifyDict strifyBool strifyBool

strifyDictBoolNum = strifyDict strifyBool strifyNum

strifyDictBoolStr = strifyDict strifyBool strifyStr

strifyDictNumBool = strifyDict strifyNum strifyBool

strifyDictNumNum = strifyDict strifyNum strifyNum

strifyDictNumStr = strifyDict strifyNum strifyStr

strifyDictStrBool = strifyDict strifyStr strifyBool

strifyDictStrNum = strifyDict strifyStr strifyNum

strifyDictStrStr = strifyDict strifyStr strifyStr

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
