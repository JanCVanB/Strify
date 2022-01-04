# Strify

A [Roc](https://roc-lang.org) library for converting things to `Str`

## Usage

See [`./example.roc`](https://github.com/JanCVanB/Strify/blob/main/example.roc):
```
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
```

Output:
```
[nix-shell:~/code/Strify]$ ./roc/target/release/roc example.roc
🔨 Rebuilding host... Done!
"Six"
True
6
["Strify", "likes", "Strs"]
[True, False, True]
[1, 2, 3]
[["Strify"], ["likes"], ["Strs"]]
[[True], [False], [True]]
[[1], [2], [3]]
:)
```


## Why the tag?

The `Str` / `ListBool` / `ListListNum` tag before your data is (unfortunately) necessary.

Roc doesn't support type introspection,
and [abilities](https://roc.zulipchat.com/#narrow/stream/304641-ideas/topic/Abilities/near/259248567) aren't implemented yet
(when they are, [`Str`-ification might be supported natively](https://docs.google.com/document/d/1kUh53p1Du3fWP_jZp-sdqwb5C9DuS43YJwXHg1NzETY/edit#heading=h.y8k2p5snq1la)).
Therefore, Strify can only support specific input types and needs you to tell it your data's type.

## Supported input types

### `Str`

```coffee
strify (Str "") == "\"\""
strify (Str "Text") == "\"Text\""
```

### `Bool`

```coffee
strify (Bool False) == "False"
strify (Bool True) == "True"
```

### `Num`

```coffee
strify (Num 0) == "0"
strify (Num 6) == "6"
```

### `List Str`

```coffee
strify (ListStr []) == "[]"
strify (ListStr ["a", "b", "c"]) == "[\"a\", \"b\", \"c\"]"
```

### `List Bool`

```coffee
strify (ListBool []) == "[[]]"
strify (ListBool [True, False, True]) == "[True, False, True]"
```

### `List Num`

```coffee
strify (ListNum []) == "[]"
strify (ListNum [1, 2, 3]) == "[1, 2, 3]"
```

### `List List Str`

```coffee
strify (ListListStr [[]]) == "[[]]"
strify (ListListStr [["a"], ["b"], ["c"]]) == "[[\"a\"], [\"b\"], [\"c\"]]"
```

### `List List Bool`

```coffee
strify (ListListBool [[]]) == "[[]]"
strify (ListListBool [[True], [False], [True]]) == "[[True], [False], [True]]"
```

### `List List Num`

```coffee
strify (ListListNum [[]]) == "[[]]"
strify (ListListNum [[1], [2], [3]]) == "[[1], [2], [3]]"
```

## Formatting

Formatting mimics the behavior of
[JavaScript's JSON.stringify](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify),
except that `true` and `false` are capitalized.
