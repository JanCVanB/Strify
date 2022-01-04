interface TestNums
    exposes [ testNums ]
    imports [ Strify.{ strify }, Test.{ test } ]


testNums =
    failures = ""
        |> testZero
        |> testPositive
        |> testNegative
        # TODO: Test manually-typed numbers (U8, I8, etc.)
    when failures is
        "" -> "✅ Strify works on Nums."
        f -> f

testNegative =
    expectation = strify (Num -6) == "-6"
    otherwise = "\n🚨 Strify does not work with negative Nums!\n"
    test expectation otherwise

testPositive =
    expectation = strify (Num 6) == "6"
    otherwise = "\n🚨 Strify does not work with positive Nums!\n"
    test expectation otherwise

testZero =
    expectation = strify (Num 0) == "0"
    otherwise = "\n🚨 Strify does not work with 0!\n"
    test expectation otherwise
