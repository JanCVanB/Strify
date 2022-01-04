interface TestBools
    exposes [ testBools ]
    imports [ Strify.{ strify } ]


testBools =
    failures = ""
        |> testFalse
        |> testTrue
    when failures is
        "" -> "✅ Strify works on Bools."
        f -> f

testFalse = \failures ->
    actual = strify (Bool False)
    expected = "False"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with False Bools!\n"

testTrue = \failures ->
    actual = strify (Bool True)
    expected = "True"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with True Bools!\n"
