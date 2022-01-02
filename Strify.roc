interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        Str y -> strifyStr y
        Num y -> strifyNum y

strifyStr = \s -> "\"\(s)\""

strifyNum = \n -> Num.toStr n

