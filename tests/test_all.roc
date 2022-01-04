#!/usr/bin/env roc

app "test_all"
    packages { pf: "../roc/examples/cli/platform" }
    imports [
        pf.Stdout.{ line },
        pf.Task.{ await },
        TestBools.{ testBools },
        TestDicts.{ testDicts },
        TestLists.{ testLists },
        TestNums.{ testNums },
        TestStrs.{ testStrs },
    ]
    provides [ main ] to pf


main =
    _ <- await (line testBools)
    _ <- await (line testNums)
    _ <- await (line testStrs)
    _ <- await (line testLists)
    _ <- await (line testDicts)
    line "Finished running Strify tests."
