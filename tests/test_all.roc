#!/usr/bin/env roc

app "test_all"
    packages { pf: "../roc/examples/cli/platform" }
    imports [
        pf.Stdout.{ line },
        pf.Task.{ await },
        TestLists.{ testLists },
        TestNumbers.{ testNumbers },
        TestStrings.{ testStrings },
    ]
    provides [ main ] to pf


main =
    _ <- await (line testStrings)
    _ <- await (line testNumbers)
    _ <- await (line testLists)
    line "Finished running Strify tests."
