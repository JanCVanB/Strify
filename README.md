# Strify

A [Roc](https://roc-lang.org) library for converting things to `Str`

## Formatting

Formatting mimics the behavior of
[JavaScript's JSON.stringify](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify),
except that `true` and `false` are capitalized.

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
