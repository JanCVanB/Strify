interface TestLists
    exposes [ testLists ]
    imports [ Strify.{ strify } ]


# TODO: Is type inspection necessary to support arbitrary element types?
testLists =
    failures = ""
        |> testEmptyList
        |> testListOfStrings
        # |> testListOfNumbers
        # |> testListOfLists
    when failures is
        "" -> "✅ Strify works on lists of strings."
        f -> f

testEmptyList = \failures ->
    actual = strify (List [])
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

# testListOfNumbers = \failures ->
#     actual = strify (List [6, 6, 6])
#     expected = "[6, 6, 6]"
#     if actual == expected then
#         failures
#     else
#         Str.concat failures "\n🚨 Strify does not work with lists of numbers!\n"

testListOfStrings = \failures ->
    actual = strify (List ["6", "6", "6"])
    expected = "[\"6\", \"6\", \"6\"]"
    if actual == expected then
        failures
    else
        Str.concat failures "\n🚨 Strify does not work with lists of strings!\n"
