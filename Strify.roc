interface Strify
    exposes [ strify ]
    imports []


strify = \x ->
    when x is
        Num y -> Num.toStr y
        Str y -> y
