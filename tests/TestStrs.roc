interface TestStrs
    exposes [ testStrs ]
    imports [ Strify.{ strify }, Test.{ test } ]


testStrs =
    failures = ""
        |> testEmptyStr
        |> testNonemptyStr
    when failures is
        "" -> "✅ Strify works on Strs."
        f -> f

testEmptyStr =
    expectation = strify (Str "") == "\"\""
    otherwise = "\n🚨 Strify does not work with empty Strs!\n"
    test expectation otherwise

testNonemptyStr =
    expectation = strify (Str "Six") == "\"Six\""
    otherwise = "\n🚨 Strify does not work with nonempty Strs!\n"
    test expectation otherwise
