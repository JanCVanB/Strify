#!/usr/bin/env roc

app "example"
    packages { pf: "./roc/examples/cli/platform" }
    imports [ pf.Stdout.{ line }, pf.Task.{ await }, Strify.{ strify } ]
    provides [ main ] to pf

main = 
    _ <- await (line (strify (Bool True)))
    _ <- await (line (strify (Num 6)))
    _ <- await (line (strify (Str "Six")))
    _ <- await (line (strify (ListBool [True, False, True])))
    _ <- await (line (strify (ListNum [1, 2, 3])))
    _ <- await (line (strify (ListStr ["Strify", "likes", "Strs"])))
    _ <- await (line (strify (ListListBool [[True], [False], [True]])))
    _ <- await (line (strify (ListListNum [[1], [2], [3]])))
    _ <- await (line (strify (ListListStr [["Strify"], ["likes"], ["Strs"]])))
    _ <- await (line (strify (DictBoolBool {: True => False, False => True :})))
    _ <- await (line (strify (DictBoolNum {: True => 7, False: 8 :})))
    _ <- await (line (strify (DictBoolStr {: True => "A", False => "B" :})))
    _ <- await (line (strify (DictNumBool {: 1 => True, 2 => False, 3 => True :})))
    _ <- await (line (strify (DictNumNum {: 1 => 7, 2 => 8, 3 => 9 :})))
    _ <- await (line (strify (DictNumStr {: 1 => "A", 2 => "B", 3 => "C" :})))
    _ <- await (line (strify (DictStrBool {: "a" => True, "b" => False, "c" => True :})))
    _ <- await (line (strify (DictStrNum {: "a" => 7, "b" => 8, "c" => 9 :})))
    _ <- await (line (strify (DictStrStr {: "a" => "A", "b" => "B", "c" => "C" :})))
    line ":)"
