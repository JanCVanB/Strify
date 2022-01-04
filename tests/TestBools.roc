interface TestBools
    exposes [ testBools ]
    imports [ Strify.{ strify }, Test.{ test } ]


testBools =
    failures = ""
        |> testFalse
        |> testTrue
    when failures is
        "" -> "✅ Strify works on Bools."
        f -> f

testFalse =
    expectation = strify (Bool False) == "False"
    otherwise = "\n🚨 Strify does not work on False Bools!\n"
    test expectation otherwise

testTrue =
    expectation = strify (Bool True) == "True"
    otherwise = "\n🚨 Strify does not work on True Bools!\n"
    test expectation otherwise
