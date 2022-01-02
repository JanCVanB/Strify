interface TestStrings
    exposes [ testStrings ]
    imports [ Strify.{ strify } ]


testStrings =
    failures = ""
        |> testEmpty
        |> testNonempty
    when failures is
        "" -> "✅ Strify works on strings."
        f -> f

testEmpty = \failures ->
    actual = strify (Str "")
    expected = ""
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with empty strings!\n"

testNonempty = \failures ->
    actual = strify (Str "Six")
    expected = "Six"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with nonempty strings!\n"
