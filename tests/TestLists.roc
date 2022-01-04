interface TestLists
    exposes [ testLists ]
    imports [ Strify.{ strify }, Test.{ test } ]


testLists =
    failures = ""
        |> testEmptyList
        |> testListOfStrs
        |> testListOfNums
        |> testListOfListsOfStrs
        |> testListOfListsOfNums
    when failures is
        "" -> "✅ Strify works on Lists."
        f -> f

testEmptyList = 
    expectation = strify (ListStr []) == "[]"
    otherwise = "\n🚨 Strify does not work on empty Lists!\n"
    test expectation otherwise

testListOfListsOfNums =
    expectation = strify (ListListNum [[6], [6], [6]]) == "[[6], [6], [6]]"
    otherwise = "\n🚨 Strify does not work on Lists of Lists of Nums!\n"
    test expectation otherwise

testListOfListsOfStrs =
    expectation = strify (ListListStr [["6"], ["6"], ["6"]]) == "[[\"6\"], [\"6\"], [\"6\"]]"
    otherwise = "\n🚨 Strify does not work on Lists of Lists of Strs!\n"
    test expectation otherwise

testListOfNums =
    expectation = strify (ListNum [6, 6, 6]) == "[6, 6, 6]"
    otherwise = "\n🚨 Strify does not work on Lists of Nums!\n"
    test expectation otherwise

testListOfStrs =
    expectation = strify (ListStr ["6", "6", "6"]) == "[\"6\", \"6\", \"6\"]"
    otherwise = "\n🚨 Strify does not work on Lists of Strs!\n"
    test expectation otherwise
