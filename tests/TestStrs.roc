interface TestStrs
    exposes [ testStrs ]
    imports [ Strify.{ strify } ]


testStrs =
    failures = ""
        |> testEmptyStr
        |> testNonemptyStr
    when failures is
        "" -> "✅ Strify works on Strs."
        f -> f

testEmptyStr = \failures ->
    actual = strify (Str "")
    expected = "\"\""
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with empty Strs!\n"

testNonemptyStr = \failures ->
    actual = strify (Str "Six")
    expected = "\"Six\""
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with nonempty Strs!\n"
