interface TestLists
    exposes [ testLists ]
    imports [ Strify.{ strify } ]


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

testEmptyList = \failures ->
    actual = strify (ListStr [])
    expected = "[]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work on empty Lists!\n"

testListOfListsOfNums = \failures ->
    actual = strify (ListListNum [[6], [6], [6]])
    expected = "[[6], [6], [6]]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work on Lists of Lists of Nums!\n"

testListOfListsOfStrs = \failures ->
    actual = strify (ListListStr [["6"], ["6"], ["6"]])
    expected = "[[\"6\"], [\"6\"], [\"6\"]]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work on Lists of Lists of Strs!\n"

testListOfNums = \failures ->
    actual = strify (ListNum [6, 6, 6])
    expected = "[6, 6, 6]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work on Lists of Nums!\n"

testListOfStrs = \failures ->
    actual = strify (ListStr ["6", "6", "6"])
    expected = "[\"6\", \"6\", \"6\"]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work on Lists of Strs!\n"
