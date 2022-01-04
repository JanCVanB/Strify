#!/usr/bin/env roc

app "example"
    packages { pf: "./roc/examples/cli/platform" }
    imports [ pf.Stdout.{ line }, pf.Task.{ await }, Strify.{ strify } ]
    provides [ main ] to pf

main = 
    _ <- await (line (strify (Str "Six")))
    _ <- await (line (strify (Bool True)))
    _ <- await (line (strify (Num 6)))
    _ <- await (line (strify (ListStr ["Strify", "likes", "Strs"])))
    _ <- await (line (strify (ListBool [True, False, True])))
    _ <- await (line (strify (ListNum [1, 2, 3])))
    _ <- await (line (strify (ListListStr [["Strify"], ["likes"], ["Strs"]])))
    _ <- await (line (strify (ListListBool [[True], [False], [True]])))
    _ <- await (line (strify (ListListNum [[1], [2], [3]])))
    line ":)"
