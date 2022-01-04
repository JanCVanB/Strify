interface TestDicts
    exposes [ testDicts ]
    imports [ Strify.{ strify }, Test.{ test } ]


testDicts =
    failures = ""
        |> testEmptyDict
        |> testDictOfBoolToBool
        |> testDictOfBoolToNum
        |> testDictOfBoolToStr
        |> testDictOfNumToBool
        |> testDictOfNumToNum
        |> testDictOfNumToStr
        |> testDictOfStrToBool
        |> testDictOfStrToNum
        |> testDictOfStrToStr
    when failures is
        "" -> "✅ Strify works on Dicts."
        f -> f

testEmptyDict =
    expectation = strify (DictStrStr {::}) == "{::}"
    otherwise = "\n🚨 Strify does not work on empty Dicts!\n"
    test expectation otherwise

testDictOfBoolToBool =
    expectation = strify (DictBoolBool {: True => False, False => True :}) == "{: True => False, False => True :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Bool to Bool!\n"
    test expectation otherwise

testDictOfBoolToNum =
    expectation = strify (DictBoolNum {: True => 7, False => 8 :}) == "{: True => 7, False => 8 :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Bool to Num!\n"
    test expectation otherwise

testDictOfBoolToStr =
    expectation = strify (DictBoolStr {: True => "A", False => "B" :}) == "{: True => \"A\", False => \"B\" :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Bool to Str!\n"
    test expectation otherwise

testDictOfNumToBool =
    expectation = strify (DictNumBool {: 1 => True, 2 => False, 3 => True :}) == "{: 1 => True, 2 => False, 3 => True :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Num to Bool!\n"
    test expectation otherwise

testDictOfNumToNum =
    expectation = strify (DictNumNum {: 1 => 7, 2 => 8, 3 => 9 :}) == "{: 1 => 7, 2 => 8, 3 => 9 :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Num to Num!\n"
    test expectation otherwise

testDictOfNumToStr =
    expectation = strify (DictNumStr {: 1 => "A", 2 => "B", 3 => "C" :}) == "{: 1 => \"A\", 2 => \"B\", 3 => \"C\" :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Num to Str!\n"
    test expectation otherwise

testDictOfStrToBool =
    expectation = strify (DictStrBool {: "a" => True, "b" => False, "c" => True :}) == "{: \"a\" => True, \"b\" => False, \"c\" => True :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Str to Bool!\n"
    test expectation otherwise

testDictOfStrToNum =
    expectation = strify (DictStrNum {: "a" => 7, "b" => 8, "c" => 9 :}) == "{: \"a\" => 7, \"b\" => 8, \"c\" => 9 :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Str to Num!\n"
    test expectation otherwise

testDictOfStrToStr =
    expectation = strify (DictStrStr {: "a" => "A", "b" => "B", "c" => "C" :}) == "{: \"a\" => \"A\", \"b\" => \"B\", \"c\" => \"C\" :}"
    otherwise = "\n🚨 Strify does not work on Dicts of Str to Str!\n"
    test expectation otherwise
