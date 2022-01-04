interface TestLists
    exposes [ testLists ]
    imports [ Strify.{ strify } ]


testLists =
    failures = ""
        |> testEmptyList
        |> testListOfStrings
        |> testListOfNumbers
        # |> testListOfLists
    when failures is
        "" -> "✅ Strify works on lists."
        f -> f

testEmptyList = \failures ->
    actual = strify (ListStr [])
    expected = "[]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with empty lists!\n"

# testListOfLists = \failures ->
#     actual = strify (List [[6], [6], [6]])
#     expected = "[[6], [6], [6]]"
#     if actual == expected then
#         failures
#     else
#         Str.concat failures "\n🚨 Strify does not work with lists of lists!\n"

testListOfNumbers = \failures ->
    actual = strify (ListNum [6, 6, 6])
    expected = "[6, 6, 6]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with lists of numbers!\n"

testListOfStrings = \failures ->
    actual = strify (ListStr ["6", "6", "6"])
    expected = "[\"6\", \"6\", \"6\"]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with lists of strings!\n"
