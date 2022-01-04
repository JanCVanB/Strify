#!/usr/bin/env roc

app "test_all"
    packages { pf: "../roc/examples/cli/platform" }
    imports [
        pf.Stdout.{ line },
        pf.Task.{ await },
        TestBools.{ testBools },
        TestLists.{ testLists },
        TestNums.{ testNums },
        TestStrs.{ testStrs },
    ]
    provides [ main ] to pf


main =
    _ <- await (line testStrs)
    _ <- await (line testBools)
    _ <- await (line testNums)
    _ <- await (line testLists)
    line "Finished running Strify tests."
