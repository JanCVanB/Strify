#!/usr/bin/env roc

app "test_all"
    packages { pf: "../roc/examples/cli/platform" }
    imports [ pf.Stdout.{ line }, pf.Task.{ await }, TestNumbers.{ testNumbers }, TestStrings.{ testStrings } ]
    provides [ main ] to pf


main =
    _ <- await (line testNumbers)
    _ <- await (line testStrings)
    line "Finished running Strify tests."
