interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        Str y -> strifyStr y
        Num y -> strifyNum y
        List y -> strifyList y

strifyList = \l ->
    l
        |> List.map strifyStr
        |> Str.joinWith ", "
        |> \s -> "[\(s)]"

strifyNum = \n -> Num.toStr n

strifyStr = \s -> "\"\(s)\""
