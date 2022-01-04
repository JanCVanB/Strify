interface TestNums
    exposes [ testNums ]
    imports [ Strify.{ strify } ]


testNums =
    failures = ""
        |> testZero
        |> testPositive
        |> testNegative
        # TODO: Test manually-typed numbers (U8, I8, etc.)
    when failures is
        "" -> "✅ Strify works on Nums."
        f -> f

testNegative = \failures ->
    actual = strify (Num -6)
    expected = "-6"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with negative Nums!\n"

testPositive = \failures ->
    actual = strify (Num 6)
    expected = "6"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with positive Nums!\n"

testZero = \failures ->
    actual = strify (Num 0)
    expected = "0"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with 0!\n"
